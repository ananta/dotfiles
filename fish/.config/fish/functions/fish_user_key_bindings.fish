function fish_user_key_bindings
  # vim-like: Ctrl-L accepts the autosuggestion
  bind \cl forward-char

  # Ctrl-D deletes a character instead of closing the shell (EOF)
  bind \cd delete-char

  # Ctrl-F: fuzzy-jump to a directory (fzf's Alt-C; Option isn't Alt in kitty)
  if functions -q fzf-cd-widget
    bind -M default \cf fzf-cd-widget
    bind -M insert \cf fzf-cd-widget
  end
end
