sure() {
  read -s -k '?Are you sure? Press any key to continue or CTRL+C to abort'
}

copy-to-clipboard() {
  if ((${#1} == 0)); then
    echo "Missing first argument, see usage";
    echo "Usage: copy-to-clipboard \"Something\""
    return -1;
  fi

  if whence pbcopy 1>/dev/null 2>&1; then
    echo $1 | pbcopy
  elif whence xclip 1>/dev/null 2>&1; then
    echo $1 | xclip -selection c
  else
    echo "No copy tool found on the system"
  fi
}

paste-from-clipboard() {
  if whence pbpaste 1>/dev/null 2>&1; then
    pbpaste
  elif whence xclip 1>/dev/null 2>&1; then
    xclip -selection clipboard -o
  else
    echo "No paste tool found on the system"
  fi
}
