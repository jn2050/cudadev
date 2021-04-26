#
# Deploy cudadev image
#
# Commands to be executed on cuda1 host
#


sudo docker network create -d overlay --attachable devnet
sudo docker run --name redisearchdev --network devnet -d redislabs/redisearch

# ####################################################################################
# cudadev shell
# ####################################################################################

sudo docker run -it --rm --name cudadev-jneto \
    -v /home/jneto:/users/ml/dev \
    -v /dataf:/users/ml/dev/data \
    cudadev /bin/bash

alias cudadev="sudo docker run -it --rm --name cudadev-jneto -v /home/jneto:/users/ml/dev -v /dataf:/users/ml/dev/data cudadev /bin/bash"

sudo docker run -it --rm --name cudadev-jranito \
    -v /home/jranito:/users/ml/dev \
    -v /dataf:/users/ml/dev/data \
    cudadev /bin/bash

# ####################################################################################
# cudadev jupyter
#
# Ports on host for cudadev-ju:
#   jneto: 8201
#   jranito: 8202
#
# ####################################################################################

# For jneto

(sudo docker rm -f cudadev-ju-jneto || true) &&\
sudo docker run -dit --name cudadev-ju-jneto --restart unless-stopped \
    --gpus all \
    -p 8201:8888 \
    -v /home/jneto/dev:/users/ml/dev \
    -v /dataf:/users/ml/dev/data \
    --network devnet \
    cudadev /bin/bash scripts/ju.sh

# Access from mac: mapping cuda1 port 8201 to mac local port 8201 (access on mac browser 127.0.0.1:8201)
ssh -i ~/.ssh/jn2020 -p 9022 -L 8201:localhost:8201 jneto@ml.dlogic.io

# For jranito
sudo docker run -dit --name cudadev-ju-jranito --restart unless-stopped \
    --gpus all \
    -p 8202:8888 \
    -v /home/jranito/dev:/users/ml/dev \
    -v /dataf:/users/ml/dev/data \
    cudadev /bin/bash scripts/ju.sh
# sudo docker rm -f cudadev-ju-jranito

# Access from mac: mapping cuda1 port 8202 to mac local port 8202 (access on mac browser 127.0.0.1:8202)
ssh -i ~/.ssh/key -p 9022 -L 8001:localhost:8001 -L 8202:localhost:8202 jranito@ml.dlogic.io


# ####################################################################################
# etc
# ####################################################################################

# --no-cache
# --gpus all