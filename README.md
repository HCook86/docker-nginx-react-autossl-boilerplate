# Boilerplate for Nginx with Auto-SSL and React stack using Docker 

## Installation

1. #### Clone the repository:
   ```bash
   git clone https://github.com/HCook86/docker-nginx-react-autossl-boilerplate.git
2. #### Clone your react app into the /app directory
    
    Example file tree:

    ``` 
        . 
        ├── README.md 
        ├── docker-compose.yml 
        └── webserver 
            ├── Dockerfile 
            ├── nginx.conf 
            └── app  
                ├── README.md 
                ├── package-lock.json 
                ├── package.json 
                ├── public 
                └── src 
            
    ```

3. #### Change environment variables by editing conf.env

    ```
    # .env

    ALLOWED_DOMAINS='henrycook.net'
    SITES='henrycook.net=nginx:80'
    NGINX_SERVER_NAME='*.henrycook.net henrycook.net'
    ```

4. #### Install docker engine and docker compose on your system

    Installation guides for [Docker Engine](https://docs.docker.com/engine/install/) and [Docker Compose](https://docs.docker.com/compose/install/#scenario-two-install-the-docker-compose-plugin)

5. #### Run:
    ```bash
   docker compose up --build  -d
## Notes

This stack uses the [docker-nginx-auto-ssl](https://github.com/Valian/docker-nginx-auto-ssl) container to automatically renew the SSL certificates.

If you require further configuration, you are welcome to edit the nginx.conf file, Dockerfile or docker-compose files.

## Common Errors

 - Make sure the firewall allows traffic on ports 80 and 443
