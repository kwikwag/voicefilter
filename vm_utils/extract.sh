mkdir -p LibriSpeech && cd LibriSpeech
for file in ../downloaded/librispech/*.tar.gz; do
  basename=$(basename ${file} .tar.gz)
  tar xf ${file}
  mkdir -p ${basename}-texts && mv *.TXT ${basename}-texts/
fi

