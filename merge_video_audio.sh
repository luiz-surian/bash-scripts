#!/bin/bash

# Define base path where videos are located
base_path='/file/path/'

# Define filenames
source_filename='source_filename.mp4'
audio_filename='audio_filename.avi'
output_filename='output_filename.mp4'

# Find source video and audio video files
source_video=$(find "${base_path}" -name "${source_filename}")
audio_video=$(find "${base_path}" -name "${audio_filename}")
output_video="${base_path}${output_filename}"

# Debugging: Print file paths
echo "Source Video: ${source_video}"
echo "Audio Video: ${audio_video}"
echo "Output Video: ${output_video}"

# Check if source video and audio video exist
if [[ ! -f "${source_video}" ]]; then
    echo "Source video file not found: ${source_video}"
    exit 1
fi

if [[ ! -f "${audio_video}" ]]; then
    echo "Audio video file not found: ${audio_video}"
    exit 1
fi

# Merge video and audio using ffmpeg
ffmpeg -i "${source_video}" -i "${audio_video}" -c:v copy -c:a aac -sn -map 0 -map 1:a -metadata:s:a:1 title="Português" -metadata:s:a:1 language=pt-BR -shortest "${output_video}"
