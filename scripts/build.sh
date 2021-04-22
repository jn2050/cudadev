#
# Build cudadev image
#
# The build process is run on cuda1
# RUN: ~/dev/lib/cudadev/scripts/build.sh
#

# Sync by git and build image on cuda1
cd ~/dev/lib/cudadev &&\
git add . && git commit -m 'update' || git push &&\
ssh -i ~/.ssh/jn2020 -p 9022 jneto@ml.dlogic.io \
    "cd ~/lib && rm -rf cudadev && git clone https://github.com/jn2050/cudadev.git" &&\
ssh -i ~/.ssh/jn2020 -p 9022 jneto@ml.dlogic.io \
    "cd ~/lib/cudadev &&\
    sudo docker build -t cudadev . --no-cache &&\
    sudo docker tag cudadev digitallogic/private:cudadev &&\
    sudo docker push digitallogic/private:cudadev"

exit 0

# Run image to test
docker run -dit --name cudadev-test cudadev /bin/bash

# Check packages (inside container)

# Check Cuda toolkit version
nvcc --version

# Check python version

