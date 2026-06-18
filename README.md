## How-to run Terraria server
### Method 1:
```bash
# Manual create new world
docker run -it --rm -v terraria:/root/.local/share/Terraria/Worlds ghcr.io/superpkson/terraria:latest
# Auto run the world
docker run -p 7777:7777 -v terraria:/root/.local/share/Terraria/Worlds --restart unless-stopped ghcr.io/superpkson/terraria:latest -world /root/.local/share/Terraria/Worlds/default.wld -port 7777 -players 16
```

### Method 2:
```bash
# Auto create new world
docker run -d -p 7777:7777 -v terraria:/root/.local/share/Terraria/Worlds --restart unless-stopped ghcr.io/superpkson/terraria:latest -world /root/.local/share/Terraria/Worlds/default.wld -autocreate 3 -worldname default -port 7777 -players 16
```

## Caution:
* Replace "default" as your own world name
* Also rename the world file name(*.wld)