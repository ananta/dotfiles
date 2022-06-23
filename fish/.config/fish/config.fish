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



