docker build . -t marctv/papyruscs-local 
docker run \
  --rm \
  -v /Users/mtoe/Downloads/mcserver-bedrock/DETROIT:/tmp/world/:rw \
  -v /Users/mtoe/Downloads/export:/tmp/export/:rw \
  -e parameters=" --limitx -10,10" \
  -it marctv/papyruscs-local