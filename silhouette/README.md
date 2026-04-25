<div align="left">
  <img src="./app-icon.png" alt="Silhouette Icon" width="256" height="256">
</div>

# Silhouette Support

Welcome to Silhouette support! This repository is dedicated to help you get the most out of Silhouette and resolve any issues you might encounter.

## Table of Contents

- [Getting Help](#getting-help)
- [Frequently Asked Questions](#frequently-asked-questions)
- [Reporting Issues](#reporting-issues)
- [Feature Requests](#feature-requests)
- [Getting Started](#getting-started)
- [Models](#models)
- [Free vs Pro](#free-vs-pro)
- [Tips & Best Practices](#tips--best-practices)
- [Privacy & Security](#privacy--security)
- [Contact](#contact)

## Getting Help

If you need help with Silhouette, here are your options:

1. **Check the FAQ** below for common questions and answers
2. **Search existing issues** to see if your question has been answered
3. **Open a new issue** if you can't find what you're looking for
4. **Press ⌘/** in the app to view the built-in help screen

## Frequently Asked Questions

### What is Silhouette?

Silhouette is a native macOS app for removing backgrounds from photos — cleanly, privately, and in bulk. Drop a folder of product shots, portraits, or reference images into a collection, pick a model, tune the edges, and export hundreds of transparent cutouts (or images composited on a solid background) without sending a single pixel to the cloud.

### Who is Silhouette for?

Silhouette is built for people who need **a lot** of cutouts and care about **how they look**:

- **E-commerce & product photography** — turn raw product shots into catalog-ready PNGs on white, black, or custom-brand backgrounds.
- **Designers & creative pros** — extract subjects for compositing, mockups, moodboards, and editorial work.
- **Photographers** — matte hair and fur cleanly on portrait and pet sessions without bouncing between Photoshop and a web tool.
- **Studios & agencies** — process a shoot's worth of images in one run with consistent settings.

It is not a one-click consumer toy. It is a workstation tool for people who understand image matting and want control over the result.

### Does Silhouette run on-device?

Yes — **100% on-device**. Every model runs locally using Apple Vision, Core ML, and MLX Swift (Apple's ML framework for Apple Silicon). Silhouette takes full advantage of the Neural Engine and GPU on modern Macs. Your images, your client's unreleased product photos, and your credentials-of-no-kind-because-there-are-no-credentials never leave your machine.

### What models are available?

Four on-device models, each tuned for a different job:

| Model             | Best for                     | Notes                                                 |
| ----------------- | ---------------------------- | ----------------------------------------------------- |
| **Apple Vision**  | Fast, general subjects       | Always available offline; built into macOS            |
| **IS-Net (DIS)**  | General-purpose matting      | 1024×1024 · strong on complex shapes · ~80 MB         |
| **MODNet**        | Portraits and hair           | Lightweight, trimap-free · tuned for people · ~26 MB  |
| **BiRefNet**      | State-of-the-art edges       | Highest quality · fine edges and translucency · ~440 MB |

Apple Vision is available immediately. The other three are optional downloads you fetch only if you need them, from a CDN with verified SHA-256 checksums.

### How do I get started?

1. **Create a collection** from the sidebar — drop images, a folder, or use the **+** button.
2. **Pick a model** in the toolbar. Matte models produce soft edges; Apple Vision isolates discrete subjects.
3. **Select an image** to preview the cutout. Adjust threshold, background, and edge controls inline.
4. **Run Batch** (Pro) to process the whole collection in one go.
5. **Export** — choose format (PNG / JPEG / HEIC), background mode (transparent / white / black / custom hex), suffix, and destination.

### What are Flip TTA, edge refinement, and matte gamma?

The advanced dials for matte models (in the Tune popover):

- **Flip TTA** — test-time augmentation. Runs the model on both the original and horizontally-flipped image, then averages the results. Cleaner edges on hair and fur at the cost of doubling inference time.
- **Edge Refinement** — snaps the mask to the real image edge using a guided filter. Higher values blend more of the RGB-guided refined matte over the model's raw matte.
- **Matte Gamma** — non-linear tonal curve applied to the matte before thresholding. Values below 1.0 sharpen the edge; above 1.0 softens it.
- **Threshold** — the soft cutoff applied to the alpha channel. Lower = more included; higher = stricter.

Apple Vision ignores these (it's a discrete, not soft, segmenter).

### What is the Instance Picker?

For multi-object scenes, the Instance Picker lets you click directly on a subject in the preview to include or exclude it — so you get exactly the subject you want, not whatever a black-box classifier guessed. Available on models that return per-instance masks.

### What export formats does Silhouette support?

- **PNG** — with or without transparency. Lossless.
- **JPEG** — smaller files, no transparency (use with solid or custom background).
- **HEIC** — modern Apple format, with transparency support. Smallest files for complex images.

Backgrounds: transparent, white, black, or any custom hex color. You can also preserve the source folder structure when exporting a collection with nested subfolders.

### Why is BiRefNet so much bigger than the others?

BiRefNet is a much larger and more capable model (~440 MB vs ~26 MB for MODNet). It uses a bilateral reference network for dichotomous segmentation at 1024×1024 and produces state-of-the-art results on fine edges, hair, and translucent subjects. If you don't need that quality, skip it — MODNet or IS-Net DIS handle most jobs beautifully at a fraction of the download.

### How do I uninstall a model I no longer need?

Open **Settings → Models**, find the model in the list, and click the trash icon. The weights are removed from disk immediately. Re-download at any time from the same screen.

### Does Silhouette require internet access?

Only for the **initial model download**. Apple Vision requires no download and works offline from day one. Once you've downloaded the matte models you want, Silhouette runs entirely offline — no telemetry, no license-check calls, no cloud.

### What macOS version is required?

Silhouette requires **macOS 26 (Tahoe) or later**, running on an Apple Silicon or Intel Mac. Apple Silicon is strongly recommended for BiRefNet and MODNet — the MLX framework targets the unified-memory GPU and Neural Engine on M-series chips.

### How much does Silhouette cost?

Silhouette is **free to download** and free for single-image processing with every model. A one-time **Pro unlock** (in-app purchase) enables batch processing across collections — see [Free vs Pro](#free-vs-pro) below. Pro is tied to your Apple ID and works on every Mac signed into the same account.

## Reporting Issues

Found a bug? Please help us improve Silhouette by reporting it!

### Before Reporting

1. **Update to the latest version** — your issue might already be fixed
2. **Search existing issues** — someone might have already reported it
3. **Try to reproduce** — can you make it happen consistently?
4. **Check the Console** — open Console.app and filter for `Silhouette` to see error logs

### Creating a Good Issue Report

When reporting a bug, please include:

- **Silhouette version** (found in About Silhouette or the Help screen)
- **macOS version** (e.g., macOS 26.1)
- **Mac model** (e.g., MacBook Pro M3, Mac Studio M2 Max, Mac mini Intel)
- **Model used** (Apple Vision, IS-Net DIS, MODNet, or BiRefNet)
- **Steps to reproduce** the issue
- **Expected behavior** — what should happen?
- **Actual behavior** — what actually happened?
- **Screenshots** — before / after cutouts are especially helpful for edge-quality issues
- **Console logs** — filter for `Silhouette` in Console.app

> 💡 The easiest way is to use **Help → Report an Issue** (or the "Report an Issue" button on the Help screen). It opens a pre-filled GitHub issue with your app version, macOS version, and Mac model already included.

**Example:**

```markdown
**Silhouette Version:** 1.0.0
**macOS Version:** 26.1
**Mac:** MacBook Pro M3 (16 GB)
**Model:** BiRefNet

**Steps to Reproduce:**

1. Create a collection with 200 portraits
2. Set Edge Refinement to 2.0, Matte Gamma to 0.9
3. Run Batch

**Expected:** All 200 images processed with refined edges
**Actual:** Images 173–200 fail with "out of memory" after ~15 minutes

**Console Logs:**
[Paste relevant console output]
```

## Feature Requests

Have an idea to make Silhouette better? We'd love to hear it!

When suggesting a feature:

1. **Check existing feature requests** — use the search function
2. **Describe the use case** — what are you trying to achieve?
3. **Provide examples** — sample images, reference tools, or mockups help
4. **Explain the benefit** — how does this help other users?

Edge-quality reports are especially welcome — if a specific type of subject (fur, hair, feathers, translucent objects, glass) is giving a model trouble, a small before/after comparison goes a long way.

## Getting Started

### Installation

1. Download Silhouette from the Mac App Store
2. Launch Silhouette from Applications
3. (Optional) Open **Settings → Models** and download the matte models you want — Apple Vision is available immediately with no download

### First Use

1. Click the **+** button in the sidebar to create your first collection
2. Drag images or a folder into the collection
3. Pick a model from the toolbar
4. Click any image to preview the cutout and adjust the threshold, background, or Tune settings inline
5. Export a single image from the toolbar — or unlock Pro to run Batch across the whole collection

### Keyboard Shortcuts

| Shortcut | Action            |
| -------- | ----------------- |
| **⌘,**   | Open Settings     |
| **⌘/**   | Open Help         |
| **⌘=**   | Zoom in (preview) |
| **⌘-**   | Zoom out (preview)|
| **⌘0**   | Fit preview       |
| **⌘Q**   | Quit Silhouette   |

### Preview Gestures

| Gesture                    | Action                          |
| -------------------------- | ------------------------------- |
| Scroll                     | Pan                             |
| **⌥** + scroll             | Zoom, anchored on cursor        |
| Hover                      | Loupe magnifier (toggleable)    |
| Click (with picker on)     | Select instance in multi-object scene |

## Models

### Apple Vision

- Built into macOS via the Vision framework
- Always available offline — no download required
- Instant inference, low CPU/GPU cost
- Discrete (hard-edge) segmentation; coarser on hair and fine edges
- Best for: quick batches, product shots with hard edges, previews

### IS-Net DIS

- Dichotomous Image Segmentation (Qin et al., 2022)
- 1024×1024 input, ~80 MB download
- General-purpose, strong on complex shapes and non-portrait subjects
- License: Apache 2.0
- Best for: products, objects, architecture, mixed content

### MODNet

- Trimap-Free Portrait Matting (Ke et al., 2022)
- Lightweight MLX model, ~26 MB download
- Tuned specifically for people — efficient on faces and hair
- License: Apache 2.0
- Best for: portraits, headshots, pet photos

### BiRefNet

- Bilateral Reference Network (Zheng et al., 2024)
- 1024×1024 input, ~440 MB download
- State-of-the-art edges for dichotomous segmentation
- License: MIT
- Best for: fine hair/fur, translucent objects, anything where edge quality matters more than speed

## Free vs Pro

Silhouette is free to download. A one-time **Pro** in-app purchase unlocks batch processing. Pro is tied to your Apple ID and works on all your Macs signed into the same account.

### Free

- ✅ All four models (Apple Vision, IS-Net DIS, MODNet, BiRefNet)
- ✅ Single-image processing with full preview and Tune controls
- ✅ Adjust threshold, edge refinement, matte gamma, Flip TTA
- ✅ Instance Picker for multi-object scenes
- ✅ Export single cutouts to PNG, JPEG, or HEIC
- ✅ Transparent or solid/custom-color backgrounds
- ✅ Collections for organizing images (browse-only)

### Pro

Everything in Free, plus:

- 🔓 **Run Batch** on any collection — process the full set in one click
- 🔓 Unlimited images per batch run
- 🔓 Regenerate outdated results in bulk when you change settings
- 🔓 Batch export to a custom folder with preserved subfolder structure
- 🔓 All future Pro features

> 🔁 **Family Sharing:** once enabled by the developer, your Pro unlock can be shared with up to five family members in your Family Sharing group.

## Tips & Best Practices

### Pick the Right Model for the Job

Not every cutout needs BiRefNet. For product shots with hard edges, **Apple Vision** is instant and free. For portraits, **MODNet** is fast and excellent on hair. Reach for **BiRefNet** when edge quality really matters — fine hair, fur, feathers, translucent objects. Matching the model to the subject saves time and disk.

### Preview Before You Batch

Always select one representative image and dial in your settings (threshold, edge refinement, gamma, background) before running a batch. Re-running a batch on 500 images because the threshold was too high is a slow way to learn what a good threshold looks like.

### Use Flip TTA Sparingly

Flip TTA roughly doubles inference time per image. It's worth it for hero shots and portraits with complex hair, but on a 500-image catalog run it adds up. Turn it on per-image via the Tune popover, or leave it off for bulk runs where you value throughput.

### Cache-Aware Iteration

Silhouette caches results per image. When you change a setting (threshold, background, gamma), only affected images are marked **Outdated** — everything else stays **Done**. Use this to iterate quickly: change one dial, re-run, inspect, repeat. You never pay for re-processing images whose result hasn't changed.

### Preserve Folder Structure on Export

For collections built from nested folders (e.g. `SKU-001/front.jpg`, `SKU-001/back.jpg`), toggle **Preserve folder structure** in the Export sheet to mirror the source layout under your destination. Great for catalog workflows where downstream tools expect a specific folder tree.

### Match Background to Your Delivery Format

- **Transparent PNG** — for compositing, design, and any workflow where you'll place the subject on arbitrary backgrounds
- **Solid white JPEG** — for catalog listings on white-background marketplaces (Amazon, Shopify defaults)
- **Custom hex** — for brand-colored product shots matched to a specific color system
- **HEIC** — for archival or file-size-sensitive workflows where Apple-ecosystem compatibility is fine

## Privacy & Security

### What Silhouette Does

- ✅ Runs every model on your Mac using Apple Vision, Core ML, and MLX Swift
- ✅ Reads images from locations you explicitly choose
- ✅ Writes cutouts to destinations you explicitly choose
- ✅ Downloads ML models from the developer's CDN with verified SHA-256 checksums
- ✅ Runs entirely in the macOS App Sandbox

### What Silhouette Does NOT Do

- ❌ Never uploads your images to any server — not for inference, not for "improvement," not ever
- ❌ Never requires an account, login, or activation key
- ❌ Never collects telemetry or analytics
- ❌ Never calls home for license checks once Pro is unlocked
- ❌ Never executes downloaded scripts or binaries — only verified ML weight files

### Privacy

Silhouette is built privacy-first:

- **No accounts** — you don't sign in to anything
- **No telemetry** — we don't collect any usage data
- **No analytics** — we don't track what you do
- **No third-party services** — no external analytics, crash reporters, or A/B testing SDKs
- **No cloud inference** — every model runs locally on your Mac

See the full [Privacy Policy](https://silhouette.mgcrea.io/privacy) for details.

### Security

- **App Sandbox** — Silhouette runs in the macOS App Sandbox with minimal entitlements
- **No admin required** — never requires admin or root privileges
- **Network isolation** — the only outgoing connection is the model-download CDN, and only when you choose to download a model
- **Checksum-verified downloads** — every model is pinned by SHA-256; mismatched or tampered files are rejected
- **Open-source model weights** — all downloaded models are published under permissive open-source licenses (Apache 2.0 / MIT)

### Data Storage

Your data lives in two places:

1. **Local app container** — collection metadata, preferences, and cached results (mask PNGs)
2. **Model cache** — downloaded ML weights (`~/Library/Containers/io.mgcrea.silhouette/`)

Your source images are never copied into the container — they're read directly from the locations you add them from, on demand. Cached results can be cleared from **Settings → Output** at any time.

## Contact

- **Download:** Mac App Store
- **Website:** [silhouette.mgcrea.io](https://silhouette.mgcrea.io/)
- **Issues & Bug Reports:** [GitHub Issues](https://github.com/mgcrea/support/issues/new?labels=silhouette&title=%5Bsilhouette%5D+)
- **Feature Requests:** [GitHub Issues](https://github.com/mgcrea/support/issues/new?labels=silhouette&title=%5Bsilhouette%5D+)
- **Email:** [support@mgcrea.io](mailto:support@mgcrea.io)
- **In-App Help:** Press **⌘/** in Silhouette

---

**Made with ❤️ for photographers, designers, and anyone who cares about the edge between subject and background.**

_Silhouette uses open-source ML models from third-party researchers: IS-Net DIS (Qin et al., 2022, Apache 2.0), MODNet (Ke et al., 2022, Apache 2.0), and BiRefNet (Zheng et al., 2024, MIT). Apple Vision is a trademark of Apple Inc. Silhouette is not affiliated with any of these projects or their authors._
