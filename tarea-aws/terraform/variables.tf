variable "aws_region" {
  description = "Región principal de despliegue"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Entorno actual (dev, qa, prod)"
  type        = string
}

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC"
  type        = string
}

variable "instance_type" {
  description = "Tipo de capacidad para EC2"
  type        = string
}