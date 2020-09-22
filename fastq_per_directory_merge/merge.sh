# Uncomment following option to see every command before it's run -- useful for
# debugging purposes, otherwise good to keep commented out to avoid too much
# output.
#
# set -o xtrace

# Some helpful options to make bash script more usable (e.g. stop script in case
# of error).
set -o errexit
set -o pipefail
set -o nounset

# Asterisk wildcard expands to get all files and folders in the working
# directory, then starts a for-loop to go through each one.
for dir in *
do
  # Check it's a directory (vs. a file), skip otherwise.
  test -d "$dir" || continue

  # Run cat command on just *.fastq files and merge them into a single file.
  # Merged file is called <directory_name>_merged.fastq and will be put in the
  # root directory where command is run.
  #
  # Note: this relies on alphabetical ordering of filenames -- merged file will
  # be concatenated in alphabetical order.
  cat $(realpath "$dir")/*.fastq > "$dir"_merged.fastq
done
