#!/bin/bash

output_file="repository_contents.md"

# Clear or create the output file
> "$output_file"

# Function to escape XML special characters
escape_xml() {
    sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g; s/"/\&quot;/g; s/'"'"'/\&#39;/g' <<< "$1"
}

# Function to process files recursively
process_directory() {
    local dir="$1"
    local base_dir="$2"

    for item in "$dir"/*; do
        if [[ -f "$item" ]]; then
            # Get relative path
            local rel_path="${item#$base_dir/}"
            
            # Start the XML tag for this file
            echo "<file path=\"$(escape_xml "$rel_path")\">" >> "$output_file"
            
            # Add the file contents, escaping XML special characters
            escape_xml "$(cat "$item")" >> "$output_file"
            
            # End the XML tag for this file
            echo "</file>" >> "$output_file"
            
            # Add a newline for readability
            echo >> "$output_file"
        elif [[ -d "$item" ]]; then
            # Recursively process subdirectories
            process_directory "$item" "$base_dir"
        fi
    done
}

# Start processing from the current directory
process_directory "." "$(pwd)"

echo "All file contents have been written to $output_file"