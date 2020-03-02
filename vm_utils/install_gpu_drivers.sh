#!/bin/bash -e

cookie="$1"

# thanks to https://cloud.google.com/compute/docs/gpus/install-drivers-gpu#ubuntu-driver-steps
cuda_installed_now=0
if ! nvidia-smi; then
  curl -O http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.0.130-1_amd64.deb
  sudo dpkg -i cuda-repo-ubuntu1804_10.0.130-1_amd64.deb
  sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub

  sudo apt-get update && sudo apt-get install -y cuda
  cuda_installed_now=1
fi

script_dir=$(readlink -f $(dirname $0))

# script_dir = /path/to/voicefilter/vm_utils/ --> base_dir=../..
base_dir=$(realpath "${script_dir}/../..")

cd "${base_dir}"
mkdir -p downloaded/gpu_drivers && cd downloaded/gpu_drivers

# cudnn7 for cuda 10.1
#  'https://developer.nvidia.com/compute/machine-learning/cudnn/secure/7.6.5.32/Production/10.1_20191031/Ubuntu18_04-x64/libcudnn7-dev_7.6.5.32-1%2Bcuda10.1_amd64.deb' \
#  'https://developer.nvidia.com/compute/machine-learning/cudnn/secure/7.6.5.32/Production/10.1_20191031/Ubuntu18_04-x64/libcudnn7_7.6.5.32-1%2Bcuda10.1_amd64.deb' \



[ -f libcudnn7_*cuda10.2*.deb ] || curl -LO \
  'https://developer.nvidia.com/compute/machine-learning/cudnn/secure/7.6.5.32/Production/10.2_20191118/Ubuntu18_04-x64/libcudnn7_7.6.5.32-1%2Bcuda10.2_amd64.deb' \
  -H 'authority: developer.nvidia.com' -H 'upgrade-insecure-requests: 1' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36' -H 'sec-fetch-dest: document' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' -H 'sec-fetch-site: same-origin' -H 'sec-fetch-mode: navigate' -H 'sec-fetch-user: ?1' -H 'referer: https://developer.nvidia.com/rdp/cudnn-download' -H 'accept-language: en-US,en;q=0.9' \
  -H "cookie: ${cookie}" \
  --compressed
[ -f libcudnn7-dev_*cuda10.2*.deb ] || curl -LO \
  'https://developer.nvidia.com/compute/machine-learning/cudnn/secure/7.6.5.32/Production/10.2_20191118/Ubuntu18_04-x64/libcudnn7-dev_7.6.5.32-1%2Bcuda10.2_amd64.deb' \
  -H 'authority: developer.nvidia.com' -H 'upgrade-insecure-requests: 1' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36' -H 'sec-fetch-dest: document' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' -H 'sec-fetch-site: same-origin' -H 'sec-fetch-mode: navigate' -H 'sec-fetch-user: ?1' -H 'referer: https://developer.nvidia.com/rdp/cudnn-download' -H 'accept-language: en-US,en;q=0.9' \
  -H "cookie: ${cookie}" \
  --compressed

# TODO : check if already installed before trying to install
sudo dpkg -i libcudnn7_*cuda10.2*.deb libcudnn7-dev_*cuda10.2*.deb

if [ $cuda_installed_now -eq 1 ]; then
  nvidia-smi && sudo reboot
fi
