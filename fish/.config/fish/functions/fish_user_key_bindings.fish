function fish_user_key_bindings
  # vim-like: Ctrl-L accepts the autosuggestion
  bind \cl forward-char

  # Ctrl-D deletes a character instead of closing the shell (EOF)
  bind \cd delete-char
end
