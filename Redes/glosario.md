# 📖 Glosario de Redes en la Nube

## VPC (Virtual Private Cloud)
Red privada virtual en AWS donde se pueden desplegar recursos aislados y seguros.  
Es el bloque fundamental de redes en la nube.

## Subred (Subnet)
Segmento de la VPC que divide el rango IP en partes más pequeñas.  
Pueden ser **públicas** (con acceso a Internet) o **privadas** (solo internas).

## CIDR (Classless Inter-Domain Routing)
Notación para definir rangos de direcciones IP, por ejemplo: `10.0.0.0/16`.  
El número `/16` indica cuántos bits se usan para la red.

## Internet Gateway (IGW)
Componente que permite que las instancias dentro de una VPC tengan comunicación con Internet.  
Se asocia a la VPC y se usa en la tabla de ruteo pública.

## NAT Gateway
Servicio que permite a las instancias en una subred privada **salir a Internet** para actualizaciones, sin ser accesibles desde fuera.  

## Route Table
Tabla de reglas de ruteo que define hacia dónde va el tráfico de la subred (ej. Internet, otra subred o un NAT).

## Security Group (SG)
Firewall a nivel de **instancia**.  
Es **stateful**: si permites tráfico de entrada, la respuesta siempre está permitida.

## Network ACL (NACL)
Firewall a nivel de **subred**.  
Es **stateless**: cada regla debe configurarse en ambos sentidos (entrada y salida).

## Bastion Host
Instancia en una subred pública usada como punto de acceso seguro para conectarse a instancias en subredes privadas.

## DNS (Domain Name System)
Sistema que traduce nombres de dominio (ej. `google.com`) a direcciones IP.  
En AWS se gestiona con **Route 53**.

## VPN Site-to-Site
Conexión segura entre la red on-premise (empresa local) y la VPC en AWS.  
Permite extender la infraestructura local hacia la nube.

---
