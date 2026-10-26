# ananta's dotfiles

![Preview](./preview.gif "Pro edits btw.")

macOS (Apple Silicon) setup: **kitty → tmux → fish → Neovim**, with Catppuccin Mocha everywhere.

| Folder | What it configures |
|---|---|
| `fish/` | Shell: aliases, PATH, fzf key bindings, starship prompt |
| `tmux/` | Multiplexer: prefix `Ctrl-a`, Catppuccin status bar, session save/restore |
| `nvim/` | Editor: lazy.nvim, LSP (mason), blink.cmp, Telescope, treesitter |
| `kitty/` | Terminal: font, opacity, theme |
| `git/`, `lazygit/` | Git identity, delta diffs |
| `mise/` | Global Node / Python / Ruby versions |
| `starship/`, `htop/` | Prompt and htop settings |
| `Brewfile` | Every CLI tool and app, for `brew bundle` |

---

## Setup on a new Mac

```bash
# 1. Command line tools, Homebrew, this repo
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
git clone git@github.com:ananta/dotfiles.git ~/.dotfiles

# 2. Everything in the Brewfile
brew bundle --file ~/.dotfiles/Brewfile

# 3. Symlink the configs into ~ (one folder at a time works too: `stow tmux`)
cd ~/.dotfiles && stow */

# 4. fish as the login shell
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish

# 5. Language runtimes and tmux plugins
mise install
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm   # then in tmux: Ctrl-a I
```

Open Neovim once and let it finish installing plugins, language servers and parsers.

Private hosts, usernames and IPs go in `fish/.config/fish/local.fish`. It's gitignored and loaded automatically when present.

---

## Daily keybindings

### tmux

The prefix is **`Ctrl-a`**: press it, let go, then press the key.

| Action | Keys |
|---|---|
| Move between panes | `Ctrl-a` `h` / `j` / `k` / `l` |
| Resize pane (keep tapping) | `Ctrl-a` `H` / `J` / `K` / `L` |
| Split left/right / top/bottom | `Ctrl-a` `%` / `"` |
| Zoom pane in/out | `Ctrl-a` `z` |
| New window / next / previous | `Ctrl-a` `c` / `n` / `p` |
| Window by number | `Ctrl-a` `0`…`9` |
| Pick session or window | `Ctrl-a` `s` / `w` |
| Detach (everything keeps running) | `Ctrl-a` `d`, back with `tmux attach` |
| Copy mode (vi keys, `Space` start selection, `Enter` copy) | `Ctrl-a` `[` |
| **Save snapshot** | `Ctrl-a` `Ctrl-s` |
| **Restore snapshot** | `Ctrl-a` `Ctrl-r` |
| Reload config | `Ctrl-a` `r` |
| Mouse on / off | `Ctrl-a` `m` / `M` |

Snapshots are also saved every 15 minutes. Nothing restores automatically, so after a restart or reboot press `Ctrl-a` `Ctrl-r`. Claude Code panes come back with `claude --continue`.

### Shell (fish, vi mode)

| Action | Keys |
|---|---|
| Fuzzy search command history | `Ctrl-R` |
| Fuzzy pick a file, insert its path | `Ctrl-T` |
| Fuzzy jump to a subfolder | `Ctrl-F` |
| Accept the grey autosuggestion | `Ctrl-L` or `→` |
| Normal / insert mode | `Esc` / `i` |

Inside fzf: `Ctrl-j`/`Ctrl-k` move, `Tab` multi-select, `Enter` pick, `Esc` cancel.

Aliases: `vim` → nvim, `g` → git, `k` → kubectl, `ll` / `llt` → eza list / tree.

### Neovim

The leader key is **`Space`**.

**Files and search**

| Action | Keys |
|---|---|
| Find file | `Space` `f` |
| Search text in project (live grep) | `Ctrl-t` |
| Open buffers | `Space` `b` |
| File tree toggle | `Space` `e` |
| File tree in current window | `sf` |

In Telescope: `Ctrl-j`/`Ctrl-k` move, `Enter` open, `Ctrl-v` / `Ctrl-x` open in vertical / horizontal split, `Ctrl-q` send results to quickfix, `Esc` `Esc` close.

In the file tree: `l` / `Enter` open, `a` new file (end with `/` for a folder), `r` rename, `d` delete, `x` / `c` / `p` cut / copy / paste, `H` toggle dotfiles, `g?` all keys.

