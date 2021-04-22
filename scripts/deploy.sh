


sudo docker run -it --rm cuda /bin/bash


# Launch ml-jneto-jupyter on cuda1
ssh -i ~/.ssh/jn2020 -p 9022 jneto@ml.dlogic.io /bin/bash -c "
    (sudo docker rm -f ml-jneto-jupyter 2> /dev/null || true) &&\
    sudo docker pull digitallogic/private:ml &&\
    sudo docker run -d \
        --name ml-jneto-jupyter \
        --restart unless-stopped \
        --gpus all \
        --network test \
        -p 8001:8888 \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -v /home/jneto/dev:/users/ml/dev \
        -v /dataf:/users/ml/dev/data \
        digitallogic/private:ml /bin/bash scripts/ju.sh
"


# alias cuda='ssh -i ~/.ssh/pneto_cuda -p 9022 -L 9000:localhost:9000 pneto@ml.dlogic.io'
