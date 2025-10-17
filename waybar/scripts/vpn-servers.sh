# vpn-servers.sh

declare -A VPN_SERVERS=(
  ["51.159.197.108"]="Paris (vpn02-par)"
  ["163.172.20.106"]="Paris (vpn03-par)"
  ["163.172.20.107"]="Paris (vpn03-par variant)"
  ["51.15.9.205"]="Amsterdam (vpn04-ams)"
  ["195.154.119.165"]="Paris (vpn05-par)"
  ["51.158.144.32"]="Amsterdam (vpn06-ams)"
  ["163.172.83.106"]="Paris (vpn07-par)"
  ["51.15.187.53"]="Paris (vpn08-par)"
  ["51.159.55.86"]="Paris (vpn11-par)"
  ["51.158.144.31"]="Amsterdam (vpn13-ams)"
  ["51.159.196.108"]="Paris (vpn14-par)"
  ["163.172.211.109"]="Amsterdam (vpn19-ams)"
  ["51.159.198.167"]="Paris (vpn20-par)"
  ["163.172.20.108"]="Paris (vpn21-par)"
)

declare -A VPN_PREFIXES=(
  ["51.159.197"]="Paris (vpn02-par)"
  ["163.172.20"]="Paris (vpn03-par range)"
  ["51.15.9"]="Amsterdam (vpn04-ams range)"
  ["195.154.119"]="Paris (vpn05-par range)"
  ["51.158.144"]="Amsterdam (vpn06-ams range)"
  ["163.172.83"]="Paris (vpn07-par range)"
  ["51.15.187"]="Paris (vpn08-par range)"
  ["51.159.55"]="Paris (vpn11-par range)"
  ["51.158.144"]="Amsterdam (vpn13-ams range)"
  ["51.159.196"]="Paris (vpn14-par range)"
  ["163.172.211"]="Amsterdam (vpn19-ams range)"
  ["51.159.198"]="Paris (vpn20-par range)"
  ["163.172.20"]="Paris (vpn21-par range)"
)
