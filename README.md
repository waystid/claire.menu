Command line tool for setting up new virtual machines

## HOW TO INSTALL

### As root user

```bash
wget -qO ./i https://raw.githubusercontent.com/waystid/claire.menu/main/claire.install &&\ 
chmod +x i &&\ 
./i
```

### As non root user

``` bash
sudo wget -qO ./i wget -qO ./i https://raw.githubusercontent.com/waystid/claire.menu/main/claire.install &&\ 
sudo chmod +x i &&\ 
sudo ./i
```

### From a non supported OS like unraid

This is not supported and a WIP. Run the following commands.

```bash
git clone -b main --single-branch https://github.com/ibracorp/ibramenu.git
cd ibramenu
docker compose up -d --build --force-recreate
```

### Access the continer

To generate the docker compose file for your apps you need to run ibramenu from within the container, run the following command.

```bash
docker run -it ibramenu /bin/bash
```

### Compose File Example

```yaml
---
services:
  ibramenu:
    image: ibramenu:v0.0.0-1alpha
    container_name: ibramenu
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/EST
    volumes:
      - /opt/appdata:/opt/appdata
      - /var/run/docker.sock:/var/run/docker.sock
    restart: unless-stopped
```