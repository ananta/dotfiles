# ananta's dotfiles

![Preview](./preview.gif "Pro edits btw.")

## Steps to bootstrap a new Mac

1. Install Apple's Command Line Tools, which are prerequisites for Git and Homebrew.

```bash
xcode-select --install
```

2. Clone repo into new hidden directory.

```bash
# Use SSH (if set up)...
git clone git@github.com:ananta/dotfiles.git ~/.dotfiles

# ...or use HTTPS and switch remotes later.
git clone https://github.com/ananta/dotfiles.git ~/.dotfiles
```

3. Install Homebrew, followed by the software listed in the Brewfile.

```bash
# These could also be in an install script.

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Then pass in the Brewfile location...
brew bundle --file ~/.dotfiles/Brewfile

# ...or move to the directory first.
cd ~/.dotfiles && brew bundle
```

4. Run `stow` to symlink everything or just select what you want

```bash
stow */ # Everything (the '/' ignores the README)
```

```bash
stow tmux # Just my tmux config
```

## Programs

An updated list of all the programs I use can be found in the `BrewFile`.
