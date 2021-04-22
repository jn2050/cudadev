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
sudo docker rm -f cudadev-ju-jfn 2> /dev/null &&\
sudo docker run -dit --name cudadev-ju-jfn --restart unless-stopped \
    -p 8201:8888 \
    -v /home/jneto/dev:/users/ml/dev \
    -v /dataf:/users/ml/dev/data \
    cudadev /bin/bash scripts/ju.sh

# Access from mac: mapping cuda1 port 8201 to mac local port 8201 (access on mac browser 127.0.0.1:8201)
ssh -i ~/.ssh/jn2020 -p 9022 -L 8201:localhost:8201 jneto@ml.dlogic.io

# For jvr
sudo docker rm -f cudadev-ju-jvr 2> /dev/null &&\
sudo docker run -dit --name cudadev-ju-jfn --restart unless-stopped \
    -p 8202:8888 \
    -v /home/jranito/dev:/users/ml/dev \
    -v /dataf:/users/ml/dev/data \
    cudadev /bin/bash scripts/ju.sh


# ####################################################################################
# etc
# ####################################################################################

# --no-cache
# --gpus all