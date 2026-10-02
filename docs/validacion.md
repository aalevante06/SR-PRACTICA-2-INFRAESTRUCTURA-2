# Validación de la Infraestructura 2

La validación se realizó con evidencias de direccionamiento, VLAN, NAT, VPN IPsec y acceso HTTPS.

| Evidencia | Validación | Resultado |
|---|---|---|
| `02-isp-interfaces.png` | Interfaces del ISP operativas | OK |
| `03-isp-rutas.png` | Rutas conectadas y ruta por defecto | OK |
| `04-cisco-interfaces.png` | WAN y LAN del Cisco operativas | OK |
| `05-cisco-rutas.png` | Red de servidor y default route | OK |
| `06-cisco-nat-exemption.png` | Tráfico VPN excluido de PAT | OK |
| `07-switch-vlan10.png` | VLAN 10 activa | OK |
| `08-switch-trunk.png` | Trunk 802.1Q permite VLAN 10 | OK |
| `09-pc-user-dhcp.png` | Cliente recibe IP/gateway por DHCP | OK |
| `10-fortigate-interfaces.png` | WAN, VLAN 10 y túnel configurados | OK |
| `11-fortigate-policy-internet.png` | Política usuarios→Internet con NAT | OK |
| `12-fortigate-vpn-active.png` | Túnel FortiGate visible como activo | OK |
| `13-cisco-isakmp-active.png` | IKEv1 en `QM_IDLE / ACTIVE` | OK |
| `14-cisco-ipsec-sa.png` | Encaps/decaps > 0: tráfico cifrado real | OK |
| `15-vpn-on-ping.png` | ICMP usuario→servidor con VPN ON | OK |
| `16-vpn-on-https.png` | HTTPS devuelve `HTTP/1.1 200 OK` | OK |
| `17-vpn-off-sin-acceso.png` | Sin VPN: ICMP/HTTPS no alcanzan servidor | OK |
| `18-vpn-restaurado.png` | Tras restaurar VPN, HTTPS vuelve a responder | OK |

## Prueba funcional principal

Con el túnel activo, `PC-USER-2174` alcanza `WEB-SV-2174 (10.21.74.130)` por ICMP y HTTPS. Al desactivar el túnel, la comunicación al servidor falla. Al reactivarlo, el servicio HTTPS vuelve a estar disponible.

## NAT exemption del Cisco

La ACL 101 niega NAT para el flujo `10.21.74.128/28 -> 10.21.74.0/25` y permite PAT para el resto del tráfico, evitando que el tráfico protegido cambie de dirección antes de entrar al túnel.
