# dotfiles-devpod

Basic `chezmoi`-managed dotfiles for shared devpods. The baseline avoids
private shell plugins so it can be applied in project devpods without requiring
personal GitHub SSH access.

## Bootstrap

Default bootstrap on a machine that is not using the local checkout workflow:

```bash
chezmoi init --apply https://github.com/nbari/dotfiles-devpod.git
```

That uses the standard `chezmoi` source directory, typically:

```bash
~/.local/share/chezmoi
```

Local checkout bootstrap from this repository clone:

```bash
./setup.sh
```

After chezmoi applies the dotfiles, `run_after_90-install-mise-tools.sh.tmpl`
runs `mise install` so tools declared in `~/.config/mise/config.toml`, including
`slick`, are installed best-effort.

## Optional Git Identity

The shared baseline does not hardcode a Git user or signing setup. Pass these
environment variables before running `chezmoi apply` or `./setup.sh` when a
devpod needs personal Git identity:

```bash
export GIT_USER_NAME="Your Name"
export GIT_USER_EMAIL="you@example.com"
```

SSH commit signing is also optional:

```bash
export GIT_SIGNING_KEY="ssh-ed25519 AAAA..."
export GIT_SSH_SIGNING_PROGRAM="/path/to/op-ssh-sign"
```

When `GIT_SIGNING_KEY` is set, commit and tag signing are enabled. When these
variables are omitted, the generated `.gitconfig` stays generic and does not
require private keys, 1Password, or GitHub SSH access.

## Project `.envrc`

For project devpods, keep project-specific values in an `.envrc` at the root of
the project that will launch DevPod. `direnv` loads those variables when the
shell enters the project directory, and the project launcher can pass the
allowed values into the dotfiles install script.

Dummy project `.envrc`:

```sh
# Git identity used by dotfiles-devpod when creating ~/.gitconfig.
export GIT_USER_NAME="Dev User"
export GIT_USER_EMAIL="dev@example.com"

# Optional SSH commit signing. Omit these for a generic unsigned Git config.
export GIT_SIGNING_KEY="ssh-ed25519 AAAA..."
export GIT_SSH_SIGNING_PROGRAM="/usr/bin/op-ssh-sign"

# Optional DevPod dotfiles source.
export DEVPOD_DOTFILES="https://github.com/nbari/dotfiles-devpod.git"
export DEVPOD_DOTFILES_SCRIPT="setup.sh"
```

Approve it once from the project root:

```bash
cd ~/projects/example-repo
direnv allow
```

Then launch the devpod from that same shell:

```bash
scripts/dev-up
```

The launcher should forward only the variables needed by the dotfiles script:

```sh
set -- --ide none \
  --dotfiles "${DEVPOD_DOTFILES:-https://github.com/nbari/dotfiles-devpod.git}" \
  --dotfiles-script "${DEVPOD_DOTFILES_SCRIPT:-setup.sh}" \
  "$@"

for var in \
  GIT_USER_NAME \
  GIT_USER_EMAIL \
  GIT_SIGNING_KEY \
  GIT_SSH_SIGNING_PROGRAM
do
  eval "value=\${$var:-}"
  [ -n "$value" ] && set -- "$@" --dotfiles-script-env "$var=$value"
done

exec devpod up "$project_dir" "$@"
```

Keep secrets out of committed `.envrc` files. Use `.envrc` for selectors and
non-secret context, and resolve secrets in the project launcher or through
short-lived tools such as SSO, SSH agent forwarding, or 1Password.
