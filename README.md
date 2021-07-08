# cockpit

## exemple de docker-compose pour cockpit
```
version: "3"

services:   
  cms:
    image: thecodeisgreen/cockpit:latest
    deploy:
      labels:
        - "traefik.enable=true"
        - "traefik.app.frontend.rule=Host:cms.thecodeisgreen.com"
        - "traefik.app.port=80"
        - "traefik.app.protocol=http"
        - "traefik.docker.network=base"
    environment:
      TZ: Europe/Paris
      COCKPIT_DATABASE_SERVER: mongodb://base_mongo_proxy
      COCKPIT_DATABASE_NAME: tcig_cms
    volumes:
      - tcig_cms_storage:/var/www/html/storage
      - tcig_cms:/var/www/html
    networks:
      - base
      - tcig-cms
      
volumes:
  tcig_cms_storage:
    driver: local-persist
    driver_opts:
      mountpoint: /srv/docker-data/tcig-cms/cockpit/storage   
  unmi_cms:
    driver: local-persist
    driver_opts:
      mountpoint: /srv/docker-data/tcig-cms/cockpit/html   
      
networks:
  base:
    external: true
    driver: overlay
  tcig-cms:
    driver: overlay
```
