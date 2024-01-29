#!/bin/bash

function synthesize_text {
    echo "$1" | ./piper --model en_US-libritts-high.onnx --output-raw | aplay -r 22050 -f S16_LE -t raw -
}

# Check if an argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <text or text_file>"
    exit 1
fi

if [ -f "$1" ]; then
    # Argument is a file, read the content
    text_to_synthesize=$(cat "$1")
else
    # Argument is direct text
    text_to_synthesize="$1"
fi

synthesize_text "$text_to_synthesize"


