# Security Policy

## Scope

This project only creates a local macOS launcher for `vt-cli`. It does not
implement the VirusTotal API, store credentials, or perform uploads itself.

## Reporting a vulnerability

Please report launcher-specific vulnerabilities privately through GitHub's
**Security** tab instead of opening a public issue. Include the macOS version,
the project version or commit, and steps to reproduce the problem.

Issues in `vt-cli` itself should be reported to the official
[VirusTotal/vt-cli](https://github.com/VirusTotal/vt-cli) project.

## API keys

Never include a real VirusTotal API key in an issue, screenshot, log, commit,
or pull request. If a key is exposed, revoke it immediately through the
VirusTotal account and then remove it from Git history.
