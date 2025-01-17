# minecraft_server_web
```
services:
  java17:
    image: ghcr.io/nightmeer/minecraftserverweb:java-17
    restart: unless-stopped
    volumes:
      - ./server:/server
    environment:
      - startfile=startserver.sh
      - username=root
      - password=root
    ports:
      - 25565:25565
      - 8222:8222
```