# 42cursus_Inception

## Project Overview ⚙️

This project is part of the 42 curriculum and aims to enhance system administration skills using Docker. The objective is to create and configure a small infrastructure with multiple services running in isolated Docker containers. The infrastructure will be deployed on a Virtual Machine.

---

## Features 🛠️

- **NGINX**
  - Configured with TLSv1.2 or TLSv1.3 for secure connections.
- **WordPress**
  - Runs with `php-fpm` in its own container (without NGINX).
  - Uses MariaDB as the database backend.
- **MariaDB**
  - Dedicated container hosting the database.
- **Volumes**
  - Two volumes:
    1. WordPress database.
    2. WordPress website files.
- **Networking**
  - Docker network connects all containers.
  - Only the NGINX container exposes port 443 to the host machine.
- **Security**
  - No hardcoded passwords in Dockerfiles.
  - Use of environment variables and Docker secrets.
- **Resilience**
  - Containers automatically restart in case of failure.

---

## Setup Instructions

1. **Clone the repository**
   ```bash
   git clone git@github.com:Ekkoz897/42cursus_Inception.git
   cd inception
   ```

2. **Configure environment variables**
   - Edit the `.env` file in `srcs/` to match your setup.

3. **Build and start the containers**
   ```bash
   make
   ```

4. **Access the services**
   - Visit `https://apereira.42.fr` in your browser.

---

## What are Containers ?

- Containers are an abstraction at the application layer that package code and its dependencies together. They allow multiple containers to run on the same machine, sharing the host operating system's kernel while functioning as isolated processes in user space. Containers are lightweight compared to virtual machines (VMs), with container images typically being just tens of megabytes in size. This compactness enables running more applications and reduces the need for additional VMs and operating systems.

## What are Virtual Machines ?

- Virtual machines (VMs) provide an abstraction of physical hardware, allowing a single server to host multiple virtual servers. A hypervisor enables the simultaneous operation of multiple VMs on a single machine. Each VM includes a full operating system, the application, and its required binaries and libraries, resulting in images that are often tens of gigabytes in size. Additionally, VMs are slower to boot compared to containers.

## Why Docker and What is the problem that is solving ?

- Before Docker, scenarios involving developers and testers often faced compatibility issues. For example, a developer’s code might work flawlessly on their machine but fail on the tester's system. This could be due to missing dependencies or improperly configured environment variables. Identifying such issues was only part of the challenge—resolving them was cumbersome and inconsistent.

### How Docker Addresses These Issues

Docker offers a standardized environment for developing, testing, and deploying applications. It eliminates compatibility issues by packaging the application along with all its dependencies into a single, portable container.

---

| Virtual Machine | Docker |
| --- | --- |
| Occupies significant memory space | Requires much less memory |
| Slow boot time | Quick boot time, leveraging the host kernel |
| Difficult to scale | Easy to scale |
| Less efficient | highly efficienct |
| Storage volumes cannot be shared across VM's  | Volumes can be shared between the host and containers |

![https://www.docker.com/wp-content/uploads/2021/11/container-what-is-container.png.webp](https://www.docker.com/wp-content/uploads/2021/11/container-what-is-container.png.webp)

### Key Components in Docker Architecture

- **Infrastructure :** The physical components of a computer, such as the CPU, hard disk, and other hardware.
- **Host Operating System :** The operating system running on the host machine (e.g., Linux, macOS, or Windows).
- **Docker Engine :** The core component of Docker, responsible for building and running containers. It includes:
    - Docker Daemon: A background process that manages Docker containers.
    - Dor Client: A command-line interface for interacting with the Docker daemon.
- **App :** The application running in a container, isolated from other containers.

---

## Resources

- [Docker Documentation](https://docs.docker.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [NGINX with TLS](https://nginx.org/en/docs/http/configuring_https_servers.html)
- [WordPress Configuration](https://wordpress.org/support/article/editing-wp-config-php/)
- [MariaDB Documentation](https://mariadb.com/kb/en/)
