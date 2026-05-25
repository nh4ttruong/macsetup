if ! grep -q "export PROMPT=\"" ~/.zshrc; then
  echo 'export PROMPT="%F{green}%n@%m%f %F{cyan}%~%f %# "' >> ~/.zshrc
  source ~/.zshrc
fi