set fish_greeting ""

# Native (Apple Silicon) Homebrew first, ahead of the old Intel one in /usr/local.
# Static equivalent of `brew shellenv fish`, which costs ~110ms to run on every shell.
set -gx HOMEBREW_PREFIX /opt/homebrew
set -gx HOMEBREW_CELLAR /opt/homebrew/Cellar
set -gx HOMEBREW_REPOSITORY /opt/homebrew
fish_add_path --global --move --path /opt/homebrew/bin /opt/homebrew/sbin

# set -gx TERM xterm-256color

# theme
set -g theme_color_scheme dracula
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# alias

alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
command -qv nvim && alias vim nvim


set -gx EDITOR nvim
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.cargo/bin $PATH

set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home 
set -gx ANDROID_HOME $HOME/Library/Android/sdk
set -gx PATH $ANDROID_HOME/emulator $PATH
set -gx PATH $ANDROID_HOME/platform_tools $PATH
set -gx PATH /Users/anantabastola/apache-maven-3.9.5/bin $PATH


# platform specific config
switch (uname)
  case Darwin
    source (dirname (status --current-filename))/mac-config.fish
  case Linux
    source (dirname (status --current-filename))/linux-config.fish
  case '*'
    source (dirname (status --current-filename))/windows-config.fish
end

if status is-interactive
    macchina
end

starship init fish | source

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

# conda (Miniforge): load on first use instead of on every shell start (~260ms).
# Run `conda activate base` to get the conda python on PATH.
set -l conda_bin /opt/homebrew/Caskroom/miniforge/base/bin/conda
if test -x $conda_bin
    function conda --description 'Lazy-load conda' --inherit-variable conda_bin
        functions --erase conda
        $conda_bin shell.fish hook | source
        conda $argv
    end
end

# Oracle's MySQL install (the server on :3306); puts the mysql client on PATH
fish_add_path --global --append /usr/local/mysql/bin


# pnpm
set -gx PNPM_HOME "/Users/anantabastola/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Ruby: the environment `rvm default` (ruby-3.2.2) sets up, without spawning
# bash + rvm on every shell start (~1.8s). `rvm use <version>` still works.
set -gx rvm_path $HOME/.rvm
set -gx GEM_HOME $HOME/.rvm/gems/ruby-3.2.2
set -gx GEM_PATH $HOME/.rvm/gems/ruby-3.2.2:$HOME/.rvm/gems/ruby-3.2.2@global
set -gx PATH $HOME/.rvm/gems/ruby-3.2.2/bin $HOME/.rvm/gems/ruby-3.2.2@global/bin $HOME/.rvm/rubies/ruby-3.2.2/bin $HOME/.rvm/bin $PATH

set -gx WASMTIME_HOME "$HOME/.wasmtime"

string match -r ".wasmtime" "$PATH" > /dev/null; or set -gx PATH "$WASMTIME_HOME/bin" $PATH

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/anantabastola/.lmstudio/bin
# End of LM Studio CLI section
