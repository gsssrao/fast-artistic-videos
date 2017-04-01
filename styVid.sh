set -e

# Get a carriage return into `cr`
cr=`echo $'\n.'`
cr=${cr%.}


# Check if FFMPEG is installed
FFMPEG=ffmpeg
command -v $FFMPEG >/dev/null 2>&1 || {
  echo >&2 "This script requires ffmpeg. Aborting."; exit 1;
}

if [ "$#" -le 1 ]; then
   echo "Usage: ./styVid.sh <path_to_video> <path_to_style_directory>"
   exit 1
fi

# Parse arguments
filename=$(basename "$1")
extension="${filename##*.}"
filename="${filename%.*}"
filename=${filename//[%]/x}
styledirpath=$2
 


# Create output folder
mkdir -p input/$filename

echo ""
read -p "Maximum recommended resolution with a Titan X 12GB: 960:540. \
  Please enter a resolution at which the content video should be processed, \
  in the format w:h (example 640:480), or press enter to use the original resolution $cr > " resolution


# Save frames of the video as individual image files
if [ -z $resolution ]; then
  $FFMPEG -i $1 input/${filename}/frame_%04d.ppm
  resolution=default
else
  $FFMPEG -i $1 -vf scale=$resolution input/${filename}/frame_%04d.ppm
fi

echo ""

for styleimage in "${styledirpath}"/*
do
  stylename=$(basename "${styleimage}")
  stylename="${stylename%.*}"
  stylename=${stylename//[%]/x}
  th test.lua -contentDir input/${filename} -style ${styleimage} -outputDir output/${filename}-${stylename}

  # Generate video from output images.
  $FFMPEG -i output/${filename}-${stylename}/frame_%04d_stylized_${stylename}.jpg ${filename}-stylized-${stylename}.$extension
done