```bash
# First time
docker run -it --rm -p 7777:7777 -v terraria:/root/.local/share/Terraria/Worlds --restart unless-stopped ghcr.io/superpkson/terraria:latest -autocreate 3 -worldname default
```
