# Run-bashrcd.sh - runs all files in .bashrc.d
# Taken From: https://stackoverflow.com/questions/41079143/run-all-shell-scripts-in-folder

## Base code
for f in *.sh; do
  bash "$f" 
done

## If you want to stop the whole execution when a script fails:

for f in *.sh; do
  bash "$f" || break  # execute successfully or break
  # Or more explicitly: if this execution fails, then stop the `for`:
  # if ! bash "$f"; then break; fi
done

## And to preserve the exit code of the failed script:

#!/bin/bash
set -e  # exit on error
for f in *.sh; do
  bash "$f"
done

