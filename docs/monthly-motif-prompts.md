# Monthly Motif Illustration Prompts

**Purpose:** Generate 10 monthly motif images (March–December) for the calendar's right-side decoration.
**Reference:** The horse image (`prototypes/assets/horse.jpg`) is the quality and style target.

---

## Technical Specs

| Property | Value |
|----------|-------|
| **Dimensions** | 1024×1024 px (square — will be displayed at 54–60px in the app, so it must read well at small size) |
| **Format** | PNG with transparent background (preferred) or JPG on cream `#FAF3E0` background |
| **Color** | Single flat color: deep cinnabar red `#A52422` (or close to it — dark vermillion) on cream/transparent |
| **Style** | Chinese paper-cut (剪纸 jianzhi) meets modern graphic design — see style notes below |
| **Complexity** | Simple enough to be recognizable at 54px. One subject, no background clutter |

---

## Style Notes (matching the horse reference)

The horse image has a very specific style that all monthly motifs must match:

1. **Flat silhouette** — The subject is a single solid-fill shape in cinnabar red. No gradients, no shading, no outlines.
2. **Negative-space cuts** — Internal details are created by cutting away parts of the silhouette (like paper-cut art), revealing the cream background beneath. This is how the horse's mane, legs, and body are articulated.
3. **Calligraphic fluidity** — The shapes have the flowing, brush-like quality of Chinese calligraphy. Curves are organic, not geometric. Edges taper like brush strokes.
4. **Character fusion** — The horse cleverly merges the animal silhouette with the Chinese character 马 (horse). For the monthly motifs, this exact technique is NOT required — but the shapes should feel like they *could* be Chinese characters. Organic, calligraphic, connected.
5. **Dynamic composition** — The horse is in motion. Each monthly motif should have life and movement, not be static or symmetrical. A branch should curve, a flower should tilt, a bird should be mid-flight.
6. **No outlines** — Everything is defined by the silhouette edge and the negative-space cuts. Never a thin outline around the subject.
7. **Minimal detail** — Details are suggested, not drawn. A few strategic cuts convey the entire subject. Less is more.
8. **Cream background** — The subject sits on a warm cream `#FAF3E0` background with no additional elements, borders, or decorations.

---

## Base Prompt Template

Use this as the base and replace `[SUBJECT]` and `[DESCRIPTION]` for each month:

```
Chinese paper-cut art style (剪纸 jianzhi), [SUBJECT], [DESCRIPTION]. Single flat silhouette in deep cinnabar red (#A52422) on a plain warm cream background (#FAF3E0). No outlines — details created only through negative-space cuts in the silhouette, like traditional Chinese paper cutting. Calligraphic flowing edges, organic brush-stroke-like curves. Dynamic composition with movement and life. Minimal detail — a few strategic cutouts suggest the full form. No gradients, no shading, no additional colors, no border, no text, no decorative frame. Modern graphic design meets traditional Chinese folk art. Clean, elegant, simple enough to be recognizable at small size.
```

**Negative prompt (if supported):**
```
outline, border, frame, circle, gradient, shading, multiple colors, text, watermark, detailed, realistic, 3D, shadow, glow, pattern background, busy, cluttered, symmetrical
```

---

## Per-Month Prompts

### MARCH — Peach Blossom (桃花)
```
Chinese paper-cut art style (剪纸 jianzhi), a single peach blossom branch with 2-3 open flowers and small buds. Single flat silhouette in deep cinnabar red (#A52422) on a plain warm cream background (#FAF3E0). No outlines — details created only through negative-space cuts in the silhouette, like traditional Chinese paper cutting. The branch curves diagonally with calligraphic flowing edges. Petals are simple rounded shapes with negative-space cuts suggesting petal separation. A few falling petals add movement. Minimal detail — organic brush-stroke-like curves. No gradients, no shading, no additional colors, no border, no text. Modern graphic design meets traditional Chinese folk art. Clean, elegant, recognizable at small size.
```

### APRIL — Peony (牡丹)
```
Chinese paper-cut art style (剪纸 jianzhi), a single peony flower in full bloom with two large leaves. Single flat silhouette in deep cinnabar red (#A52422) on a plain warm cream background (#FAF3E0). No outlines — details created only through negative-space cuts in the silhouette, like traditional Chinese paper cutting. The petals layer and overlap, with negative-space cuts between them suggesting depth and lushness. Calligraphic flowing edges, the leaves curve naturally. Dynamic composition — the flower faces slightly to one side, not perfectly centered. Minimal detail, organic curves. No gradients, no shading, no additional colors, no border, no text. Modern graphic design meets traditional Chinese folk art.
```

### MAY — Pomegranate (石榴)
```
Chinese paper-cut art style (剪纸 jianzhi), a pomegranate fruit splitting open to reveal seeds, on a short branch with a few leaves. Single flat silhouette in deep cinnabar red (#A52422) on a plain warm cream background (#FAF3E0). No outlines — details created only through negative-space cuts in the silhouette. The split pomegranate shows small round negative-space dots for the seeds. The branch and leaves have calligraphic flowing edges. Dynamic composition with the fruit slightly tilted. Minimal detail, organic curves. No gradients, no shading, no additional colors, no border, no text. Modern graphic design meets traditional Chinese folk art.
```

