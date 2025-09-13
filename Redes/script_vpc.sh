#!/bin/bash
# Script para crear una VPC con subred pública y privada en AWS
# Región: us-east-1

REGION="us-east-1"
VPC_CIDR="10.0.0.0/16"
PUB_SUBNET_CIDR="10.0.1.0/24"
PRIV_SUBNET_CIDR="10.0.2.0/24"
AZ1="us-east-1a"
AZ2="us-east-1b"

# Crear VPC
VPC_ID=$(aws ec2 create-vpc --cidr-block $VPC_CIDR --query 'Vpc.VpcId' --output text --region $REGION)
aws ec2 modify-vpc-attribute --vpc-id $VPC_ID --enable-dns-hostnames "{\"Value\":true}"

# Crear subred pública
PUB_SUBNET_ID=$(aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block $PUB_SUBNET_CIDR --availability-zone $AZ1 --query 'Subnet.SubnetId' --output text --region $REGION)

# Crear subred privada
PRIV_SUBNET_ID=$(aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block $PRIV_SUBNET_CIDR --availability-zone $AZ2 --query 'Subnet.SubnetId' --output text --region $REGION)

# Crear Internet Gateway
IGW_ID=$(aws ec2 create-internet-gateway --query 'InternetGateway.InternetGatewayId' --output text --region $REGION)
aws ec2 attach-internet-gateway --internet-gateway-id $IGW_ID --vpc-id $VPC_ID --region $REGION

# Crear tabla de ruteo pública
PUB_RT_ID=$(aws ec2 create-route-table --vpc-id $VPC_ID --query 'RouteTable.RouteTableId' --output text --region $REGION)
aws ec2 create-route --route-table-id $PUB_RT_ID --destination-cidr-block 0.0.0.0/0 --gateway-id $IGW_ID --region $REGION
aws ec2 associate-route-table --subnet-id $PUB_SUBNET_ID --route-table-id $PUB_RT_ID --region $REGION

echo "VPC creada: $VPC_ID"
echo "Subred pública: $PUB_SUBNET_ID"
echo "Subred privada: $PRIV_SUBNET_ID"
echo "Internet Gateway: $IGW_ID"
