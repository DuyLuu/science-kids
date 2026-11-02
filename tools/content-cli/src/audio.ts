// PCM -> WAV, WAV -> M4A (afconvert, macOS), clip duration (afinfo), sha256 of bytes.
import { execFile } from "node:child_process";
import { createHash } from "node:crypto";
import { readFileSync, writeFileSync } from "node:fs";
import { promisify } from "node:util";

const run = promisify(execFile);

/**
 * AAC-LC mono 64 kbps CBR in an .m4a container, sample rate kept at the source (Kokoro: 24 kHz).
 * Part of the cache key: change anything here and every clip is regenerated.
 */
export const M4A_ENCODING = {
  tool: "afconvert",
  container: "m4af",
  codec: "aac",
  channels: 1,
  bitrate: 64000,
  strategy: "cbr",
  quality: 127,
  pcm: "s16le",
} as const;

/**
 * Same AAC settings, plus the creation/modification times afconvert writes into mvhd/tkhd/mdhd set
 * to 0, so the same PCM always gives the same bytes (and the same sha256). VI since SK-024; EN too
 * since the loudness pass of 1/11, which changed every EN clip anyway.
 */
export const M4A_ENCODING_ZERO_TIMES = { ...M4A_ENCODING, mp4_times: "zeroed" } as const;

/** Sets the times of mvhd/tkhd/mdhd to 0 (version 0: 32-bit, version 1: 64-bit). Returns how many boxes were changed. */
export function zeroMp4Times(bytes: Buffer): number {
  let changed = 0;
  const walk = (start: number, end: number) => {
    let offset = start;
    while (offset + 8 <= end) {
      let size = bytes.readUInt32BE(offset);
      const type = bytes.toString("latin1", offset + 4, offset + 8);
      let header = 8;
      if (size === 1) {
        size = Number(bytes.readBigUInt64BE(offset + 8));
        header = 16;
      } else if (size === 0) {
        size = end - offset;
      }
      if (size < header || offset + size > end) break;
      if (type === "mvhd" || type === "tkhd" || type === "mdhd") {
        const body = offset + header;
        const width = bytes[body] === 1 ? 8 : 4;
        bytes.fill(0, body + 4, body + 4 + 2 * width);
        changed++;
      } else if (type === "moov" || type === "trak" || type === "mdia") {
        walk(offset + header, offset + size);
      }
      offset += size;
    }
  };
  walk(0, bytes.length);
  return changed;
}

export function afconvertArgs(input: string, output: string): string[] {
  const { container, codec, channels, bitrate, quality } = M4A_ENCODING;
  // -s 0 = CBR
  return ["-f", container, "-d", codec, "-c", String(channels), "-b", String(bitrate), "-s", "0", "-q", String(quality), input, output];
}

/** 16-bit PCM mono WAV. Float samples are clipped to [-1, 1]. */
export function wavFromFloat(samples: Float32Array, sampleRate: number): Buffer {
  const data = Buffer.alloc(samples.length * 2);
  for (let i = 0; i < samples.length; i++) {
    const s = Math.max(-1, Math.min(1, samples[i]!));
    data.writeInt16LE(Math.round(s < 0 ? s * 0x8000 : s * 0x7fff), i * 2);
  }
  return wavFromPcm16(data, sampleRate);
}

/** WAV file around raw 16-bit little-endian mono PCM. */
export function wavFromPcm16(data: Buffer, sampleRate: number): Buffer {
  const header = Buffer.alloc(44);
  header.write("RIFF", 0, "ascii");
  header.writeUInt32LE(36 + data.length, 4);
  header.write("WAVE", 8, "ascii");
  header.write("fmt ", 12, "ascii");
  header.writeUInt32LE(16, 16); // fmt chunk size
  header.writeUInt16LE(1, 20); // PCM
  header.writeUInt16LE(1, 22); // mono
  header.writeUInt32LE(sampleRate, 24);
  header.writeUInt32LE(sampleRate * 2, 28); // byte rate
  header.writeUInt16LE(2, 32); // block align
  header.writeUInt16LE(16, 34); // bits per sample
  header.write("data", 36, "ascii");
  header.writeUInt32LE(data.length, 40);
  return Buffer.concat([header, data]);
}

