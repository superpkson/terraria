FROM debian:12-slim
ARG TARGETARCH

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    unzip
RUN wget --no-check-certificate https://www.terraria.org/api/download/pc-dedicated-server/terraria-server-1456.zip
RUN unzip terraria-server-1456.zip -d /terraria && rm terraria-server-1456.zip
RUN apt-get remove -y wget unzip && apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN rm -rf /terraria/1456/Mac && rm -rf /terraria/1456/Windows
RUN cd /terraria/1456/Linux && chmod +x TerrariaServer.bin.x86*

VOLUME ["/root/.local/share/Terraria/Worlds"]
EXPOSE 7777
WORKDIR /terraria/1456/Linux
ENTRYPOINT ["./TerrariaServer.bin.x86_64"]