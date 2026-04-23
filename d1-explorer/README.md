<div align="left">
  <a href="https://apps.apple.com/app/id6761669031">
    <img src="./app-icon.png" alt="D1Explorer Icon" width="256" height="256">
  </a>
</div>

# D1Explorer Support

[![Download on the Mac App Store](./../assets/download-on-the-mac-app-store.svg)](https://apps.apple.com/app/id6761669031)

Welcome to D1Explorer support! This repository is dedicated to help you get the most out of D1Explorer and resolve any issues you might encounter.

## Table of Contents

- [Getting Help](#getting-help)
- [Frequently Asked Questions](#frequently-asked-questions)
- [Reporting Issues](#reporting-issues)
- [Feature Requests](#feature-requests)
- [Getting Started](#getting-started)
- [Supported Sources](#supported-sources)
- [Free vs Pro](#free-vs-pro)
- [Tips & Best Practices](#tips--best-practices)
- [Privacy & Security](#privacy--security)
- [Contact](#contact)

## Getting Help

If you need help with D1Explorer, here are your options:

1. **Check the FAQ** below for common questions and answers
2. **Search existing issues** to see if your question has been answered
3. **Open a new issue** if you can't find what you're looking for
4. **Press ⌘/** in the app to view the built-in help screen

## Frequently Asked Questions

### What is D1Explorer?

D1Explorer is a native macOS app for browsing and editing [Cloudflare D1](https://developers.cloudflare.com/d1/) databases and local SQLite files. It offers a fast, tabbed UI with inline editing, schema inspection, custom SQL queries, and Wrangler project import — designed to feel right at home on macOS.

### How do I connect to my Cloudflare D1 database?

1. Create a Cloudflare API token with **D1 read/write** permissions (Account > D1 > Edit)
2. In D1Explorer, open **Settings** (⌘,) and add your Cloudflare account with the token
3. Your D1 databases will appear automatically once authenticated
4. Select a database from the sidebar to start browsing tables

### How do I open a local SQLite file?

You have two options:

- **File → Open** and browse to a `.db` or `.sqlite` file
- **Drag and drop** a SQLite file directly onto the D1Explorer window

Local files open in read-write mode by default.

### Where are my Cloudflare API tokens stored?

All API tokens are stored securely in the **macOS Keychain**. They are never sent to our servers or any third party — only to Cloudflare's own API endpoints.

### Can I import a local Wrangler project?

Yes! Use **Import Wrangler Project** to pick a folder containing `wrangler.toml` or `wrangler.jsonc`. D1Explorer scans `.wrangler/state/v3/d1` for local D1 SQLite databases and adds them as connections.

> ⚠️ If a `-wal` file exists alongside the database, a Wrangler/Miniflare dev server is currently using it. D1Explorer will open it **read-only** in that case and may see stale data until the dev server stops.

### What can I do with the Query editor?

Open the **Query** tab to run custom SQL:

- Run the query with **⌘↩**
- Results appear in a scrollable, sortable grid
- Read-only queries (`SELECT`, `PRAGMA`, `EXPLAIN`, …) are always available
- Data-modifying queries (`INSERT`, `UPDATE`, `DELETE`, DDL, …) require **Pro**

### How does inline cell editing work?

Double-click any cell in the data grid to edit its value. Changes are staged locally — you can review and **commit all pending changes at once**, or discard them. This lets you make multiple edits safely before touching the database.

### What should I check if the app cannot connect to Cloudflare?

Please verify the following:

- Your API token is **valid and not expired**
- Your token has the **required D1 permissions** (Account > D1 > Edit)
- Your **internet connection** is working
- Cloudflare's API is not experiencing an outage — check [Cloudflare Status](https://www.cloudflarestatus.com)

### Can I use D1Explorer offline?

Partially. Local SQLite files work completely offline. Cloudflare D1 databases require an active connection to the Cloudflare API.

### What macOS version is required?

D1Explorer requires **macOS 14.0 (Sonoma) or later**, running on an Apple Silicon or Intel Mac.

### How much does D1Explorer cost?

D1Explorer is **free to download** and free to use for browsing, read-only queries, and schema inspection. A one-time **Pro unlock** (in-app purchase) enables write operations — see [Free vs Pro](#free-vs-pro) below.

## Reporting Issues

Found a bug? Please help us improve D1Explorer by reporting it!

### Before Reporting

1. **Update to the latest version** — your issue might already be fixed
2. **Search existing issues** — someone might have already reported it
3. **Try to reproduce** — can you make it happen consistently?
4. **Check the Console** — open Console.app and filter for `D1Explorer` or `SwiftD1` to see error logs

### Creating a Good Issue Report

When reporting a bug, please include:

- **D1Explorer version** (found in About D1Explorer or the Help screen)
- **macOS version** (e.g., macOS 14.2)
- **Source type** (Cloudflare D1, local SQLite, or Wrangler-imported)
- **Steps to reproduce** the issue
- **Expected behavior** — what should happen?
- **Actual behavior** — what actually happened?
- **Screenshots** — if applicable
- **Console logs** — filter for `D1Explorer` / `SwiftD1` in Console.app

> 💡 The easiest way is to use **Help → Report an Issue** (or the "Report an Issue" button on the Help screen). It opens a pre-filled GitHub issue with your app and macOS version already included.

**Example:**

```markdown
**D1Explorer Version:** 1.2.0
**macOS Version:** 14.4.1
**Source:** Cloudflare D1

**Steps to Reproduce:**

1. Open a D1 database with 10+ tables
2. Select a table with a BLOB column
3. Double-click a BLOB cell

**Expected:** Hex preview with option to edit
**Actual:** Grid briefly freezes, cell shows "Invalid UTF-8"

**Console Logs:**
[Paste relevant console output]
```

## Feature Requests

Have an idea to make D1Explorer better? We'd love to hear it!

When suggesting a feature:

1. **Check existing feature requests** — use the search function
2. **Describe the use case** — why do you need this feature?
3. **Provide examples** — how would it work?
4. **Explain the benefit** — how does this help other users?

## Getting Started

### Installation

1. Download D1Explorer from the [Mac App Store](https://apps.apple.com/app/id6761669031)
2. Launch D1Explorer from Applications

### First Use

1. Click the **+** button in the sidebar to add a connection
2. Choose your source:
   - **Cloudflare D1** — enter your Account ID + API Token, then select a database
   - **Local SQLite** — browse for a `.db` / `.sqlite` file, or drag-and-drop onto the window
   - **Wrangler Project** — pick a folder containing `wrangler.toml` / `wrangler.jsonc`
3. Select a table from the list to view its data
4. Explore freely — any destructive actions are gated behind Pro until unlocked

### Creating a Cloudflare API Token

1. Visit [Cloudflare Dashboard → API Tokens](https://dash.cloudflare.com/profile/api-tokens)
2. Click **Create Token → Create Custom Token**
3. Add the permission: **Account → D1 → Edit**
4. Scope it to the account(s) you want D1Explorer to access
5. Copy the generated token and paste it into D1Explorer Settings

See Cloudflare's [Create API Token guide](https://developers.cloudflare.com/fundamentals/api/get-started/create-token/) for more detail.

### Keyboard Shortcuts

| Shortcut | Action        |
| -------- | ------------- |
| **⌘T**   | New Tab       |
| **⌘↩**   | Run Query     |
| **⌘/**   | Open Help     |
| **⌘,**   | Open Settings |

## Supported Sources

### Cloudflare D1

- Connect via Account ID + API Token (stored in the macOS Keychain)
- List and switch between databases on the same account
- Browse tables with pagination, column sorting, and WHERE filters
- Inspect schema; add / drop columns (Pro)
- Run arbitrary SQL in the Query editor

### Local SQLite

- Open any `.db` / `.sqlite` file via File → Open or drag-and-drop
- Works fully offline
- Same browsing, editing, and query capabilities as D1 connections
- Detects WAL files to avoid corrupting databases under active use

### Wrangler Projects

- Import a folder containing `wrangler.toml` or `wrangler.jsonc`
- Automatically scans `.wrangler/state/v3/d1` for local D1 databases
- Great for iterating on your Cloudflare Workers + D1 setup locally

## Free vs Pro

D1Explorer is free to download. A one-time **Pro** in-app purchase unlocks write operations. Pro is tied to your Apple ID and works on all your Macs signed into the same account.

### Free

- ✅ Connect to Cloudflare D1 and local SQLite
- ✅ Import Wrangler projects
- ✅ Browse tables (pagination, sorting, WHERE filters)
- ✅ Inspect schema
- ✅ Run read-only SQL queries (`SELECT`, `PRAGMA`, `EXPLAIN`, …)
- ✅ Export query results
- ✅ Multi-tab UI, keyboard shortcuts, iCloud-free local storage

### Pro

Everything in Free, plus:

- 🔓 Inline cell editing with batch commit
- 🔓 Add / delete rows
- 🔓 Add / drop columns
- 🔓 Run data-modifying SQL (`INSERT`, `UPDATE`, `DELETE`, DDL, …)
- 🔓 Create and drop tables

> 🎁 **Grandfathering:** users who originally purchased D1Explorer as a paid app (before the free + Pro pivot) get Pro automatically on upgrade — no extra purchase required.

## Tips & Best Practices

### Review Before You Commit

When editing cells inline, D1Explorer stages your edits locally so you can **see exactly what will change** before committing. Use this to make a batch of edits, review the pending diff, then commit or discard — much safer than typing individual `UPDATE` statements.

### Use Tabs to Compare Tables

Press **⌘T** to open multiple tabs. Great for:

- Comparing schemas between two tables
- Running a query in one tab while browsing rows in another
- Keeping a "reference" table open while editing another

### Start With Read-Only Queries

The Query editor lets you run any `SELECT` / `PRAGMA` / `EXPLAIN` query without Pro. Use this to prototype and verify your statement before promoting it to a write query.

### Watch Out for Active Wrangler Dev Servers

If you see D1Explorer open a local D1 database in read-only mode, it's because a `-wal` file indicates a Wrangler/Miniflare dev server is currently writing to it. Stop the dev server (e.g. `wrangler dev`) before making changes in D1Explorer to avoid conflicts.

### Scope API Tokens Narrowly

Create a Cloudflare API token with just the D1 permission on just the account(s) you need. If the token is ever exposed, the blast radius stays small, and you can revoke it independently of your other tokens.

### Check the Cloudflare Status Page First

If connections to D1 suddenly start failing, check [cloudflarestatus.com](https://www.cloudflarestatus.com) before assuming something is wrong with the app or your token.

## Privacy & Security

### What D1Explorer Does

- ✅ Talks to the Cloudflare API directly from your Mac
- ✅ Stores API tokens in the **macOS Keychain**
- ✅ Reads and writes local SQLite files you explicitly open
- ✅ Works entirely offline for local SQLite

### What D1Explorer Does NOT Do

- ❌ Never sends your API tokens to any server other than Cloudflare
- ❌ Never sends your database contents to any third party
- ❌ Never collects telemetry or analytics
- ❌ Never requires admin/root privileges

### Privacy

D1Explorer is committed to your privacy:

- **No telemetry** — we don't collect any usage data
- **No analytics** — we don't track what you do
- **No third-party tracking** — no external analytics services
- **Keychain-backed secrets** — API tokens stay in the macOS Keychain
- **Direct-to-provider** — the only network destination is `api.cloudflare.com`

See the full [Privacy Policy](https://d1-explorer.mgcrea.io/privacy) for details.

### Security

- **App Sandbox** — D1Explorer runs in the macOS App Sandbox with minimal entitlements
- **No admin required** — never requires admin or root privileges
- **Network isolation** — only outgoing connections to the Cloudflare API
- **No code execution** — never executes downloaded scripts or binaries

### Data Storage

Your data lives in two places:

1. **Local app container** — connection metadata and preferences
2. **macOS Keychain** — API tokens (encrypted by macOS)

Database contents themselves are not copied or cached locally; they're read directly from the Cloudflare D1 API or the SQLite file you pointed D1Explorer at.

## Contact

- **Download:** [Mac App Store](https://apps.apple.com/app/id6761669031)
- **Website:** [d1-explorer.mgcrea.io](https://d1-explorer.mgcrea.io/)
- **Issues & Bug Reports:** [GitHub Issues](https://github.com/mgcrea/support/issues/new?labels=d1-explorer&title=%5Bd1-explorer%5D+)
- **Feature Requests:** [GitHub Issues](https://github.com/mgcrea/support/issues/new?labels=d1-explorer&title=%5Bd1-explorer%5D+)
- **Email:** [support@mgcrea.io](mailto:support@mgcrea.io)
- **In-App Help:** Press **⌘/** in D1Explorer

---

**Made with ❤️ for developers who want a native Mac experience for Cloudflare D1**

_D1Explorer is not affiliated with Cloudflare. "Cloudflare" and "D1" are trademarks of Cloudflare, Inc._
