# Architecture Overview for the `ob` Obsidian Vault

This repository is an Obsidian vault rooted at `obsidian/` and versioned via git (`RepoURL: git@github.com:Guoaking/ob.git`). It contains primarily Markdown content plus Obsidian configuration and several third‑party plugins. There is no standalone application entrypoint or build system; Obsidian is the runtime.

---

## 1. Project Overview

- **Purpose**
  - Personal knowledge and journaling vault organized into thematic areas such as inbox, workbench, library, journal, and system utilities (`README.md:1-9`, `00_inbox/`, `10_WorkBench/`, `20_Library/`, `30_Journal/`, `99_System/`).
  - The vault is intended to be opened directly in Obsidian; all behavior is driven by Obsidian core features, community plugins, and a small amount of custom JavaScript.

- **High‑level Architecture**
  - **Content layers**: Markdown notes organized in top‑level folders for collection (`00_inbox`), active work (`10_WorkBench`), long‑term library (`20_Library`), journals (`30_Journal`), and system/utility files (`99_System`).
  - **Runtime configuration**: Obsidian settings and theme configuration live under `.obsidian/`, including app settings (`.obsidian/app.json:1-19`), plugin configuration, hotkeys, themes, and CSS snippets.
  - **Plugins**: Community plugins are installed under `.obsidian/plugins/<plugin-id>/` and are loaded by Obsidian at runtime (see `.obsidian/community-plugins.json:1-40`). Each plugin directory typically contains `manifest.json`, `main.js`, optional `data.json`, and `styles.css`.
  - **Custom scripts**: Small JavaScript utilities live under `99_System/tmplates/script/` and integrate with Obsidian’s global `app` API (e.g., `99_System/tmplates/script/getrandomImage.js:1-11`).

There are no project‑level Node/TypeScript configs (`package.json`, `tsconfig.json`, or test configs) in this repository.

---

## 2. Build & Commands

- **Runtime / Execution**
  - The vault is loaded by the Obsidian desktop or mobile application. Obsidian discovers configuration in `.obsidian/` and plugin code in `.obsidian/plugins/` automatically.
  - Plugin JavaScript such as `.obsidian/plugins/link-favicon/main.js:1-11` is already bundled (via esbuild according to the file header) and treated as a runtime artifact rather than source to compile.

- **Build / Tooling**
  - No Node/JS build metadata is present in the vault (`**/package.json`, `**/tsconfig.json`, and common test configs are absent), so there are **no repository‑local build commands**.
  - If you need to change a third‑party plugin (for example `link-favicon`), the intended workflow is to modify the plugin in its upstream repository (e.g., `https://github.com/joethei/obisidian-link-favicon` referenced in `link-favicon/main.js:1-4`) and then reinstall/update it in this vault. Editing the compiled `main.js` here should be considered a last resort.

- **Version control**
  - The vault is tracked in git with a remote at `git@github.com:Guoaking/ob.git` (from `RepoURL`). There are no custom git hooks or helper scripts checked into this repository.

---

## 3. Code Style & Conventions

### 3.1 General Principles

- **Treat plugin bundles as generated code**
  - Files like `.obsidian/plugins/link-favicon/main.js:1-7` are marked as "GENERATED/BUNDLED" by esbuild and combine multiple libraries and modules into a single file.
  - To avoid merge conflicts or subtle bugs, avoid reformatting or hand‑editing these bundles except for very localized, deliberate patches.

- **Custom scripts are minimal and Obsidian‑aware**
  - Custom JavaScript is written in plain ES syntax with CommonJS exports and uses Obsidian’s global `app` object directly.
  - Example: `99_System/tmplates/script/getrandomImage.js:1-11` exports a single function, uses `app.fileManager.vault.fileMap`, and returns a random child path from a configured folder.

### 3.2 `link-favicon` Plugin Conventions

The `link-favicon` plugin is a third‑party community plugin installed under `.obsidian/plugins/link-favicon/` with metadata in `manifest.json:1-9` and a compiled implementation in `main.js:1-11`.

From the bundled code (`.obsidian/plugins/link-favicon/main.js`):

