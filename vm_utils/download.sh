#!/bin/bash
script_dir="$(readlink -f $(dirname $0))"
. "${script_dir}/../config/secrets.env"
BASE_DIR=downloaded

aria2c \
    --max-connection-per-server=5 \
    --max-concurrent-downloads=5 \
    --auto-file-renaming=false \
    --input-file=- <<URLS
https://drive.google.com/u/0/uc?id=1YFmhmUok-W76JkrfA0fzQt3c-ZsfiwfL&export=download
 --out embedder.pt
 --dir=${BASE_DIR}/models
http://www.openslr.org/resources/12/train-clean-100.tar.gz
 --dir=${BASE_DIR}/librispeech
http://www.openslr.org/resources/12/train-clean-360.tar.gz
 --dir=${BASE_DIR}/librispeech
http://www.openslr.org/resources/12/dev-clean.tar.gz
 --dir=${BASE_DIR}/librispeech
http://${VOXCELEB_USER}:${VOXCELEB_PASS}@www.robots.ox.ac.uk/~vgg/data/voxceleb/data/vox1_dev_txt.zip
 --dir=${BASE_DIR}/voxceleb1
http://${VOXCELEB_USER}:${VOXCELEB_PASS}@www.robots.ox.ac.uk/~vgg/data/voxceleb/data/vox1_test_txt.zip
 --dir=${BASE_DIR}/voxceleb1
http://${VOXCELEB_USER}:${VOXCELEB_PASS}@www.robots.ox.ac.uk/~vgg/data/voxceleb/meta/vox1_meta.csv
 --dir=${BASE_DIR}/voxceleb1
http://${VOXCELEB_USER}:${VOXCELEB_PASS}@www.robots.ox.ac.uk/~vgg/data/voxceleb/meta/veri_test.txt
 --dir=${BASE_DIR}/voxceleb1
http://${VOXCELEB_USER}:${VOXCELEB_PASS}@www.robots.ox.ac.uk/~vgg/data/voxceleb/meta/iden_split.txt
 --dir=${BASE_DIR}/voxceleb1
http://${VOXCELEB_USER}:${VOXCELEB_PASS}@www.robots.ox.ac.uk/~vgg/data/voxceleb/vox1a/vox1_test_wav.zip
 --dir=${BASE_DIR}/voxceleb1
http://${VOXCELEB_USER}:${VOXCELEB_PASS}@www.robots.ox.ac.uk/~vgg/data/voxceleb/vox1a/vox1_dev_wav_partad
 --dir=${BASE_DIR}/voxceleb1
http://${VOXCELEB_USER}:${VOXCELEB_PASS}@www.robots.ox.ac.uk/~vgg/data/voxceleb/vox1a/vox1_dev_wav_partac
 --dir=${BASE_DIR}/voxceleb1
http://${VOXCELEB_USER}:${VOXCELEB_PASS}@www.robots.ox.ac.uk/~vgg/data/voxceleb/vox1a/vox1_dev_wav_partab
 --dir=${BASE_DIR}/voxceleb1
http://${VOXCELEB_USER}:${VOXCELEB_PASS}@www.robots.ox.ac.uk/~vgg/data/voxceleb/vox1a/vox1_dev_wav_partaa
 --dir=${BASE_DIR}/voxceleb1
http://${VOXCELEB_USER}:${VOXCELEB_PASS}@www.robots.ox.ac.uk/~vgg/data/voxceleb/vox1a/vox2_dev_aacaa
 --dir=${BASE_DIR}/voxceleb2
http://${VOXCELEB_USER}:${VOXCELEB_PASS}@www.robots.ox.ac.uk/~vgg/data/voxceleb/vox1a/vox2_dev_aacab
 --dir=${BASE_DIR}/voxceleb2
http://${VOXCELEB_USER}:${VOXCELEB_PASS}@www.robots.ox.ac.uk/~vgg/data/voxceleb/vox1a/vox2_dev_aacac
 --dir=${BASE_DIR}/voxceleb2
http://${VOXCELEB_USER}:${VOXCELEB_PASS}@www.robots.ox.ac.uk/~vgg/data/voxceleb/vox1a/vox2_dev_aacad
 --dir=${BASE_DIR}/voxceleb2
http://${VOXCELEB_USER}:${VOXCELEB_PASS}@www.robots.ox.ac.uk/~vgg/data/voxceleb/vox1a/vox2_dev_aacae
 --dir=${BASE_DIR}/voxceleb2
http://${VOXCELEB_USER}:${VOXCELEB_PASS}@www.robots.ox.ac.uk/~vgg/data/voxceleb/vox1a/vox2_dev_aacaf
 --dir=${BASE_DIR}/voxceleb2
http://${VOXCELEB_USER}:${VOXCELEB_PASS}@www.robots.ox.ac.uk/~vgg/data/voxceleb/vox1a/vox2_dev_aacag
 --dir=${BASE_DIR}/voxceleb2
http://${VOXCELEB_USER}:${VOXCELEB_PASS}@www.robots.ox.ac.uk/~vgg/data/voxceleb/vox1a/vox2_dev_aacah
 --dir=${BASE_DIR}/voxceleb2
http://${VOXCELEB_USER}:${VOXCELEB_PASS}@www.robots.ox.ac.uk/~vgg/data/voxceleb/vox1a/vox2_test_aac.zip
 --dir=${BASE_DIR}/voxceleb2
http://${VOXCELEB_USER}:${VOXCELEB_PASS}@www.robots.ox.ac.uk/~vgg/data/voxceleb/meta/veri_test.txt
 --dir=${BASE_DIR}/voxceleb2
http://${VOXCELEB_USER}:${VOXCELEB_PASS}@www.robots.ox.ac.uk/~vgg/data/voxceleb/data3/veri_test2.txt
 --dir=${BASE_DIR}/voxceleb2
http://${VOXCELEB_USER}:${VOXCELEB_PASS}@www.robots.ox.ac.uk/~vgg/data/voxceleb/meta/list_test_hard.txt
 --dir=${BASE_DIR}/voxceleb2
http://${VOXCELEB_USER}:${VOXCELEB_PASS}@www.robots.ox.ac.uk/~vgg/data/voxceleb/data3/list_test_hard2.txt
 --dir=${BASE_DIR}/voxceleb2
http://${VOXCELEB_USER}:${VOXCELEB_PASS}@www.robots.ox.ac.uk/~vgg/data/voxceleb/meta/list_test_all.txt
 --dir=${BASE_DIR}/voxceleb2
http://${VOXCELEB_USER}:${VOXCELEB_PASS}@www.robots.ox.ac.uk/~vgg/data/voxceleb/data3/list_test_all2.txt
 --dir=${BASE_DIR}/voxceleb2
http://${VOXCELEB_USER}:${VOXCELEB_PASS}@www.robots.ox.ac.uk/~vgg/data/voxceleb/data/vox2_dev_txt.zip
 --dir=${BASE_DIR}/voxceleb2
http://${VOXCELEB_USER}:${VOXCELEB_PASS}@www.robots.ox.ac.uk/~vgg/data/voxceleb/data/vox2_test_txt.zip
 --dir=${BASE_DIR}/voxceleb2
URLS