### JUNE — Lotus (莲花)
```
Chinese paper-cut art style (剪纸 jianzhi), a single lotus flower rising from a large round lotus leaf, with a curved stem. Single flat silhouette in deep cinnabar red (#A52422) on a plain warm cream background (#FAF3E0). No outlines — details created only through negative-space cuts in the silhouette. The lotus petals are layered with elegant negative-space separations. The large round leaf below has a few vein cuts. A single seed pod or bud adds compositional balance. Calligraphic flowing curves. Dynamic, not symmetrical. Minimal detail. No gradients, no shading, no additional colors, no border, no text. Modern graphic design meets traditional Chinese folk art.
```

### JULY — Cicada on Branch (蝉)
```
Chinese paper-cut art style (剪纸 jianzhi), a cicada perched on a thin branch with two leaves, wings slightly spread. Single flat silhouette in deep cinnabar red (#A52422) on a plain warm cream background (#FAF3E0). No outlines — details created only through negative-space cuts in the silhouette. The cicada's transparent wings are suggested by delicate negative-space cuts. The branch curves with calligraphic fluidity. Dynamic composition — the insect is alive, not pinned. Minimal detail, organic curves. No gradients, no shading, no additional colors, no border, no text. Modern graphic design meets traditional Chinese folk art.
```

### AUGUST — Wild Goose in Flight (鸿雁)
```
Chinese paper-cut art style (剪纸 jianzhi), a single wild goose in flight with wings fully spread, a few reed or cloud wisps below. Single flat silhouette in deep cinnabar red (#A52422) on a plain warm cream background (#FAF3E0). No outlines — details created only through negative-space cuts in the silhouette. The wing feathers are suggested by a few strategic cuts. The goose has the dynamic sweep of Chinese brush painting. Calligraphic flowing edges, powerful movement from left to right. Minimal detail. No gradients, no shading, no additional colors, no border, no text. Modern graphic design meets traditional Chinese folk art.
```

### SEPTEMBER — Osmanthus & Moon (桂花)
```
Chinese paper-cut art style (剪纸 jianzhi), a branch of osmanthus (sweet olive) with clusters of tiny flowers, and a crescent moon shape behind it. Single flat silhouette in deep cinnabar red (#A52422) on a plain warm cream background (#FAF3E0). No outlines — details created only through negative-space cuts in the silhouette. The tiny osmanthus flowers are suggested by small round negative-space dots in clusters. The crescent moon is a simple curved negative-space cut. The branch curves elegantly. Calligraphic flowing edges. Minimal detail. No gradients, no shading, no additional colors, no border, no text. Modern graphic design meets traditional Chinese folk art.
```

### OCTOBER — Chrysanthemum (菊花)
```
Chinese paper-cut art style (剪纸 jianzhi), a single chrysanthemum flower viewed from the front, with long curving petals radiating outward, and two leaves below. Single flat silhouette in deep cinnabar red (#A52422) on a plain warm cream background (#FAF3E0). No outlines — details created only through negative-space cuts in the silhouette. The many petals create a radiating pattern with elegant negative-space cuts between them. Calligraphic flowing edges on the leaves. Dynamic — slightly off-center, one leaf larger than the other. Minimal detail. No gradients, no shading, no additional colors, no border, no text. Modern graphic design meets traditional Chinese folk art.
```

### NOVEMBER — Camellia (山茶)
```
Chinese paper-cut art style (剪纸 jianzhi), a camellia flower with thick rounded petals and glossy dark leaves on a short branch. Single flat silhouette in deep cinnabar red (#A52422) on a plain warm cream background (#FAF3E0). No outlines — details created only through negative-space cuts in the silhouette. The camellia's thick petals are defined by wide negative-space cuts. The waxy leaves have clean, bold curves. The branch is short and sturdy. Calligraphic flowing edges. Dynamic composition. Minimal detail. No gradients, no shading, no additional colors, no border, no text. Modern graphic design meets traditional Chinese folk art.
```

### DECEMBER — Plum Blossom (梅花)
```
Chinese paper-cut art style (剪纸 jianzhi), a gnarled plum blossom branch with 3-4 five-petal flowers and several buds. Single flat silhouette in deep cinnabar red (#A52422) on a plain warm cream background (#FAF3E0). No outlines — details created only through negative-space cuts in the silhouette. The old branch is angular and knotted (unlike the smooth curves of spring flowers), contrasting with the delicate round blossoms. Each five-petal flower has small negative-space cuts between petals. Stamens suggested by tiny dots. Calligraphic flowing edges on the branch. Dynamic diagonal composition. Minimal detail. No gradients, no shading, no additional colors, no border, no text. Modern graphic design meets traditional Chinese folk art.
```

---

## Post-Generation Checklist

After generating, verify each image against these criteria:

- [ ] Single color only (cinnabar red on cream/transparent) — no other colors crept in
- [ ] No outlines — all detail is via silhouette edge and negative-space cuts
- [ ] Recognizable at 54px — zoom out and squint-test
- [ ] Dynamic, not static or symmetrical
- [ ] Calligraphic edge quality — flowing, not geometric
- [ ] No text, watermarks, borders, or frames
- [ ] Style cohesion with the horse reference image
- [ ] Clean background (no artifacts, textures, or patterns)

## Notes

- If the LLM adds outlines despite instructions, try adding "paper-cut silhouette only, no line art" to the prompt
- If colors are wrong, try "monochrome dark red" or "single color vermillion"
- The horse image was likely generated or designed separately — perfect style match may require a few iterations per motif
- Consider generating 3–4 variants per month and picking the best one