- The plugin is structured as a standard Obsidian plugin class extending `Plugin`, with lifecycle methods `onload`, `onunload`, and settings load/save methods.
- It uses the Obsidian API (`require("obsidian")` calls throughout `main.js`) plus CodeMirror extensions (`@codemirror/state`, `@codemirror/view`, `@codemirror/language`) to decorate links in the editor and reading views.
- Settings include provider choice, fallback provider, ignored domains, per‑domain and per‑scheme icon overrides, debounce intervals, and separate toggles for reading/source/live‑preview modes (see the settings tab implementation around `.obsidian/plugins/link-favicon/main.js:1043-1162`).

When modifying this plugin in place:

- Preserve the existing pattern of using Obsidian’s `requestUrl` for HTTP calls and `Notice` for user‑visible errors.
- Keep new settings wired through the existing `loadSettings` / `saveSettings` implementation (`.obsidian/plugins/link-favicon/main.js:1468-1474`).

### 3.3 Vim & Keybinding Conventions

- The vault enables Vim mode (`.obsidian/app.json:17-19`) and defines extensive custom mappings in `.obsidian/obsidian.vimrc:1-95`.
- Custom `exmap` commands delegate to Obsidian commands (e.g., `exmap ex_app_delete_file obcommand app:delete-file` and related normal‑mode mappings `nmap x :ex_app_delete_file<CR>` in `.obsidian/obsidian.vimrc:26-33`).
- When adding new keybindings, prefer using the existing `exmap` + `nmap` style so that they remain discoverable and consistent.

---

## 4. Testing

- **Automated tests**
  - There are no automated tests or test configuration present in this vault (no Jest configs, test directories, or similar tooling).

- **Manual testing in Obsidian**
  - For **plugin behavior** (e.g., `link-favicon`):
    - Verify external link favicons in both reading and editor modes after any change, paying attention to aliased links (`[text](url)`) vs raw links (`https://example.com`), as controlled by settings in `.obsidian/plugins/link-favicon/main.js:1043-1107`.
    - Exercise provider selection, ignored domains, and custom domain/schema overrides via the settings UI defined in the same file.
  - For **custom scripts** such as `getrandomImage.js`, test by invoking the script through whichever template or plugin references it (the script itself expects a folder key present in `app.fileManager.vault.fileMap`, `99_System/tmplates/script/getrandomImage.js:4-11`).

- **Regression checks**
  - After modifying configuration or plugin code, confirm that the vault still opens without errors in Obsidian and that core features (file creation in `00_inbox`, attachment handling in `99_System/img`, Vim navigation, etc.) behave as expected.

---

## 5. Security

### 5.1 External Network Access

The main executable code that talks to the network is the `link-favicon` plugin (`.obsidian/plugins/link-favicon/main.js`):

- **Favicon providers**
  - A provider registry `L` defines several external favicon services including Google, DuckDuckGo, Icon Horse, Splitbee, and others (see `.obsidian/plugins/link-favicon/main.js:7-31`).
  - Each provider constructs URLs like `https://www.google.com/s2/favicons?domain=<host>` or `https://icons.duckduckgo.com/ip3/<host>.ico`, and the plugin fetches these via Obsidian’s `requestUrl` (`.obsidian/plugins/link-favicon/main.js:19-31`).
  - Some providers (e.g., `besticon`) support self‑hosting by configuring `providerDomain` / `fallbackProviderDomain` in the plugin settings (`.obsidian/plugins/link-favicon/main.js:18-31`, `1043-1074`).

- **Security considerations**
  - Every visited external link whose favicon is resolved will send its domain to the configured provider. When customizing `providerDomain` / `fallbackProviderDomain`, ensure they point to services you trust, as they receive a list of domains present in your notes.
  - Network fetches use Obsidian’s `requestUrl`, which applies Obsidian’s CORS and environment rules (`.obsidian/plugins/link-favicon/main.js:19-31`, `1389-1398`).

### 5.2 Local Storage & Caching

- The plugin integrates a small local‑storage wrapper (from `ls` in `.obsidian/plugins/link-favicon/main.js:262-336`) to cache encoded favicon data under keys prefixed with `lf-<host>.<ext>` (`.obsidian/plugins/link-favicon/main.js:1389-1404`).
- Cached entries have a TTL (default ~30 days) and are periodically cleaned up. Cached data is base64‑encoded image content, not document text.

### 5.3 Color Analysis

