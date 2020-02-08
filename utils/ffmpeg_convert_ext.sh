# thanks to https://unix.stackexchange.com/questions/428018/how-to-convert-all-wav-files-in-subdirectories-to-flac
# and to https://unix.stackexchange.com/questions/291108/parallel-processing-using-xargs
source_ext="${1:-wav}"
target_ext="${2:-flac}"
shift 2

find -type f -iname "*.${source_ext}" -print0 | xargs -0 -n1 -P$(nproc) -I '{}'  sh -c \
    'ffmpeg -loglevel error -i "${0}" "${0%.*}.'${target_ext}'"' {} \;
