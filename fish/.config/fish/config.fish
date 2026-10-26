set fish_greeting ""

# Native (Apple Silicon) Homebrew first, ahead of the old Intel one in /usr/local.
# Static equivalent of `brew shellenv fish`, which costs ~110ms to run on every shell.
set -gx HOMEBREW_PREFIX /opt/homebrew
set -gx HOMEBREW_CELLAR /opt/homebrew/Cellar
set -gx HOMEBREW_REPOSITORY /opt/homebrew
fish_add_path --global --move --path /opt/homebrew/bin /opt/homebrew/sbin

# alias
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
command -qv nvim && alias vim nvim

set -gx EDITOR nvim
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.cargo/bin $PATH

set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
set -gx ANDROID_HOME $HOME/Library/Android/sdk
set -gx PATH $ANDROID_HOME/emulator $PATH
set -gx PATH $ANDROID_HOME/platform-tools $PATH
set -gx PATH /Users/anantabastola/apache-maven-3.9.5/bin $PATH

source (dirname (status --current-filename))/mac-config.fish

starship init fish | source

# fzf: Ctrl-R history, Ctrl-T files, Alt-C cd
if status is-interactive; and command -q fzf
    fzf --fish | source
end

alias kssh 'kitty +kitten'
alias ndvim 'nvim --cmd "set rtp+=./"'
alias cpu_temp 'sudo powermetrics --samplers smc | grep -i "CPU die"'
alias pokemon '/Users/anantabastola/Library/Android/sdk/emulator/emulator -avd Pixel_2_API_31'
alias k 'kubectl'
alias flush_dns 'sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'

# Private hosts, usernames and IPs live in local.fish (gitignored)
set -l local_config (dirname (status --current-filename))/local.fish
test -f $local_config; and source $local_config

fish_add_path /Users/anantabastola/.spicetify

# Oracle's MySQL install (the server on :3306); puts the mysql client on PATH
fish_add_path --global --append /usr/local/mysql/bin

# pnpm
set -gx PNPM_HOME "/Users/anantabastola/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# mise: Node, Python and Ruby versions (global defaults in ~/.config/mise/config.toml,
# per-project from .nvmrc / .node-version / .python-version / .ruby-version / mise.toml)
mise activate fish | source

set -gx WASMTIME_HOME "$HOME/.wasmtime"
string match -r ".wasmtime" "$PATH" > /dev/null; or set -gx PATH "$WASMTIME_HOME/bin" $PATH

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/anantabastola/.lmstudio/bin
# End of LM Studio CLI section

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
