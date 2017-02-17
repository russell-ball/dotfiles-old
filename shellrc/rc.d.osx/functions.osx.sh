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

function ec2-ip-from-tags {
  local ec2_data selected_instance

  ec2_data=$( \
    aws ec2 describe-instances \
      --region us-east-1 \
      --query 'Reservations[*].Instances[*].{Tags:Tags, IP:PrivateIpAddress}' \
      --filters "Name=instance-state-name,Values=running"
  )

  selected_instance=$( \
    echo "$ec2_data" \
    | jq -r '.[][] | [ "IP=\(.IP)", (.Tags | map("\(.Key)=\(.Value|tostring)") | sort | join("|")) ] | join("|")' \
    | sort \
    | fzf --prompt="Select instance > " \
  )

  echo "$selected_instance" | sed 's/^.*[[:<:]]IP=\([^\|]*\)\|.*$/\1/'
}

function ssh-ec2-id() {
  ssh $(ec2-ip-from-id "$1") "${@:2}"
}

function ssh-ec2-name() {
  ssh $(ec2-ip-from-name "$1") "${@:2}"
}

function ssh-ec2 {
  local instance_ip

  instance_ip=$(ec2-ip-from-tags)
  echo "Connecting to $instance_ip..."
  ssh $instance_ip
}
