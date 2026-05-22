# Contributing

Thanks for your interest in improving **macsetup**. This project aims to stay small, readable, and idempotent — please keep contributions in that spirit.

## Ways to contribute

- **Bug reports** — open an issue with steps to reproduce, expected vs actual behavior, and your macOS version.
- **New tools or apps** — add a package to the appropriate array in [`setup`](setup).
- **New groups** — implement a `group_<name>()` function and register it in `GROUPS` and `GROUP_DESC`.
- **gitswitch** — edit the standalone [`gitswitch`](gitswitch) script. The setup's `git` group installs this file verbatim to `/usr/local/bin/gitswitch`, so keep it portable (no setup-specific helpers).
- **Documentation** — clarify usage, fix typos, improve examples.

## Getting started

```zsh
git clone https://github.com/nh4ttruong/macsetup.git
cd macsetup
git checkout -b my-change
```

## Adding a package

Add the formula or cask name to the matching array in [`setup`](setup):

| Type             | Array           |
| ---------------- | --------------- |
| CLI tool (brew)  | `CLI_PACKAGES`  |
| GUI app (cask)   | `CASK_APPS`     |
| Font             | `FONTS`         |

Keep arrays alphabetized within a group when possible.

## Adding a new group

1. Add the group name to `GROUPS` and a one-line description to `GROUP_DESC`.
2. Implement `group_<name>()` following the existing pattern:
   - Call `require_brew` if it depends on Homebrew.
   - Use `install_formula` / `install_cask` to stay idempotent.
   - Use `append_once` for shell-config edits.
   - For multi-item groups, use `select_items` to support the all-or-pick prompt.
3. Update the **Groups** table in [README.md](README.md).

## Style guide

- **Idempotent first** — every change must be safe to re-run.
- **No side effects on import** — code outside functions should only declare variables; behavior runs from `main`.
- **Quote variables** — `"$var"`, never bare `$var`.
- **Short helpers** — prefer small functions (`log`, `warn`, `fail`, `append_once`).

## Testing your change

Before opening a PR:

```zsh
# Syntax check
zsh -n setup

# Manual run of the affected group
./setup <group>

# Verify it's idempotent
./setup <group>   # second run should report "already installed"
```

If your change touches the git profile flow, test with throwaway values — **don't run it against your real global git config**.

## Submitting a pull request

1. Keep PRs focused — one logical change per PR.
2. Use a clear title: `add <tool>`, `fix <bug>`, `docs: <topic>`.
3. In the description, explain *why* the change is useful and how you tested it.
4. Link any related issue.

## Code of conduct

Be respectful. Assume good intent. Disagree on the technical merits.
