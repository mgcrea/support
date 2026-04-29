<div align="left">
  <a href="https://apps.apple.com/app/id6753819990">
    <img src="./app-icon.png" alt="DevPulse Icon" width="256" height="256">
  </a>
</div>

# DevPulse Support

[![Download on the Mac App Store](./../assets/download-on-the-mac-app-store.svg)](https://apps.apple.com/app/id6753819990)

Welcome to DevPulse support! This repository is dedicated to help you get the most out of DevPulse and resolve any issues you might encounter.

## Table of Contents

- [Getting Help](#getting-help)
- [Frequently Asked Questions](#frequently-asked-questions)
- [Reporting Issues](#reporting-issues)
- [Feature Requests](#feature-requests)
- [Getting Started](#getting-started)
- [Supported Providers](#supported-providers)
- [Tips & Best Practices](#tips--best-practices)
- [Privacy & Security](#privacy--security)
- [Contact](#contact)

## Getting Help

If you need help with DevPulse, here are your options:

1. **Check the FAQ** below for common questions and answers
2. **Search existing issues** to see if your question has been answered
3. **Open a new issue** if you can't find what you're looking for
4. **Press ⌘/** in the app to view the built-in help screen

## Frequently Asked Questions

### What is DevPulse?

DevPulse is a macOS app that helps developers track releases for their favorite development tools and software packages. It supports Helm Charts, GitHub Releases, and GitLab Releases, with all data automatically synced across your devices via iCloud.

### How do I add a repository?

1. Click the **+** button in the toolbar
2. Select your provider (Helm Chart, GitHub, or GitLab)
3. Enter the repository information:
   - **Helm:** Enter the repository URL and select a chart from the dropdown
   - **GitHub:** Paste a GitHub URL or enter `owner/repo` format
   - **GitLab:** Paste a GitLab URL or enter `group/project` format
4. Optionally customize the name, add tags, or configure tracking options
5. Click **Add**

DevPulse automatically fetches the release history and displays it in the detail pane.

### What providers are supported?

DevPulse currently supports three provider types:

| Provider            | Identifier Format    | Example                                                       | Features                                            |
| ------------------- | -------------------- | ------------------------------------------------------------- | --------------------------------------------------- |
| **Helm Charts**     | `reponame/chartname` | `https://helm.goharbor.io` → `harbor`                         | Auto-discover available charts from repository      |
| **GitHub Releases** | `owner/repo`         | `microsoft/vscode` or `https://github.com/microsoft/vscode`   | Track releases or tags, regex filtering, pagination |
| **GitLab Releases** | `group/project`      | `gitlab-org/gitlab` or `https://gitlab.com/gitlab-org/gitlab` | Support for nested groups, pagination               |

### Does DevPulse sync across my devices?

Yes! DevPulse uses **iCloud CloudKit** to automatically sync your repositories across all your Macs signed in with the same Apple ID. Add a repository on one device, and it appears on all your other devices within seconds.

### How often are releases refreshed?

DevPulse caches responses for **5 minutes** to minimize API calls and respect rate limits. You can manually refresh:

- **Individual repository:** Click the refresh button in the detail view or right-click → Refresh
- **All repositories:** Click the "Refresh All" button in the toolbar

### What are the rate limits?

DevPulse respects provider rate limits:

- **GitHub (unauthenticated):** 60 requests per hour per IP address
- **GitLab:** Varies by instance (GitLab.com typically allows 2000/hour)
- **Helm:** No rate limits (depends on repository hosting)

When you hit a rate limit, DevPulse shows a user-friendly error message with the reset time. Responses are cached for 5 minutes to minimize API usage.

### Can I filter GitHub releases with regex?

Yes! When adding or editing a GitHub repository, you can enable **regex filtering** to include only releases matching a pattern:

1. Click **Edit** on a GitHub repository
2. Scroll to **Release Filter (Regex)**
3. Enter a case-insensitive regex pattern (e.g., `^v?\d+\.\d+\.\d+$` for semantic versions)
4. Save your changes

Only releases matching the pattern will be shown.

### What's the difference between "Releases" and "All Tags" for GitHub?

- **Releases:** Only shows official GitHub releases created via the Releases UI
- **All Tags:** Shows all git tags, including those without release notes

Use "Releases" for most projects. Use "All Tags" if the project doesn't create formal releases but tags versions.

### How do I organize my repositories?

Use **tags** to organize repositories by project, team, or technology:

1. Click **Edit** on a repository
2. Add tags in the **Tags** field (e.g., `frontend`, `production`, `devops`)
3. Save your changes
4. Use the **Filter** button (tag icon) in the toolbar to filter by tag

### Can I export my repositories?

Yes! Press **⌘⇧E** or use **File → Export Repositories...** to export your repository list. This is useful for backups or sharing your configuration.

### What macOS version is required?

DevPulse requires **macOS 26.0 or later** (currently in beta). The final release will target the appropriate stable macOS version.

### Does DevPulse require internet access?

Yes, DevPulse needs internet access to:

- Fetch release information from Helm repositories, GitHub, and GitLab
- Sync your data via iCloud CloudKit

DevPulse requires the **Outgoing Connections (Client)** capability in the App Sandbox.

### Why aren't releases showing up?

Common reasons:

1. **Rate limit exceeded:** Wait for the limit to reset (shown in error message)
2. **Invalid identifier:** Verify the format matches the provider requirements
3. **Private repository:** GitHub/GitLab authentication not yet implemented (coming soon)
4. **Date parsing failure:** Check Console.app for parsing warnings and report an issue

## Reporting Issues

Found a bug? Please help us improve DevPulse by reporting it!

### Before Reporting

1. **Update to the latest version** - Your issue might already be fixed
2. **Search existing issues** - Someone might have already reported it
3. **Try to reproduce** - Can you make it happen consistently?
4. **Check the Console** - Open Console.app and filter for "DevPulse" to see error logs

### Creating a Good Issue Report

When reporting a bug, please include:

- **DevPulse version** (found in About DevPulse)
- **macOS version** (e.g., macOS 14.2)
- **Provider type** (Helm, GitHub, or GitLab)
- **Steps to reproduce** the issue
- **Expected behavior** - What should happen?
- **Actual behavior** - What actually happened?
- **Screenshots** - If applicable
- **Console logs** - Open Console.app and filter for "DevPulse"

**Example:**

```markdown
**DevPulse Version:** 1.0.0
**macOS Version:** 14.2
**Provider:** GitHub

**Steps to Reproduce:**

1. Add repository `microsoft/vscode`
2. Enable regex filter with pattern `^v\d+`
3. Click refresh

**Expected:** Only releases starting with "v" followed by digits should appear
**Actual:** All releases still show, regex filter not applied

**Console Logs:**
[Paste relevant console output]
```

## Feature Requests

Have an idea to make DevPulse better? We'd love to hear it!

When suggesting a feature:

1. **Check existing feature requests** - Use the search function
2. **Describe the use case** - Why do you need this feature?
3. **Provide examples** - How would it work?
4. **Explain the benefit** - How does this help users?

### Planned Features

The following features are planned but not yet implemented:

- **GitHub/GitLab authentication** - Access private repositories and higher rate limits
- **BitBucket support** - Track BitBucket releases
- **Notifications** - Get notified when new releases are available
- **Background refresh** - Automatically check for updates periodically
- **Custom refresh intervals** - Set per-repository refresh schedules

## Getting Started

### Installation

1. Download the latest version from the releases page
2. Open the `.dmg` file
3. Drag DevPulse to your Applications folder
4. Launch DevPulse

### First Use

On first launch, macOS might show a security warning because DevPulse is not from the App Store:

1. Go to **System Settings > Privacy & Security**
2. Click **"Open Anyway"** next to the DevPulse warning
3. Confirm you want to open the app

### Required Permissions

DevPulse requires two key permissions configured in the App Sandbox:

1. **Outgoing Connections (Client)** - For fetching repository data from the internet
2. **iCloud (CloudKit)** - For syncing your repositories across devices

These permissions are built into the app and don't require additional configuration.

### Quick Start Guide

1. **Add your first repository:**
   - Click the **+** button
   - Select **GitHub** as the provider
   - Paste `microsoft/vscode` or `https://github.com/microsoft/vscode`
   - Click **Add**

2. **Explore the releases:**
   - Select the repository from the sidebar
   - View the latest release prominently displayed
   - Scroll down to see release history
   - Click **Load More** to load older releases

3. **Organize with tags:**
   - Click **Edit** on the repository
   - Add tags like `editor`, `microsoft`
   - Use the filter button to filter by tags

4. **Keyboard shortcuts:**
   - **⌘/** - Show help
   - **⌘⇧E** - Export repositories
   - **⌘Q** - Quit

## Supported Providers

### Helm Charts

**Identifier Format:** `reponame/chartname` (e.g., `harbor`)

**How to add:**

1. Enter the full Helm repository URL (e.g., `https://helm.goharbor.io`)
2. Select a chart from the auto-populated dropdown
3. DevPulse fetches all releases from the repository's `index.yaml`

**Features:**

- Auto-discovery of available charts
- 5-minute response caching
- Handles various timestamp formats (nanoseconds, microseconds, timezones)

**Example repositories:**

- Harbor: `https://helm.goharbor.io` → `harbor`
- Bitnami: `https://charts.bitnami.com/bitnami` → various charts

### GitHub Releases

**Identifier Format:** `owner/repo` (e.g., `microsoft/vscode`)

**How to add:**

1. Paste a GitHub URL or enter `owner/repo` format
2. DevPulse automatically extracts the identifier
3. Choose between tracking "Releases" or "All Tags"
4. Optionally add a regex filter

**Features:**

- Smart URL extraction from `github.com/owner/repo`, `.git` URLs
- Track releases OR all git tags
- Case-insensitive regex filtering
- Pagination (loads more releases on demand)
- Rate limiting with friendly error messages (60/hour unauthenticated)
- 5-minute response caching
- Download links for release assets

**Example repositories:**

- `microsoft/vscode` - Visual Studio Code
- `facebook/react` - React library
- `kubernetes/kubernetes` - Kubernetes

### GitLab Releases

**Identifier Format:** `group/project` or `group/subgroup/project` (e.g., `gitlab-org/gitlab`)

**How to add:**

1. Paste a GitLab URL or enter `group/project` format
2. DevPulse automatically extracts and URL-encodes the identifier
3. Supports nested groups

**Features:**

- Smart URL extraction from `gitlab.com/group/project`
- Support for nested group hierarchies
- URL-encoding for special characters
- Pagination (loads more releases on demand)
- Rate limiting with friendly error messages
- 5-minute response caching
- Download links for release assets

**Example repositories:**

- `gitlab-org/gitlab` - GitLab itself
- `inkscape/inkscape` - Inkscape vector editor
- `fdroid/fdroidclient` - F-Droid client

## Tips & Best Practices

### Paste URLs Directly

Instead of manually typing identifiers, paste full URLs:

- **GitHub:** `https://github.com/microsoft/vscode` → auto-extracts `microsoft/vscode`
- **GitLab:** `https://gitlab.com/gitlab-org/gitlab` → auto-extracts `gitlab-org/gitlab`

DevPulse handles `.git` suffix removal and common URL variations.

### Use Tags for Organization

Organize repositories by:

- **Project:** `project-alpha`, `project-beta`
- **Team:** `frontend`, `backend`, `devops`
- **Technology:** `rust`, `nodejs`, `kubernetes`
- **Priority:** `production`, `staging`, `development`

This makes filtering much easier when you have many repositories.

### Right-Click for Quick Actions

Right-click any repository in the sidebar for quick access to:

- **Refresh** - Update this repository's releases
- **Delete** - Remove the repository

### Monitor Rate Limits

If you're tracking many GitHub repositories:

- Spread out manual refreshes to avoid hitting rate limits
- Use "Refresh All" sparingly (counts as one request per repository)
- Wait for the 5-minute cache to expire before refreshing again
- Consider implementing authentication when available (coming soon)

### Use Regex Filters Wisely

For GitHub repositories with many tags:

- Filter to semantic versions: `^v?\d+\.\d+\.\d+$`
- Filter to major versions: `^v?1\.`
- Filter to release candidates: `rc|beta|alpha`

Remember: regex is case-insensitive.

### Search Efficiently

The search box filters by:

- Repository name
- Repository identifier (`owner/repo`, `group/project`)
- Repository URL

This means you can quickly find repositories by typing any of these.

## Privacy & Security

### What DevPulse Does

- ✅ Fetches release data from public APIs (Helm, GitHub, GitLab)
- ✅ Syncs your repository list via iCloud CloudKit
- ✅ Caches responses locally for 5 minutes
- ✅ Shows you exactly what data is being tracked

### What DevPulse Does NOT Do

- ❌ Never accesses private repositories (authentication not yet implemented)
- ❌ Never modifies your repositories or releases
- ❌ Never sends your data to third-party servers (except iCloud sync)
- ❌ Never collects telemetry or analytics

### Privacy

DevPulse is committed to your privacy:

- **No telemetry** - We don't collect any usage data
- **No analytics** - We don't track what you do
- **No third-party tracking** - No external analytics services
- **iCloud only** - Data syncs via Apple's iCloud CloudKit (encrypted in transit and at rest)
- **Open APIs** - Only uses public, unauthenticated APIs for fetching releases

### Security

- **App Sandbox** - DevPulse runs in the macOS App Sandbox with minimal permissions
- **No admin required** - Never requires admin or root privileges
- **Network isolation** - Only outgoing connections to Helm repositories, GitHub, and GitLab APIs
- **No code execution** - Never executes downloaded scripts or binaries

### Data Storage

Your data is stored in two locations:

1. **Local SwiftData database** - Stored in your app container
2. **iCloud CloudKit** - Synced across devices (encrypted)

You can disable iCloud sync in System Settings > Apple ID > iCloud if desired (data will remain local-only).

## Contact

- **Issues & Bug Reports:** [GitHub Issues](https://github.com/anthropics/dev-pulse/issues)
- **Feature Requests:** [GitHub Issues](https://github.com/anthropics/dev-pulse/issues)
- **Documentation:** [README.md](README.md)
- **In-App Help:** Press **⌘/** in DevPulse

---

**Made with ❤️ for developers who want to stay up-to-date with their tools**

_DevPulse is not affiliated with Helm, GitHub, GitLab, or any of the projects it tracks._
