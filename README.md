# VirusTotal CLI macOS Launcher

A lightweight, unofficial macOS launcher for the official
[VirusTotal CLI](https://github.com/VirusTotal/vt-cli) that opens a ready-to-use
Terminal session without bundling or accessing API keys.

![macOS](https://img.shields.io/badge/macOS-11%2B-black)
![License](https://img.shields.io/badge/license-MIT-blue)

## What it does

- Creates a native-looking `VirusTotal CLI.app` with a custom icon.
- Opens Apple Terminal and makes Homebrew's standard Apple Silicon and Intel
  locations available on `PATH`.
- Shows a few common `vt` commands and leaves the Terminal session open.
- Uses the user's existing `vt-cli` installation and configuration.

The launcher does **not** contain, read, copy, transmit, or manage an API key.
Authentication remains entirely with `vt-cli`.

## Requirements

- macOS 11 or newer
- Apple Terminal
- [Homebrew](https://brew.sh/)
- VirusTotal CLI

Install the CLI with Homebrew:

```sh
brew install virustotal-cli
```

Configure it directly through the official CLI:

```sh
vt init
```

`vt init` stores the API key in the user's own `~/.vt.toml` file. That file is
not part of this project and is explicitly excluded by `.gitignore`.

## Quick installation

Download or clone this repository, open Terminal in the project folder, and
run:

```sh
zsh install.sh
```

This builds the app locally and copies it to the Desktop. If an older launcher
already exists there, it is preserved as a timestamped backup.

To install into a different folder, pass that folder as the first argument:

```sh
zsh install.sh "/Applications"
```

Installing into `/Applications` may require administrator permission. Installing
on the Desktop does not.

## Build only

```sh
./scripts/build-app.sh
```

The result is created at:

```text
dist/VirusTotal CLI.app
```

The app is ad-hoc signed locally. It is not notarized by Apple. If macOS blocks
the first launch, Control-click the app, choose **Open**, and confirm once.

## Usage

Double-click `VirusTotal CLI.app`, then run normal `vt` commands, for example:

```sh
vt file <SHA256>
vt url <URL>
vt scan file <FILE>
vt help
```

Uploading a file or URL to VirusTotal can disclose it to VirusTotal and, based
on account type and service terms, potentially to security partners. Review the
data before using a scan command.

## Security and privacy

- No API key is embedded in this repository or generated app.
- The launcher does not upload anything by itself.
- No analytics, network calls, background services, or automatic updates are
  included.
- Keep `~/.vt.toml` and any environment files private.
- If a key is ever committed accidentally, revoke it before removing it from
  Git history.

See [SECURITY.md](SECURITY.md) for reporting security issues.

## Uninstall

Move `VirusTotal CLI.app` from the Desktop or Applications folder to the Trash.
This does not uninstall `vt-cli` or remove its configuration.

## Disclaimer

This is an independent, unofficial convenience launcher. It is not affiliated
with or endorsed by VirusTotal or Google. VirusTotal CLI remains subject to its
own license and terms.

## License

This launcher is available under the [MIT License](LICENSE).
