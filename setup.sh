#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
user_bin_dir="${HOME}/.local/bin"
chezmoi_bin=""

mkdir -p "${user_bin_dir}"
export PATH="${user_bin_dir}:${PATH}"

if command -v chezmoi >/dev/null 2>&1; then
  chezmoi_bin="$(command -v chezmoi)"
elif [ -x "${user_bin_dir}/chezmoi" ]; then
  chezmoi_bin="${user_bin_dir}/chezmoi"
else
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "${user_bin_dir}"
  chezmoi_bin="${user_bin_dir}/chezmoi"
fi

"${chezmoi_bin}" init --apply --force "${repo_root}"
