# Running configurations

Los archivos de esta carpeta corresponden a la configuración final de la Infraestructura 2.

- `ISP-2174.txt`: configuración del router ISP.
- `R-CISCO-2174-sanitized.txt`: configuración del router Cisco del sitio servidor. La PSK se reemplazó por `<REDACTED_PSK>`.
- `SW-USERS-2174.txt`: configuración depurada del switch; se omitieron banners de licencia repetitivos.
- `FG-T2-2174-sanitized.conf`: extracto funcional del FortiGate. Se omitieron contraseña administrativa, PSK, certificados y claves privadas.

> No se publica el backup bruto del FortiGate porque contiene secretos y material criptográfico del dispositivo.
