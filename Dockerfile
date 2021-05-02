FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    unzip \ 
    libgdiplus \ 
    libc6-dev \ 
    wget \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /papyruscs
RUN wget https://github.com/mjungnickel18/papyruscs/releases/download/v0.5.1/papyruscs-dotnetcore-0.5.1-linux64.zip
RUN ls -la
RUN pwd
RUN unzip *.zip -d .
RUN chmod +x /papyruscs/PapyrusCs


WORKDIR /tmp/resourcepack
RUN wget -O textures.zip https://aka.ms/resourcepacktemplate
RUN pwd
RUN ls -la
RUN unzip *.zip -d .
RUN mv /tmp/resourcepack/textures /papyruscs/textures


WORKDIR /tmp/world
WORKDIR /tmp/export

RUN useradd -ms /bin/bash bob
USER bob

ENV threads="1"
ENV htmlfile="index.html" 
ENV imageformat="webp" 

ENTRYPOINT /papyruscs/PapyrusCs --world "/tmp/world/db" --output "/tmp/export"  -f ${imageformat} --htmlfile ${htmlfile} --threads ${threads}