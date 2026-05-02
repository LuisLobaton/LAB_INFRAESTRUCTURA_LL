provider "aws" {
  region = var.aws_region
}

# Creación de VPC base
resource "aws_vpc" "red_principal" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "vpc-arquitectura-${var.environment}"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# Subred Pública
resource "aws_subnet" "subred_publica" {
  vpc_id                  = aws_vpc.red_principal.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, 1)
  map_public_ip_on_launch = true
  availability_zone       = "${var.aws_region}a"

  tags = {
    Name        = "subnet-pub-${var.environment}"
    Environment = var.environment
  }
}

# Obtener la AMI más reciente de Amazon Linux
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# Servidor EC2 de prueba para despliegue
resource "aws_instance" "servidor_app" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.subred_publica.id

  tags = {
    Name        = "app-server-${var.environment}"
    Environment = var.environment
    Project     = "Entregable-Final"
  }
}