#!/bin/bash -e
script_dir=$(readlink -f $(dirname $0))
# script_dir = /path/to/voicefilter/vm_utils/ --> base_dir=../..
base_dir=$(realpath "${script_dir}/../..")
cd "${base_dir}"

# TODO : setup mount
# sudo mkdir -p /mnt/disks/voicefilter-1
# sudo mount /dev/sdb /mnt/disks/voicefilter-1/

sudo apt update && sudo apt install -y libsndfile-dev

nvidia-smi || ./install_gpu_drivers.sh
