# 🚀 Proyecto DevOps: Automatización Completa

![Docker](https://img.shields.io/badge/Docker-Container-blue?style=flat&logo=docker)
![GitHub Actions](https://img.shields.io/badge/CI-GitHub_Actions-black?style=flat&logo=github)
![Ansible](https://img.shields.io/badge/IaC-Ansible-red?style=flat&logo=ansible)
![Node.js](https://img.shields.io/badge/App-Node.js-green?style=flat&logo=nodedotjs)
![Vagrant](https://img.shields.io/badge/Infra-Vagrant-blueviolet?style=flat&logo=vagrant)

# DevOps - Aplicación de ejemplo

Descripción corta  
Esta pequeña aplicación Express sirve una página en la raíz y un endpoint de salud. Está pensada para demostraciones con Vagrant, Docker, Ansible y scripts de monitoreo para mostrar un ciclo DevOps completo (CI/CD + Ops).

Características principales
- Servidor HTTP en el puerto 3000 con endpoints `/` y `/health`.
- Contenerización multi-stage para imágenes optimizadas (Alpine).
- Soporte para ejecución local, en contenedor Docker y en VM via Vagrant.
- Playbook Ansible para aprovisionamiento y despliegue.
- Script de monitoreo y auto-healing para resiliencia.

Arquitectura del Pipeline
El flujo de trabajo automatizado es:

- CI: GitHub Actions prueba y construye la imagen Docker.
- CD: Ansible aprovisiona la VM y despliega el contenedor.
- Ops: Scripts de monitoreo (cron/bash) comprueban `/health` y reinician el servicio si es necesario.

Stack Tecnológico
- Node.js (Express)
- Docker (multi-stage)
- GitHub Actions (CI)
- Vagrant (Ubuntu 22.04)
- Ansible (IaC / orquestación)
- Bash / Cron (monitoring & auto-healing)

Requisitos
- Git, Node.js, Docker, Vagrant, VirtualBox y Ansible.

Instalación y uso rápido

1) Clonar y entrar al repo
$ git clone https://github.com/TU_USUARIO/NOMBRE_REPO.git
$ cd NOMBRE_REPO

2) Ejecutar localmente
$ npm install
$ node server.js
Endpoints:
- Raíz: http://localhost:3000/
- Salud: http://localhost:3000/health

3) Con Docker
$ docker build -t devops-app .
$ docker run -p 3000:3000 devops-app

4) Con Vagrant (VM)
$ vagrant up
Accede a: http://192.168.56.10 (según [Vagrantfile](Vagrantfile))

5) Despliegue automatizado con Ansible
$ ansible-playbook -i inventory.ini deploy.yml

Monitoreo y Resiliencia (Auto-Healing)
- El script [scripts/monitor_app.sh](scripts/monitor_app.sh) verifica periódicamente `/health` y reinicia el servicio si falla.
- Prueba manual:
  - vagrant ssh
  - sudo docker stop mi-webapp
  - esperar ~2 minutos (cron) y comprobar que el servicio se revive automáticamente.

Archivos clave
- [server.js](server.js) — servidor Express; símbolos importantes: [`app`](server.js), [`app.get`](server.js)
- [dockerfile](dockerfile) — Docker multi-stage (Alpine)
- [Vagrantfile](Vagrantfile) — definición VM (Ubuntu 22.04)
- [deploy.yml](deploy.yml) — playbook maestro de Ansible
- [inventory.ini](inventory.ini) — inventario Ansible
- [.github/workflows/docker-publish.yml](.github/workflows/docker-publish.yml) — CI pipeline
- [scripts/monitor_app.sh](scripts/monitor_app.sh) — script de monitoreo
- [package.json](package.json) — dependencias y scripts


