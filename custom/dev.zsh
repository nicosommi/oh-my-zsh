workspace=~/workspace
ide=code
ide_ws_extension=code-workspace
text_editor=code

alias ws="cd $workspace"

remember-passphrase-per-session() {
  copy-to-clipboard "AddKeysToAgent yes"
  echo "Add this at the first line in ~/.ssh/config with a text editor (copied to clipboard): AddKeysToAgent yes"
  read -s -k '?Press any key to open it with the text editor or CTRL+C to abort.'
  $text_editor ~/.ssh/config
}
