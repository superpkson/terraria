FROM debian:12-slim
ARG TARGETARCH

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    unzip
RUN wget --no-check-certificate https://www.terraria.org/api/download/pc-dedicated-server/terraria-server-1456.zip
RUN unzip terraria-server-1456.zip -d /terraria
RUN cd /terraria/1456/Linux && chmod +x TerrariaServer.bin.x86*

VOLUME ["/root/.local/share/Terraria/Worlds"]
EXPOSE 7777
WORKDIR /terraria/1456/Linux
ENTRYPOINT ["./TerrariaServer.bin.x86_64"]
CMD ["-port", "7777", "-config", "/root/.local/share/Terraria/Worlds/serverconfig.txt"]