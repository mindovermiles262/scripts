#!/bin/bash

# Security groups to compare
GROUP_A="sg-04d4004db56f7bd1c sg-04e5da5b32dab1fc7 sg-09dbd01aa85156ad7"
GROUP_B="sg-01e4b749f39709d15 sg-0252cdf6f54e76d96 sg-07dd07b5205993b18 sg-082a28d16e3847d40 sg-0abd228959d15df8e"

# Build IP lookup file: "IP|Name"
LOOKUP_FILE=/tmp/sg_ip_names.txt
cat > "$LOOKUP_FILE" << 'EOF'
70.123.11.18/32|Ryan Washburn
74.105.175.162/32|Tao Yu
70.21.180.184/32|Geliang Tong
154.36.230.43/32|Zhihong Lu
107.133.173.229/32|Uday
138.199.43.184/32|Komal
174.95.204.159/32|Yijun Lyu
24.61.82.245/32|Haorong
68.196.244.206/32|Yongqing
69.113.88.223/32|Ming Fang
75.87.140.163/32|Srilekha
149.20.199.228/32|Yuanhua
70.236.195.146/32|Jonathan
73.234.205.66/32|Aaron Li
24.188.55.92/32|Alec Zhu
146.115.144.38/32|Daniel Brown
73.190.191.167/32|Forest Yan
68.197.66.125/32|Hai
173.63.253.137/32|Justin Xiong
179.61.216.132/32|Richard Fu
69.231.75.247/32|Richard Fu 2
136.52.110.161/32|Kaiyu Wan
47.20.213.225/32|Tina Li
183.236.148.204/32|Xing Xu
183.236.148.185/32|Xing Xu 2
71.184.241.8/32|Jeff Jing
57.132.171.194/32|Tammy Ren
98.114.45.110/32|Ryan DiCesare
98.109.32.132/32|Ruikang Ni
135.180.59.182/32|Andrew Duss
173.62.190.112/32|Joshua
72.78.206.252/32|Jeremy Hall
74.67.13.133/32|Kelly
75.114.175.186/32|Uday new home
98.250.133.25/32|Uday temp IP
44.214.227.68/32|VPN Server
3.223.61.64/32|feature.ledgerrun.com server
3.92.112.28/32|QA server / QA master server
44.210.233.21/32|QA worker
54.156.13.28/32|UAT Server
54.221.225.17/32|PPD Server
EOF

lookup_name() {
  local ip="$1"
  local match
  match=$(grep "^${ip}|" "$LOOKUP_FILE" | cut -d'|' -f2)
  echo "${match:-$ip}"
}

# Colors
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
CYAN='\033[0;36m'; BOLD='\033[1m'; RESET='\033[0m'

print_table() {
  local title="$1"
  local color="$2"
  local file="$3"

  echo -e "\n${color}${BOLD}${title}${RESET}"
  printf "${BOLD}%-30s %-10s %-10s %-22s %-25s${RESET}\n" "GROUP ID" "FROM PORT" "TO PORT" "DESTINATION" "NAME"
  printf '%0.s─' {1..100}; echo

  if [ ! -s "$file" ]; then
    echo "  (none)"
    return
  fi

  while IFS='|' read -r gid from to dest; do
    [ "$from" = "-1" ] && from="ALL"
    [ "$to"   = "-1" ] && to="ALL"
    name=$(lookup_name "$dest")
    printf "${color}%-30s %-10s %-10s %-22s %-25s${RESET}\n" "$gid" "$from" "$to" "$dest" "$name"
  done < "$file"
}

echo "=== Fetching ingress rules ==="

aws ec2 describe-security-groups \
  --group-ids $GROUP_A \
  --query "SecurityGroups[*].{GroupId:GroupId,GroupName:GroupName,Ingress:IpPermissions}" \
  --output json > group_a.json

aws ec2 describe-security-groups \
  --group-ids $GROUP_B \
  --query "SecurityGroups[*].{GroupId:GroupId,GroupName:GroupName,Ingress:IpPermissions}" \
  --output json > group_b.json

echo "Group A (sg-1, sg-2, sg-3) saved to group_a.json"
echo "Group B (sg-4, sg-5, sg-6, sg-7) saved to group_b.json"

echo ""
echo "=== Comparing ingress rules ==="

extract_rules() {
  local file=$1
  jq -r '
    .[] |
    .GroupId as $gid |
    .Ingress[] |
    . as $rule |
    ($rule.IpRanges[].CidrIp? // empty     | [$gid, ($rule.FromPort // "ALL" | tostring), ($rule.ToPort // "ALL" | tostring), .] | join("|")),
    ($rule.Ipv6Ranges[].CidrIpv6? // empty  | [$gid, ($rule.FromPort // "ALL" | tostring), ($rule.ToPort // "ALL" | tostring), .] | join("|")),
    ($rule.PrefixListIds[].PrefixListId? // empty | [$gid, ($rule.FromPort // "ALL" | tostring), ($rule.ToPort // "ALL" | tostring), .] | join("|")),
    ($rule.UserIdGroupPairs[].GroupId? // empty   | [$gid, ($rule.FromPort // "ALL" | tostring), ($rule.ToPort // "ALL" | tostring), .] | join("|"))
  ' "$file"
}

extract_rules group_a.json | sort > /tmp/rules_a.txt
extract_rules group_b.json | sort > /tmp/rules_b.txt

comm -23 /tmp/rules_a.txt /tmp/rules_b.txt > /tmp/only_a.txt
comm -13 /tmp/rules_a.txt /tmp/rules_b.txt > /tmp/only_b.txt
comm -12 /tmp/rules_a.txt /tmp/rules_b.txt > /tmp/shared.txt

print_table "Only in Group A (sg-1, sg-2, sg-3)"        "$RED"   /tmp/only_a.txt
print_table "Only in Group B (sg-4, sg-5, sg-6, sg-7)"  "$CYAN"  /tmp/only_b.txt
print_table "Present in both groups"                     "$GREEN" /tmp/shared.txt

echo ""
printf '%0.s─' {1..100}; echo
echo -e "${BOLD}SUMMARY${RESET}"
printf '%0.s─' {1..100}; echo
printf "${RED}${BOLD}  %-30s %s${RESET}\n"   "Group A only:"  "$(wc -l < /tmp/only_a.txt)"
printf "${CYAN}${BOLD}  %-30s %s${RESET}\n"  "Group B only:"  "$(wc -l < /tmp/only_b.txt)"
printf "${GREEN}${BOLD}  %-30s %s${RESET}\n" "Shared rules:"  "$(wc -l < /tmp/shared.txt)"
printf '%0.s─' {1..100}; echo

# Cleanup
rm -f /tmp/rules_a.txt /tmp/rules_b.txt /tmp/only_a.txt /tmp/only_b.txt /tmp/shared.txt "$LOOKUP_FILE"
