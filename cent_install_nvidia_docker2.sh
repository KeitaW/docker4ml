# If you have nvidia-docker 1.0 installed: we need to remove it and all existing GPU containers
docker volume ls -q -f driver=nvidia-docker | xargs -r -I{} -n1 docker ps -q -a -f volume={} | xargs -r docker rm -f
sudo yum remove nvidia-docker

# Add the package repositories
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-container-runtime/$distribution/nvidia-container-runtime.repo | \
  sudo tee /etc/yum.repos.d/nvidia-container-runtime.repo

# Install the nvidia runtime hook
sudo yum install -y nvidia-container-runtime-hook

# Test nvidia-smi with the latest official CUDA image
# You can't use `--runtime=nvidia` with this setup.
docker run --rm nvidia/cuda:9.0-base nvidia-smi