- The plugin bundles **Fast Average Color** (`/*! Fast Average Color ... */` at `.obsidian/plugins/link-favicon/main.js:10`) and **TinyColor** for color analysis and readability checks.
- It computes average colors for favicon images and stores derived attributes on the favicon element (`data-average-color-hex`, `data-isDark`, `data-isReadableAA`, etc.) to support optional color inversion (`.obsidian/plugins/link-favicon/main.js:1404-1453`).

### 5.4 Data Synchronization

- The vault is tracked in a public or private Git repository (`RepoURL: git@github.com:Guoaking/ob.git`). Additionally, the `obsidian-git` plugin is enabled (`.obsidian/community-plugins.json:10`), indicating that synchronization and commits may be driven from within Obsidian.
- When adding new scripts or configuration, avoid embedding hard‑coded secrets (API keys, tokens) directly into plugin bundles or templates, as they will be pushed to the git remote.

There are **no Cursor, Copilot, or Trae rule files** in this repository (no `.cursor/rules/`, `.github/copilot-instructions.md`, or `.trae/rules/` paths were found), so there are currently no tool‑specific security policies enforced at the repo level.

---

## 6. Configuration & Environment

### 6.1 Obsidian Core Settings

- **App settings** (`.obsidian/app.json:1-19`)
  - `attachmentFolderPath`: All embedded attachments and pasted images default to `99_System/img`.
  - `newFileFolderPath`: New files are created under `00_inbox`.
  - `alwaysUpdateLinks`: Enabled, so Obsidian keeps wiki/markdown links consistent on rename.
  - `vimMode`: Enabled, meaning editing is Vim‑driven by default.
  - `readableLineLength`: Enabled, affecting editor layout.

- **Community plugins** (`.obsidian/community-plugins.json:1-40`)
  - A curated set of plugins is enabled, including `dataview`, `templater-obsidian`, `obsidian-git`, `obsidian-excalidraw-plugin`, `obsidian-charts`, `link-favicon`, and several workflow/navigation helpers.
  - Each enabled plugin has a corresponding directory under `.obsidian/plugins/<id>/` (listed via `.obsidian/plugins/`), containing plugin‑specific data and code.

- **Themes & CSS**
  - Multiple community themes are installed under `.obsidian/themes/<ThemeName>/` with `theme.css` and `manifest.json` (e.g., `.obsidian/themes/Zen/theme.css`).
  - Additional styling is injected via CSS snippets in `.obsidian/snippets/` such as `mermaid.css`, `my-style.css`, and `virtualLinks.css`.

### 6.2 Vim Configuration

- `.obsidian/obsidian.vimrc:1-95` configures:
  - Navigation tweaks (e.g., `nmap H ^`, `nmap L $`).
  - Clipboard integration (`set clipboard=unnamed`).
  - Mappings that call Obsidian commands via `exmap` and `obcommand` (e.g., navigation, file delete, split views, folding).
  - A set of surround mappings for wiki links and various brackets/quotes.

### 6.3 Custom Script Environment

- `99_System/tmplates/script/getrandomImage.js:1-11`
  - Exposes `imgpath(folders)` via `module.exports`.
  - Uses the Obsidian global `app` object (`app.fileManager.vault.fileMap[folders].children`) to gather child files under a given folder key and returns a random file’s `path`.
  - Assumes the caller passes a key that exists in `vault.fileMap` and that its `children` are image‑like files or attachments.

---

## 7. How to Work in This Vault as an Agent

- **Content changes**
  - Operate directly on Markdown files in the top‑level domain folders (`00_inbox`, `10_WorkBench`, `20_Library`, `30_Journal`) while preserving existing internal links and respecting `alwaysUpdateLinks` behavior.

- **Configuration changes**
  - Prefer adjusting JSON configuration files under `.obsidian/` (e.g., `app.json`, plugin `data.json` files) rather than editing generated plugin JavaScript.
  - When touching `.obsidian/obsidian.vimrc`, follow the existing mapping patterns and reuse `exmap`/`nmap` conventions.

- **Plugin and script changes**
  - For third‑party plugins, prefer upstream repositories for major changes; treat the code here as compiled artifacts.
  - For small vault‑local utilities (like `getrandomImage.js`), keep dependencies minimal and interact only with Obsidian’s documented global APIs (such as `app.fileManager` and `app.vault`).

This overview is intentionally high‑level to keep `AGENTS.md` focused on architecture, configuration, and security‑relevant behavior that other agents and contributors need to know when working in this vault.

