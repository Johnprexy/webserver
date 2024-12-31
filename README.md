**Webserver Project**

This project sets up a web server environment using Docker, Docker Compose, and shell scripting. The configuration supports both Apache HTTP Server (`httpd`) and NGINX running on separate containers. Below is a detailed description of the setup, challenges faced, and how they were resolved.


**Project Overview**
The project demonstrates how to:
1. Automate the creation of a web server using a shell script.
2. Use a Dockerfile to configure the script and build an Apache HTTP server container.
3. Extend the setup to include an NGINX container alongside Apache using Docker Compose.
4. Serve custom welcome messages based on the hostname of the machine.

---

## **Technologies Used**
- **Docker**: Containerization platform for deploying applications.
- **Docker Compose**: Tool for defining and running multi-container Docker applications.
- **Shell Scripting**: Used for automating server configuration.
- **Ubuntu 20.04**: Base image for building the Apache container.

## **Features**
- Apache HTTP Server container displaying a custom welcome message.
- NGINX container running alongside Apache.
- Easy setup with `docker-compose.yml`.
- Port mapping for accessing both servers locally.

---

## **Setup Instructions**

### Prerequisites
- Docker installed on your system.
- Docker Compose installed.
- Git installed for cloning the repository.

### Steps

1. **Clone the Repository**
   ```bash
   git clone https://github.com/johnprexy/webserver.git
   cd webserver
   ```

2. **Build and Run the Containers**
   Run the following command to build and start the containers:
   ```bash
   docker-compose up -d
   ```

3. **Access the Servers**
   - Apache HTTP Server: Visit [http://localhost:8080](http://localhost:8080).
   - NGINX: Visit [http://localhost:8081](http://localhost:8081).

4. **Verify the Welcome Message**
   - Apache will display a message like: `Hello <hostname>, welcome to my webserver.`
   - NGINX serves its default page.

---

## **Challenges and Solutions**

### Challenge 1: **Slow Build Times on Ubuntu Base Image**
- **Cause**: The `tzdata` package prompts for geographic area configuration during installation.
- **Solution**: Preconfigure `tzdata` using environment variables in the Dockerfile:
  ```dockerfile
  ENV DEBIAN_FRONTEND=noninteractive
  RUN apt update -y && apt install -y apache2 tzdata && apt clean
  ```

### Challenge 2: **Hostname Display in Welcome Message**
- **Cause**: Containers display their internal hostname instead of the host machine’s hostname.
- **Solution**: Pass the host’s hostname as an environment variable in `docker-compose.yml` and use it in the script.
  ```yaml
  environment:
    HOSTNAME: ${HOSTNAME}
  ```

### Challenge 3: **Port Conflicts**
- **Cause**: Port 8080 or 8081 was already in use.
- **Solution**: Identify and free the conflicting ports using `lsof -i:8080` and `kill <PID>`.
---

## **Acknowledgements**
Special thanks to Docker and GitHub communities for their extensive documentation and support.

---

Feel free to contribute to this repository or raise issues if you encounter any problems!

