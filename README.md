# 🌙 Guerrilla Wealth — The Forgotten Code Research Institute

**Created by Jennifer Leigh West**
Mirror Protocol™ (U.S. Copyright Reg. No. 1-14949237971) · MIRA Protocol™ · West Method™

---

## What This Is

A 12-slide immersive web app — entrepreneurial archetype quiz + city-specific guerrilla wealth dashboard. Each slide is a standalone HTML file with its own particle system environment (ocean, mountains, desert, city, forest, void). No frameworks, no build step — pure HTML/CSS/JS.

## File Structure

```
guerrilla-wealth/
├── public/
│   ├── index.html              ← Main app (iframe loader + swipe nav)
│   └── slides/
│       ├── slide-01-splash.html           (Copper void — welcome)
│       ├── slide-02-autumn-quiz1.html     (Autumn forest — Sacred Identity)
│       ├── slide-03-winter-quiz2.html     (Winter ice — Wealth Geography)
│       ├── slide-04-spring-quiz3.html     (Spring bloom — Sacred Capacity)
│       ├── slide-05-summer-plans-generating.html  (Summer — plan picker + generating)
│       ├── slide-06-ocean-overview.html   (Ocean beach — dashboard overview + ON Meter)
│       ├── slide-07-smokies-itinerary.html (Smoky Mountains — daily itinerary)
│       ├── slide-08-desert-venues.html    (Desert night — venue intelligence)
│       ├── slide-09-city-events.html      (City dusk — event cards)
│       ├── slide-10-forest-stickers.html  (Forest canopy — sticker deployment)
│       ├── slide-11-void-account.html     (The void — account/subscription)
│       └── slide-12-receipt-report.html   (Receipt — funnel to services)
├── package.json
├── vercel.json
├── railway.toml
├── Dockerfile
├── .gitignore
└── README.md
```

---

## Local Development

```bash
npm install
npm run dev
# Opens at http://localhost:3000
```

Or just open `public/index.html` in a browser. Each slide also works standalone — open any `slide-XX-*.html` directly.

---

## Deployment Options

### Option 1: Vercel (Recommended — Free Tier)

Vercel is the simplest for static HTML. **Important Vercel quirk:** it can render some files from GitHub directly instead of deploying them. To avoid this:

**Method A — Vercel CLI (most reliable):**
```bash
# Install Vercel CLI if you don't have it
npm i -g vercel

# From the project root:
cd guerrilla-wealth
vercel

# Follow prompts:
#   - Link to existing project? No
#   - Project name: guerrilla-wealth
#   - Directory: ./
#   - Override settings? No

# For production:
vercel --prod
```

**Method B — GitHub import (watch for the rendering quirk):**
1. Push to GitHub first (see Git Setup below)
2. Go to https://vercel.com/new
3. Import your repo
4. Settings:
   - Framework Preset: **Other**
   - Build Command: (leave empty)
   - Output Directory: **public**
   - Install Command: (leave empty)
5. Deploy

**If Vercel renders your HTML as raw code instead of a site:**
This happens when Vercel treats .html files as static assets from GitHub. Fix it by:
- Make sure `vercel.json` is in the root (it's already included)
- Use the CLI method instead of GitHub import
- Or add a dummy `build` script that copies files: in package.json change build to `"build": "cp -r public dist"` and set Output Directory to `dist`

**Custom domain:**
```bash
vercel domains add yourdomain.com
```

### Option 2: Railway

```bash
# Install Railway CLI
npm i -g @railway/cli

# Login and init
railway login
railway init

# Deploy
railway up

# Get your URL
railway domain
```

Or connect GitHub repo at https://railway.app/new — it auto-detects the `railway.toml`.

### Option 3: Docker (anywhere)

```bash
# Build
docker build -t guerrilla-wealth .

# Run locally
docker run -p 3000:3000 guerrilla-wealth

# For Railway/Render/Fly.io — they auto-detect the Dockerfile
```

### Option 4: GitHub Pages (free, no backend needed)

Since this is 100% static HTML, GitHub Pages works great:

1. Push to GitHub (see below)
2. Go to repo → Settings → Pages
3. Source: **Deploy from a branch**
4. Branch: **main**, folder: **/public** (or root if you move index.html)
5. Save — your site is at `https://yourusername.github.io/guerrilla-wealth/`

**Note:** If using the `/public` subfolder, you may need to move `index.html` and `slides/` to root level for Pages to serve it correctly. Alternative: use a GitHub Action that publishes the `public` folder.

---

## Git Setup

```bash
cd guerrilla-wealth

git init
git add -A
git commit -m "Guerrilla Wealth v1.0 — 12-slide immersive app"

# Create repo on GitHub (via browser or CLI):
gh repo create guerrilla-wealth --private --source=. --push

# Or manually:
git remote add origin https://github.com/jennaleighwilder/guerrilla-wealth.git
git branch -M main
git push -u origin main
```

---

## Cursor / AI Editor Notes

**For Cursor, Windsurf, or any AI code editor:**

- Each slide is self-contained — edit any single file without breaking others
- The `index.html` loader uses iframes, so slides are fully isolated
- Google Fonts are loaded per-slide (Cinzel, Cormorant Garamond)
- No npm dependencies for the actual app — `serve` is only for local dev
- All animations are pure CSS + vanilla JS (no libraries)
- Particle systems use requestAnimationFrame — they're performant on mobile

**Beta test mode** — Give testers full access + offering tier preview:
- Add `?beta=1` to the URL (e.g. `yoursite.com?beta=1`), or
- Set `BETA_MODE = true` in `public/index.html` (line ~40) to enable for everyone
- Beta testers see "Beta Tester — Full Access" badge, full offering ladder preview, and CTA "Subscribe when ready to go live"
- To turn off beta: remove `?beta=1` from URL or set `BETA_MODE = false`

**Common modifications in Cursor:**
- To change city data: edit slides 06-10 (each has hardcoded Asheville data)
- To change quiz questions and wording: edit slides 02-04 (each has a `QS` array with questions, options, subtitles)
- To change archetype names/descriptions: edit slides 05, 06, 12
- To change pricing/offerings: edit slides 06, 11, 12
- To change contact info: edit slides 11, 12 (email, phone, website)
- To add a new city: duplicate a dashboard slide set (06-10) and change environment + data

**Color variables used across all slides:**
```css
--void: #0d0a0e;      /* Background */
--cream: #f5ede0;      /* Primary text */
--ember: #d4863e;      /* Copper/gold accent */
--copper: #c87030;     /* Darker copper */
--jade: #3a9a7a;       /* Green accent */
--fire: #c45a3a;       /* Red/urgency */
--gold: #e8a95b;       /* Gold highlights */
--dim: #b0a8b8;        /* Muted text */
```

---

## Contact

**Jennifer Leigh West**
The Forgotten Code Research Institute
- Email: theforgottencode780@gmail.com
- Phone: 423-388-8304
- Web: https://jennaleighwilder.github.io/AI-Consulting-/

© 2026 All rights reserved.