/** PCM data of a 16-bit mono WAV, walking the chunks (afconvert adds a FLLR padding chunk and uses WAVE_FORMAT_EXTENSIBLE). */
export function pcm16FromWav(wav: Buffer): { data: Buffer; sampleRate: number } {
  if (wav.toString("ascii", 0, 4) !== "RIFF" || wav.toString("ascii", 8, 12) !== "WAVE") throw new Error("không phải file WAV");
  let offset = 12;
  let sampleRate = 0;
  while (offset + 8 <= wav.length) {
    const id = wav.toString("ascii", offset, offset + 4);
    const size = wav.readUInt32LE(offset + 4);
    const body = offset + 8;
    if (id === "fmt ") {
      // 0xFFFE = WAVE_FORMAT_EXTENSIBLE (what afconvert writes): the real format is the first
      // two bytes of the SubFormat GUID.
      const tag = wav.readUInt16LE(body);
      const format = tag === 0xfffe && size >= 40 ? wav.readUInt16LE(body + 24) : tag;
      const channels = wav.readUInt16LE(body + 2);
      const bits = wav.readUInt16LE(body + 14);
      if (format !== 1 || channels !== 1 || bits !== 16) throw new Error(`WAV cần PCM 16-bit mono (đang: format ${format}, ${channels} kênh, ${bits} bit)`);
      sampleRate = wav.readUInt32LE(body + 4);
    } else if (id === "data") {
      if (!sampleRate) throw new Error("WAV: chunk data đứng trước fmt");
      return { data: wav.subarray(body, body + size), sampleRate };
    }
    offset = body + size + (size % 2);
  }
  throw new Error("WAV không có chunk data");
}

/** m4a -> 16-bit mono WAV with Apple's decoder (honours the priming/remainder info, so the length equals afinfo's duration). */
export async function decodeToWav(m4aPath: string, wavPath: string): Promise<void> {
  await run("afconvert", ["-f", "WAVE", "-d", "LEI16", "-c", "1", m4aPath, wavPath]);
}

export function concatFloat(parts: Float32Array[]): Float32Array {
  const out = new Float32Array(parts.reduce((sum, part) => sum + part.length, 0));
  let offset = 0;
  for (const part of parts) {
    out.set(part, offset);
    offset += part.length;
  }
  return out;
}

export async function encodeM4a(wavPath: string, m4aPath: string, options: { zeroTimes?: boolean } = {}): Promise<void> {
  await run("afconvert", afconvertArgs(wavPath, m4aPath));
  if (options.zeroTimes) {
    const bytes = readFileSync(m4aPath);
    if (zeroMp4Times(bytes) !== 3) throw new Error(`${m4aPath}: không thấy đủ 3 hộp mvhd/tkhd/mdhd để xoá ngày giờ`);
    writeFileSync(m4aPath, bytes);
  }
}

/** Duration from the packet table (exact, priming excluded), in ms. */
export async function durationMs(file: string): Promise<number> {
  const { stdout } = await run("afinfo", [file]);
  const match = stdout.match(/estimated duration:\s*([\d.]+)\s*sec/);
  if (!match) throw new Error(`afinfo không đọc được thời lượng của ${file}`);
  return Math.round(Number(match[1]) * 1000);
}

export function sha256Bytes(bytes: Buffer | Uint8Array | string): string {
  return createHash("sha256").update(bytes).digest("hex");
}

export function sha256OfFile(file: string): string {
  return sha256Bytes(readFileSync(file));
}

/** Fail early with a clear message if a required macOS / ffmpeg tool is missing. */
export async function requireTool(name: string, args: string[], hint: string): Promise<void> {
  try {
    await run(name, args);
  } catch (error) {
    if ((error as NodeJS.ErrnoException).code === "ENOENT") throw new Error(`thiếu công cụ "${name}": ${hint}`);
    // afconvert -h exits non-zero but exists; any other failure is fine here.
  }
}
