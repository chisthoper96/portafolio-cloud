
# Documento de Arquitectura – Redes en la Nube

## 1. Descripción de la Solución
Se diseñó una VPC en AWS para la empresa ficticia **DataConnect**, con el objetivo de aislar recursos, mejorar la seguridad y permitir escalabilidad.  
La VPC cuenta con subredes públicas y privadas, un Internet Gateway y un NAT Gateway para comunicación saliente desde la red privada.

## 2. Rango de Direcciones IP
- VPC: `10.0.0.0/16`
- Subred pública: `10.0.1.0/24`
- Subred privada: `10.0.2.0/24`

## 3. Componentes Principales
- **VPC:** Segmento de red aislado en AWS.
- **Subred Pública:** Alberga servidores con acceso a Internet.
- **Subred Privada:** Contiene servidores internos (BD, aplicaciones).
- **Internet Gateway:** Permite comunicación con Internet.
- **NAT Gateway:** Permite a las instancias privadas actualizarse sin quedar expuestas.
- **Route Tables:** Definen el ruteo de tráfico de cada subred.
- **Security Groups:** Controlan acceso a nivel de instancia.
- **NACLs:** Reglas adicionales de control de tráfico a nivel de subred.

## 4. Justificación de Servicios
- **Seguridad:** separación de recursos críticos en subred privada.
- **Escalabilidad:** posibilidad de agregar más subredes en distintas zonas de disponibilidad.
- **Flexibilidad:** se pueden integrar VPN Site-to-Site en el futuro para conectar con on-premise.


