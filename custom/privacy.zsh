changeMac() {
  local net=${1:-en0}
  local mac=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')
  sudo ifconfig $net ether $mac
  sudo ifconfig $net down
  sudo ifconfig $net up
  echo "Your new physical address for interface $net is $mac"
}
