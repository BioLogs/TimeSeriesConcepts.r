"""
    Small script to extract the list of packages contained in
    a renv.lock lockfile. 

    I did this because I wanted to upgrade from R 3.~
    to R 4.0.2 but renv could not handle this by itself.

    This might change in the future.

    Running this script will extract all dependencies by name and
    save them to a file `renv-packages.json`. 
    One can then exec:

        $ cat renv-packages.json
        
        # These two are optional and might not follow best practices :
          $ mv renv legacy-renv-backup
          $ mv renv.lock legacy-renv.lock.bck
        
        $ R                             # preferably RStudio
          > renv::init()
          > pkgs <- c(`paste the contents of renv-packages.json here`)
          > install.packages(pkgs)
          > renv::snapshot()            # voilà            
    
    You can (I advise from my limited understanding of R's internal
    black magic workings) save your previously created renv library as 
    detailed above.

    This workflow was good enough for my needs as of
    Friday 7, August 2020
    
"""

import json
import os


def main():

    lockfile = "renv.lock"
    outfile = "renv-packages.json"

    if lockfile in os.listdir("."):
        with open(lockfile, "r") as f:
            x = json.load(f)

        with open(outfile, "w") as f:
            json.dump(list(x["Packages"].keys()), f)
    else:
        print(f"Lockfile `{lockfile}` not found in `{os.path.abspath('.')}`")
        print("Exiting...\n\n")


##

if __name__ == "__main__":
    main()
