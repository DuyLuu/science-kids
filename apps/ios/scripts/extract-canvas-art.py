"""Extract paper-cut art from the Discoverer canvas into SVG imagesets (SK-011).

Removes the paperE filter (CoreSVG has no feTurbulence/feDisplacementMap; the app draws a drop
shadow instead) and HTML-only attributes. Run again after the designer changes the art:

    python3 apps/ios/scripts/extract-canvas-art.py

(from the repo root; writes apps/ios/ScienceKids/Resources/Assets.xcassets/Art).
"""
import json, os, re, sys

here = os.path.dirname(os.path.abspath(__file__))
repo = sys.argv[1] if len(sys.argv) > 1 else os.path.normpath(os.path.join(here, '..', '..', '..'))
out = sys.argv[2] if len(sys.argv) > 2 else os.path.join(here, '..', 'ScienceKids', 'Resources', 'Assets.xcassets', 'Art')
canvas = os.path.join(repo, 'design/play-ui/project')

def read(name):
    return open(os.path.join(canvas, name), encoding='utf-8').read()

def svgs(html, open_tag_pattern):
    """Every <svg ...>...</svg> whose opening tag matches the pattern (no nested svg in these)."""
    found = []
    for m in re.finditer(r'<svg\b[^>]*>', html):
        if re.search(open_tag_pattern, m.group(0)):
            end = html.index('</svg>', m.end())
            found.append((m.group(0), html[m.end():end]))
    return found

def clean(inner):
    inner = re.sub(r'\sfilter="url\(#paperE\)"', '', inner)
    inner = re.sub(r'\sclass="[^"]*"', '', inner)
    inner = re.sub(r'\sstyle="[^"]*"', '', inner)
    inner = re.sub(r'\saria-[a-z]+="[^"]*"', '', inner)
    inner = re.sub(r'\srole="[^"]*"', '', inner)
    inner = re.sub(r'></(rect|circle|ellipse|path)>', '/>', inner)
    return inner.strip()

def attr(tag, name):
    m = re.search(r'\b%s="([^"]*)"' % name, tag)
    return m.group(1) if m else None

def write(name, tag, inner, width=None, height=None, defs=''):
    w = width or attr(tag, 'width'); h = height or attr(tag, 'height')
    vb = attr(tag, 'viewBox') or '0 0 %s %s' % (w, h)
    svg = ('<svg xmlns="http://www.w3.org/2000/svg" width="%s" height="%s" viewBox="%s">\n'
           '<!-- From design/play-ui/project (Discoverer canvas), paperE filter removed: SK-011. -->\n%s%s\n</svg>\n') % (w, h, vb, defs, clean(inner))
    d = os.path.join(out, name + '.imageset')
    os.makedirs(d, exist_ok=True)
    fname = name + '.svg'
    open(os.path.join(d, fname), 'w', encoding='utf-8').write(svg)
    json.dump({'images': [{'filename': fname, 'idiom': 'universal'}],
               'info': {'author': 'xcode', 'version': 1},
               'properties': {'preserves-vector-representation': True}},
              open(os.path.join(d, 'Contents.json'), 'w'), indent=2)
    print('wrote', name, vb)

welcome = read('Discoverer-Welcome.dc.html')
(hills,) = svgs(welcome, r'width="350" height="166"')
write('ArtWelcomeHills', *hills)
(mark,) = svgs(welcome, r'width="44" height="44" viewBox="0 0 44 44"')
write('ArtBrandMark', *mark)
(mascot,) = svgs(welcome, r'viewBox="0 0 100 100"')
write('ArtMascot', *mascot)

profile = read('Discoverer-Profile.dc.html')
avatars = svgs(profile, r'viewBox="0 0 60 60"')
assert len(avatars) == 6, len(avatars)
for name, art in zip(['Ca', 'Ech', 'Ga', 'Meo', 'Chim', 'Trau'], avatars):
    write('Avatar' + name, *art)

home = read('Discoverer-Home.dc.html')
(bowl,) = svgs(home, r'viewBox="14 10 92 80"')
write('ArtTopicBowl', *bowl)

# SK-012: the child Na who speaks in the misconception question (`speaker: na`).
myth = read('Discoverer-QuizMyth.dc.html')
(na,) = svgs(myth, r'aria-label="Bạn Na"')
# The canvas keeps the clip of Na's face in a shared <defs>; copy it in.
clip = re.search(r'<clipPath id="naClip">.*?</clipPath>', myth).group(0)
write('ArtSpeakerNa', *na, defs='<defs>%s</defs>\n' % clean(clip))

json.dump({'info': {'author': 'xcode', 'version': 1}}, open(os.path.join(out, 'Contents.json'), 'w'), indent=2)
