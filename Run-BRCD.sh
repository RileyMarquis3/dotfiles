# Run-BRCD.sh - runs all files in .bashrc.d
# Taken From: https://stackoverflow.com/questions/41079143/run-all-shell-scripts-in-folder

##### Source Cecho #####
echo "Enabling Cecho..."
source NewCecho.bfunc
cecho green "Cecho Loaded."

BRCD_Folder='.bashrc.d'

function Enter_BRCD {
  cecho "Entering $BRCD_Folder..."
  cd $BRCD_Folder
  }

function Exit_BRCD {
  cecho "Exiting $BRCD_Folder..."
  cd -
  }

### TODO: Update code to use $BRCD_Folder  
## Base code
function RunBRCD-Base {
  for f in *.sh; do
    bash "$f" 
  done
}

## If you want to stop the whole execution when a script fails:
function RunBRCD-StopOnFail {
  for f in *.sh; do
    bash "$f" || break  # execute successfully or break
    # Or more explicitly: if this execution fails, then stop the `for`:
    # if ! bash "$f"; then break; fi
  done
}

## And to preserve the exit code of the failed script:
function RunBRCD-PreserveExitCode {
  #!/bin/bash
  set -e  # exit on error
  for f in *.sh; do
    bash "$f"
  done
}

### All features in one function
function RunBRCD-Full {
set -e  # exit on error
for f in *.sh; do
  bash "$f" || break  # execute successfully or break
  # Or more explicitly: if this execution fails, then stop the `for`:
  # if ! bash "$f"; then break; fi
done
}


### Main Program ###
cecho "Running BRCD..."
  # Enter_BRCD() # DO NOT USE until code updated!
  
RunBRCD-Base()
## Test These
# RunBRCD-StopOnFail()
# RunBRCD-PreserveExitCode()
# RunBRCD-Full
## Exit_BRCD()
cecho "BRCD Loaded."
