tools=$workspace/my-tools
alias my-tools="pushd $tools"

clone-my-tools() {
  echo "Usage: clone-my-tools [REPOSITORY]"
  echo "Example: clone-my-tools git@github.com:nicosommi/my-tools.git"
  if ((${#1} == 0)); then
    echo "Missing argument, see usage";
  else
    git clone $1 $tools
  fi
}

update-my-tools() {
  if stat $tools 1>/dev/null 2>&1; then
    pushd $tools > /dev/null
    git pull --rebase --stat origin master 1>/dev/null 2>&1
    echo "Tools up to date."
    load-my-tools
    install-js-tools
    popd 1>/dev/null 2>&1
  fi
}

push-my-tools() {
  pushd $tools
  git add .
  git commit
  git push origin master
  popd

}

# initialize my tools if present, quietly
load-my-tools() {
  if stat $tools 1>/dev/null 2>&1; then
    pushd $tools > /dev/null
    source init.zsh
    popd 1>/dev/null 2>&1
  fi
}

init() {
  load-my-tools
  echo "."
}

init

