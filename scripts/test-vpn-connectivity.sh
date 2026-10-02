#!/usr/bin/env bash
set -u
SERVER_IP="10.21.74.130"

echo "== ICMP hacia WEB-SV-2174 =="
ping -c 4 "$SERVER_IP" || true

echo
echo "== HTTPS hacia WEB-SV-2174 =="
curl -k -I --connect-timeout 5 "https://${SERVER_IP}" || true
