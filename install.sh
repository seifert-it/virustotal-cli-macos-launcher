#!/bin/zsh

set -euo pipefail

project_dir="${0:A:h}"
app_name="VirusTotal CLI.app"
install_dir="${1:-${HOME}/Desktop}"
source_app="${project_dir}/dist/${app_name}"
target_app="${install_dir}/${app_name}"

/bin/zsh "${project_dir}/scripts/build-app.sh"
mkdir -p "${install_dir}"

if [[ -e "${target_app}" ]]; then
  timestamp="$(date +%Y%m%d-%H%M%S)"
  backup_app="${install_dir}/VirusTotal CLI.backup-${timestamp}.app"
  mv "${target_app}" "${backup_app}"
  echo "Preserved previous app as: ${backup_app}"
fi

/usr/bin/ditto "${source_app}" "${target_app}"
/usr/bin/touch "${target_app}"

echo "Installed: ${target_app}"
echo "Double-click the app to open VirusTotal CLI in Terminal."
