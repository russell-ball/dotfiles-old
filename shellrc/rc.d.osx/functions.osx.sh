# `o` with no arguments opens current directory, otherwise opens the given
# location
function o() {
  if [ $# -eq 0 ]; then
    open .
  else
    open "$@"
  fi
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
  local port="${1:-8000}"
  sleep 1 && open "http://localhost:${port}/" &
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

# Restart bluetooth due to OSX shenanigans
function restart-bluetooth() {
  sudo kextunload -b com.apple.iokit.BroadcomBluetoothHostControllerUSBTransport
  sudo kextload -b $BTKEXT com.apple.iokit.BroadcomBluetoothHostControllerUSBTransport
}

function ec2-ip-from-id() {
  echo $(aws ec2 describe-instances --region us-east-1 --instance-ids $1 --output text --query 'Reservations[*].Instances[*].PrivateIpAddress')
}

function ec2-ip-from-name() {
  echo $(aws ec2 describe-instances --region us-east-1 --filters "Name=tag:Name,Values=\"$1\"" --output text --query 'Reservations[*].Instances[*].PrivateIpAddress')
}

function ec2-ip-from-tag() {
  echo $(aws ec2 describe-instances --region us-east-1 --filters "Name=tag:$1,Values=\"$2\"" --output text --query 'Reservations[*].Instances[*].PrivateIpAddress')
}

function ec2-ip-from-environment-tag() {
  echo $(aws ec2 describe-instances --region us-east-1 --filters "Name=tag:environment,Values=\"$1\"" "Name=tag:$2,Values=\"$3\"" --output text --query 'Reservations[*].Instances[*].PrivateIpAddress' | head -n1)
}

function ec2-ip-for-nexus-db() {
  echo $(aws ec2 describe-instances --region us-east-1 --filters "Name=tag:environment,Values=\"$1\"" "Name=tag:provider_nexus_$2""_db,Values=\"true\"" "Name=tag:postgresql_replication_role,Values=\"master\"" --output text --query 'Reservations[*].Instances[*].PrivateIpAddress' | head -n1)
}

function ec2-ip-for-nexus-search-db() {
  echo $(aws ec2 describe-instances --region us-east-1 --filters "Name=tag:environment,Values=\"$1\"" "Name=tag:postgresql_replication_group,Values=\"search-$2\"" "Name=tag:provider_nexus_search_db,Values=\"true\"" "Name=tag:postgresql_replication_role,Values=\"master\"" --output text --query 'Reservations[*].Instances[*].PrivateIpAddress' | head -n1)
}

function ec2-ip-for-nexus-core-db() {
  echo $(aws ec2 describe-instances --region us-east-1 --filters "Name=tag:environment,Values=\"$1\"" "Name=tag:provider_nexus_db,Values=\"true,core\"" "Name=tag:postgresql_replication,Values=\"true,master\"" --output text --query 'Reservations[*].Instances[*].PrivateIpAddress' | head -n1)
}

function ssh-ec2-id() {
  ssh $(ec2-ip-from-id "$1") "${@:2}"
}

function ssh-ec2-name() {
  ssh $(ec2-ip-from-name "$1") "${@:2}"
}

function ssh-ec2-tag() {
  ssh $(ec2-ip-from-tag "$1" "$2") "${@:3}"
}
