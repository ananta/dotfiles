set fish_greeting ""

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

set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home
set -gx ANDROID_HOME $HOME/Library/Android/sdk
set -gx PATH $ANDROID_HOME/emulator $PATH
set -gx PATH $ANDROID_HOME/platform_tools $PATH
set -gx PATH /Users/anantabastola/apache-maven-3.9.5/bin $PATH

# set -gx PATH /usr/local/anaconda3/bin $PATH  # commented out by conda initialize

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

# alias for super computer
alias kssh 'kitty +kitten'
alias palmetto 'ssh anantab@login.palmetto.clemson.edu'
alias compbio 'ssh compbio-server-2@compbio.clemson.edu'
alias ndvim 'nvim --cmd "set rtp+=./"'
alias socashish 'ssh abastol@access.computing.clemson.edu -t ssh joey1'
alias soc 'ssh anantab@access.computing.clemson.edu -t ssh joey1'
alias deepgreen 'ssh anantab@access.computing.clemson.edu -t ssh deepgreen'
alias ashish_sftp 'sftp anantab@access.computing.clemson.edu -t sftp ashish@131.127.55.110'
alias ashish 'ssh anantab@access.computing.clemson.edu -t ssh ashish@130.127.55.110'
alias cpu_temp 'sudo powermetrics --samplers smc | grep -i "CPU die"'
alias pokemon '/Users/anantabastola/Library/Android/sdk/emulator/emulator -avd Pixel_2_API_31'
alias k 'kubectl'

export PALMETTO_SCP='anantab@xfer02-ext.clemson.edu:/home/anantab'

fish_add_path /Users/anantabastola/.spicetify

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /usr/local/anaconda3/bin/conda
    eval /usr/local/anaconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<


# pnpm
set -gx PNPM_HOME "/Users/anantabastola/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
