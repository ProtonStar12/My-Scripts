#!/bin/bash

function synthesize_text {
    echo "$1" | ./piper --model en_US-libritts-high.onnx --output-raw | aplay -r 22050 -f S16_LE -t raw -
}

# Check if an argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <text_to_synthesize>"
    exit 1
fi

# Use the provided argument as the text to synthesize
text_to_synthesize="$1"
synthesize_text "$text_to_synthesize"