**Windows and buffers**

| Action | Keys |
|---|---|
| Split below / right | `ss` / `sv` |
| Move between splits | `sh` / `sj` / `sk` / `sl` |
| Resize split | `Ctrl-↑` `Ctrl-↓` `Ctrl-←` `Ctrl-→` |
| Next / previous buffer | `Shift-l` / `Shift-h` |
| Clear search highlight | `Esc` |

**Code (LSP)**

| Action | Keys |
|---|---|
| Go to definition / declaration | `gd` / `gD` |
| References / implementation | `gr` / `gi` |
| Hover docs | `K` |
| Signature help | `Ctrl-k` |
| Rename symbol | `Space` `rn` |
| Code action | `Space` `ca` |
| Line diagnostics | `gl` |
| Next / previous diagnostic | `]d` / `[d` |
| All diagnostics in a list | `Space` `q` |
| Document symbols | `gO` |
| Format file (also on every save) | `:Format` |

**Completion (insert mode)**

| Action | Keys |
|---|---|
| Next / previous item | `Ctrl-j` / `Ctrl-k` (or `Tab` / `Shift-Tab`) |
| Accept | `Enter` |
| Open menu / docs | `Ctrl-Space` |
| Scroll docs | `Ctrl-f` / `Ctrl-b` |
| Close menu | `Ctrl-e` |

**Editing**

| Action | Keys |
|---|---|
| Comment line / selection | `gcc` / `gc` (visual) |
| Move selection down / up | `J` / `K` or `⌥j` / `⌥k` (visual) |
| Indent and keep selection | `>` / `<` (visual) |
| Paste over selection without losing the clipboard | `p` (visual) |

**Git**

| Action | Keys |
|---|---|
| Next / previous change (hunk) | `]g` / `[g` |
| Preview hunk | `Space` `gp` |
| Stage / unstage hunk | `Space` `gs` |
| Reset hunk | `Space` `gr` |
| Open lazygit | `Space` `gg` |

**Terminal**

| Action | Keys |
|---|---|
| Floating terminal | `Ctrl-\` |
| Back to normal mode | `Esc` or `jk` |
| Leave terminal to a split | `Ctrl-h` / `j` / `k` / `l` |

### lazygit

| Action | Keys |
|---|---|
| Stage / unstage file | `Space` |
| Stage everything | `a` |
| Commit | `c` |
| Push / pull | `P` / `p` |
| Switch panel | `Tab` or `1`…`5` |
| Cycle diff renderer | `\|` |
| Help | `?` |
| Quit | `q` |

### git with delta

`git diff`, `git show` and `git log -p` are syntax-highlighted automatically. `n` / `N` jump between files. Side by side: `git -c delta.side-by-side=true diff`.

---

## Tools

**mise: Node, Python, Ruby versions.** Switches automatically in folders with `.nvmrc`, `.node-version`, `.python-version`, `.ruby-version` or `mise.toml`.

```fish
mise ls                         # installed and active versions
mise use node@22                # pin for this project (writes mise.toml)
mise use -g node@22             # change the global default
mise install                    # install what a project pins
mise exec node@20 -- npm test   # one command with another version
```

**yarn:** comes from Node via corepack. Just run `yarn`, and answer `Y` the first time in a new Node version.

**uv: Python packages and environments.**

```fish
uv init myproj; cd myproj   # new project
uv add requests             # add a dependency (creates .venv)
uv run python main.py       # run in the project environment
uvx ruff check .            # run a tool once without installing it
```

**OrbStack: Docker and Kubernetes.** `docker`, `docker compose` and `kubectl` work as usual. Containers are reachable at `<name>.orb.local`. Kubernetes: `orb start k8s`, then `kubectl config use-context orbstack`, and `orb stop k8s` when done.

**kitty:** change theme with `kitten themes`. Font size: `Cmd-+` / `Cmd--` / `Cmd-0`.

---

## Maintenance

```fish
brew update; and brew upgrade    # tools and apps
mise upgrade                     # runtimes
rustup update                    # Rust
brew bundle cleanup --file ~/.dotfiles/Brewfile   # list installed things not in the Brewfile
```

Add a new tool by putting it in the `Brewfile`. Add a new config by creating `<tool>/<path relative to ~>` in this repo and running `stow <tool>`.
