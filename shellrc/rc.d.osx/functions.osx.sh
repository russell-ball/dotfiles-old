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

function ip_from_instance() {
  echo $(aws ec2 describe-instances --region us-east-1 --filters "Name=tag:Name,Values=\"$1\"" --output text --query 'Reservations[*].Instances[*].PrivateIpAddress')
}

function ip_from_tag() {
  echo $(aws ec2 describe-instances --region us-east-1 --filters "Name=tag:$1,Values=\"$2\"" --output text --query 'Reservations[*].Instances[*].PrivateIpAddress' | head -n1)
}

function ssh-aws-name() {
  ssh $(ip_from_instance "$1") "${@:2}"
}

function ssh-aws-tag() {
  ssh $(ip_from_tag "$1") "${@:2}"
}
