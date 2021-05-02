# Docker PapyrusCS

A map generator for Minecraft Bedrock worlds. 

## minimal example

The myworld directory have to contain the "db" folder.

```
    docker run \
      --rm \
      -v /Users/mtoe/Documents/mcserver-bedrock/myworld:/tmp/world/:rw \
      -v /Users/mtoe/Documents/export/:/tmp/export/:rw \
```
