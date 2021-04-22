#
# Deploy cudadev image
#
# Commands to be executed on cuda1 host
#
# 
#

# Access to cuda1 host (requires ssh setup for user)
alias cuda1='ssh -i ~/.ssh/jn2020 -p 9022 -L 8001:localhost:8001 jneto@ml.dlogic.io'

# ####################################################################################
# cudadev shell
# ####################################################################################

sudo docker run -it --rm --name cudadev-jfn \
    -v /home/jneto:/users/ml/nb \
    -v /dataf:/users/ml/nb/data \
    cudadev /bin/bash



# ####################################################################################
# cudadev jupyter
#
# Ports on host for cudadev-ju:
#   jfn: 8201
#   jvr: 8202
#
# ####################################################################################

# For jfn
docker rm -f cudadev-ju-jfn 2> /dev/null &&\
docker run -dit --name cudadev-ju-jfn --restart unless-stopped \
    -p 8201:8888 \
    -v /home/jneto:/users/ml/nb \
    -v /dataf:/users/ml/nb/data \
    cudadev /bin/bash scripts/ju.sh

# For jvr
docker rm -f cudadev-ju-jvr 2> /dev/null &&\
docker run -dit --name cudadev-ju-jfn --restart unless-stopped \
    -p 8202:8888 \
    -v /home/jneto:/users/ml/nb \
    -v /dataf:/users/ml/nb/data \
    cudadev /bin/bash scripts/ju.sh


# ####################################################################################
# etc
# ####################################################################################

# --no-cache
# --gpus all