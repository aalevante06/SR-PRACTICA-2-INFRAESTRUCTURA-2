#!/usr/bin/env bash
set -euo pipefail

# WEB-SV-2174 - 10.21.74.130/28
sudo apt update
sudo apt install -y apache2 openssl
sudo a2enmod ssl
sudo mkdir -p /etc/apache2/ssl

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/apache2/ssl/server.key \
  -out /etc/apache2/ssl/server.crt \
  -subj "/C=DO/ST=Santo Domingo/L=Santo Domingo Este/O=Israel Gaming/OU=IT/CN=10.21.74.130"

sudo sed -i 's|^[[:space:]]*SSLCertificateFile.*|SSLCertificateFile /etc/apache2/ssl/server.crt|' /etc/apache2/sites-available/default-ssl.conf
sudo sed -i 's|^[[:space:]]*SSLCertificateKeyFile.*|SSLCertificateKeyFile /etc/apache2/ssl/server.key|' /etc/apache2/sites-available/default-ssl.conf
sudo a2ensite default-ssl
sudo apache2ctl configtest
sudo systemctl enable --now apache2
sudo systemctl restart apache2
curl -k -I https://127.0.0.1
