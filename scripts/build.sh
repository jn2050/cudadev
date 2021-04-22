#
# Build cudadev image
#
# RUN: ~/dev/lib/cudadev/scripts/deploy.sh
#

# Build image on cuda1
cd ~/dev/lib/cudadev &&\
git add . && git commit -m 'update' && git push &&\
ssh -i ~/.ssh/jn2020 -p 9022 jneto@ml.dlogic.io \
    "cd ~/lib && rm -rf ml && git clone https://github.com/jn2050/ml.git && cd ml"

# export img=ops
export img=cuda

cd ~/lib/docker
sudo docker build -t cuda -f Dockerfile.cuda .
sudo docker run -it --rm cuda

# conda install -y -c rapidsai -c nvidia -c numba -c conda-forge cudf=0.18 python=3.8

exit 0

git add . && git commit -m 'update' || git push
ssh -i ~/.ssh/jn2020 -p 9022 jneto@ml.dlogic.io \
    "cd ~/lib && rm -rf docker && git clone https://github.com/jn2050/docker.git && cd docker &&\
    sudo docker build -t $img . &&\
    sudo docker tag ml digitallogic/private:ml &&\
    sudo docker push digitallogic/private:ml" &&\





#
#sudo docker build -t $img -f Dockerfile.$img .
#sudo docker run -it --rm $img
# nvcc --version