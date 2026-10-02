# Plan de direccionamiento — Infraestructura 2

| Segmento | Dispositivo / interfaz | Dirección | Máscara / prefijo | Función |
|---|---|---:|---:|---|
| Salida GNS3/NAT | ISP-2174 Fa0/0 | DHCP (observado: 192.168.136.129) | /24 | Acceso a Internet del laboratorio |
| WAN FortiGate–ISP | ISP-2174 Fa1/0 | 21.74.3.1 | /30 | Lado ISP |
| WAN FortiGate–ISP | FG-T2-2174 port1 | 21.74.3.2 | /30 | WAN FortiGate |
| WAN ISP–Cisco | ISP-2174 Fa1/1 | 21.74.4.1 | /30 | Lado ISP |
| WAN ISP–Cisco | R-CISCO-2174 Fa1/0 | 21.74.4.2 | /30 | Peer IPsec Cisco |
| Usuarios VLAN 10 | FG-T2-2174 VLAN10-USERS | 10.21.74.1 | /25 | Gateway + DHCP |
| Usuarios VLAN 10 | PC-USER-2174 | DHCP (evidencia: 10.21.74.10) | /25 | Cliente |
| Servidores | R-CISCO-2174 Fa1/1 | 10.21.74.129 | /28 | Gateway del servidor |
| Servidores | WEB-SV-2174 | 10.21.74.130 | /28 | Apache HTTPS |
| Gestión FortiGate | FG-T2-2174 port3 | 192.168.79.99 | /24 | GUI de administración |

## DHCP de usuarios

- Rango: `10.21.74.10` – `10.21.74.100`
- Gateway: `10.21.74.1`
- DNS configurados: `8.8.8.8` y `1.1.1.1`

## Redes protegidas por IPsec

- Red local FortiGate: `10.21.74.0/25`
- Red remota Cisco/servidor: `10.21.74.128/28`
- Peer FortiGate: `21.74.4.2`
- Peer Cisco: `21.74.3.2`
