# gendir.sh - Repository Content Extractor

`gendir.sh` is a Bash script that recursively extracts the content of all files in a repository and outputs them into a single Markdown file, with each file's content wrapped in XML tags. This tool is particularly useful for creating a comprehensive view of your entire repository's content, which can be easily parsed by Large Language Models (LLMs) or other text processing tools.

## Features

- Recursively traverses all directories in the repository
- Captures content of all files, preserving directory structure
- Wraps each file's content in XML tags with relative file path
- Escapes XML special characters to ensure valid output
- Creates a single Markdown file containing all repository contents

## Installation

1. Clone this repository or download the `gendir.sh` script.
2. Make the script executable:
   ```
   chmod +x gendir.sh
   ```
3. Optionally, move the script to a directory in your PATH for easier access:
   ```
   sudo mv gendir.sh /usr/local/bin/
   ```

## Usage

1. Navigate to the root directory of the repository you want to process:
   ```
   cd /path/to/your/repository
   ```
2. Run the script:
   ```
   gendir.sh
   ```
3. The script will create a file named `repository_contents.md` in the current directory, containing the contents of all files in the repository.

## Output Format

The generated `repository_contents.md` file will have the following structure:

```xml
<file path="relative/path/to/file1.ext">
Content of file1.ext
Can span multiple lines
</file>

<file path="relative/path/to/file2.ext">
Content of file2.ext
</file>

...
```

## Considerations

- Large Repositories: For very large repositories, the output file can become quite large. Ensure you have sufficient disk space.
- Binary Files: The script attempts to read all files. Binary files may produce unreadable output or cause issues. Consider adding filters for specific file types if needed.
- Sensitive Information: Be cautious when using this script on repositories containing sensitive information, as all file contents will be copied to the output file.
- Performance: Processing a large number of files may take some time. Be patient with larger repositories.

## Contributing

Contributions to improve `gendir.sh` are welcome! Please feel free to submit pull requests or open issues to suggest improvements or report bugs.

## License

This project is open source and available under the [MIT License](LICENSE).