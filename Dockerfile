FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    unzip \ 
    libgdiplus \ 
    libc6-dev \ 
    wget \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /papyruscs
ARG PAPYRUSCS_VERSION="0.5.1"
RUN wget https://github.com/mjungnickel18/papyruscs/releases/latest/download/papyruscs-dotnetcore-${PAPYRUSCS_VERSION}-linux64.zip
RUN unzip *.zip -d .
RUN chmod +x /papyruscs/PapyrusCs

WORKDIR /tmp/resourcepack
RUN wget -O textures.zip https://aka.ms/resourcepacktemplate
RUN unzip *.zip -d .
RUN mv /tmp/resourcepack/textures /papyruscs/textures
RUN rm -r /tmp/resourcepack

WORKDIR /tmp/world
WORKDIR /tmp/export

RUN useradd -ms /bin/bash bob
USER bob

ENV threads="1"
ENV htmlfile="index.html" 
ENV maxqueue="1"  
ENV parameters=""

ENTRYPOINT /papyruscs/PapyrusCs --world "/tmp/world/db" --output "/tmp/export" --htmlfile ${htmlfile} --maxqueue ${maxqueue} --threads ${threads} ${parameters} 