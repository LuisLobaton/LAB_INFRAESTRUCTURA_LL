# Arquitectura AWS - Despliegue Automatizado con Terraform

Este repositorio contiene la Infraestructura como Código (IaC) para el despliegue de una arquitectura en la nube de Amazon Web Services (AWS), cumpliendo con los requisitos del diagrama base proporcionado. 

El proyecto está diseñado para ser escalable y soporta tres entornos de ejecución: **DEV**, **QA** y **PROD**, utilizando una estrategia de automatización mediante GitHub Actions (CI/CD).

## Tecnologías y Herramientas
* **Proveedor Cloud:** AWS (Amazon Web Services)
* **Infraestructura como Código:** Terraform
* **Autenticación:** AWS IAM Identity Center (SSO)
* **Integración y Despliegue Continuo (CI/CD):** GitHub Actions
* **Control de Versiones:** Git & GitHub

## Estructura del Proyecto

La configuración se basa en la reutilización de módulos de Terraform mediante archivos de variables (`.tfvars`) para aislar los entornos.

```text
tarea-aws
 ┣  .github
 ┃ ┗  workflows
 ┃   ┣ deploy.yml      # Pipeline de despliegue automático
 ┃   ┗ destroy.yml     # Pipeline de destrucción bajo demanda
 ┣  terraform
 ┃ ┣  environments
 ┃ ┃ ┣ dev.tfvars      # Variables para entorno de Desarrollo
 ┃ ┃ ┣  qa.tfvars       # Variables para entorno de Pruebas
 ┃ ┃ ┗ prod.tfvars     # Variables para entorno de Producción
 ┃ ┣  main.tf           # Definición de recursos (VPC, Subnets, EC2)
 ┃ ┗ variables.tf      # Declaración de variables globales
 ┗ README.md
