#!/bin/zsh

set -euo pipefail

script_dir="${0:A:h}"
project_dir="${script_dir:h}"
app_name="VirusTotal CLI.app"
dist_dir="${project_dir}/dist"
app_path="${dist_dir}/${app_name}"
contents_dir="${app_path}/Contents"

case "${app_path}" in
  "${project_dir}/dist/"*) ;;
  *)
    echo "Refusing to build outside the project dist directory." >&2
    exit 1
    ;;
esac

if [[ ! -f "${project_dir}/assets/AppIcon.icns" ]]; then
  echo "Missing assets/AppIcon.icns" >&2
  exit 1
fi

rm -rf "${app_path}"
mkdir -p "${contents_dir}/MacOS" "${contents_dir}/Resources"

cp "${project_dir}/src/Info.plist" "${contents_dir}/Info.plist"
cp "${project_dir}/src/VirusTotalCLI" "${contents_dir}/MacOS/VirusTotalCLI"
cp "${project_dir}/assets/AppIcon.icns" "${contents_dir}/Resources/AppIcon.icns"

chmod 755 "${contents_dir}/MacOS/VirusTotalCLI"

/usr/bin/plutil -lint "${contents_dir}/Info.plist" >/dev/null
/bin/zsh -n "${contents_dir}/MacOS/VirusTotalCLI"

if command -v codesign >/dev/null 2>&1; then
  /usr/bin/codesign --force --deep --sign - "${app_path}" >/dev/null
  /usr/bin/codesign --verify --deep --strict "${app_path}"
fi

/usr/bin/touch "${app_path}"
echo "Built: ${app_path}"
