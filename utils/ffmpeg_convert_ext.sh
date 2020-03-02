# thanks to https://unix.stackexchange.com/questions/428018/how-to-convert-all-wav-files-in-subdirectories-to-flac
# and to https://unix.stackexchange.com/questions/291108/parallel-processing-using-xargs
source_ext="${1:-wav}"
target_ext="${2:-flac}"
shift 2

temp_dir=$(mktemp -d)
trap "rm -rf ${temp_dir}" EXIT

find -type f -iname "*.${source_ext}" -print0 > ${temp_dir}/filelist
< ${temp_dir}/filelist xargs -0 -n1 -P$(nproc) -I '{}'  sh -c \
    'ffmpeg -loglevel panic -n -i "${0}" "${0%.*}.'${target_ext}'"; echo .' {} \; | \
    tqdm --total=$(< ${temp_dir}/filelist tr '\0' '\n' | wc -l) > /dev/null
