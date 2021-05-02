docker build . -t marctv/papyruscs-local 
docker run \
  --rm \
  -v /Users/mtoe/Downloads/mcserver-bedrock/DETROIT:/tmp/world/:rw \
  -v /Users/mtoe/Downloads/export:/tmp/export/:rw \
  -e parameters=" -f webp -q 50 --limitx -10,10  "  \
  -e maxqueue="1" \
  -e threads="1" \
  -it marctv/papyruscs-local