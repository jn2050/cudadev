#
# Deploy cudadev image
#
# Commands to be executed on cuda1 host
#

# ####################################################################################
# cudadev shell
# ####################################################################################

sudo docker run -d --name cudadev-jneto --gpus all \
    -v /home/jneto:/users/ml/home \
    -v /dataf:/users/ml/home/data \
    cudadev /bin/bash

# ####################################################################################
# cudadev jupyter
# ####################################################################################

# For jneto

# For jranito

# ####################################################################################
# cudadev shell
# ####################################################################################

# Access to cuda1 host (requires ssh setup for user)
alias cuda1='ssh -i ~/.ssh/jn2020 -p 9022 -L 8001:localhost:8001 jneto@ml.dlogic.io'