workspace=~/workspace
ide=code
ide_ws_extension=code-workspace
text_editor=code
brave=/Applications/Brave.app/Contents/MacOS/Brave\ Browser
firefox=/Applications/Firefox.app/Contents/MacOS/firefox

alias ws="cd $workspace"

remember-passphrase-per-session() {
  copy-to-clipboard "AddKeysToAgent yes"
  echo "Add this at the first line in ~/.ssh/config with a text editor (copied to clipboard): AddKeysToAgent yes"
  read -s -k '?Press any key to open it with the text editor or CTRL+C to abort.'
  $text_editor ~/.ssh/config
}

brave-pwa() {
  $brave --app=$1
}

code-pwa() {
  local wd=${$(pwd)//\//\_}
  pushd $1
  docker run -d $2 -p 23000:3000 -v "$(pwd):/home/project:cached" --name "code-$wd" theiaide/theia:next
  brave-pwa http://localhost:23000
  popd
}

code-pwa-rm() {
  code-pwa $1 --rm
}
