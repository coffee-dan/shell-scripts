# shell-scripts
Assorted shell scripts for producivity and organization

## clean-filenames.sh
### Author
coffee-dan
### Intent
To transform by way of substituting, translating and other wise modifying filenames to make them easier to work with and universally system compliant.
#### Exact operations
* Translate uppercase file extensions to lowercase
* Remove potentially troublesome punctuation symbols, unless they are handled later
* Substitute "&" with "and"
* Substitute blank spaces with underscores
* Remove left over underscores caused by " - "
### Assumptions
* The user desires for these changes to completed on all files and directories in the current working directory non recursively
* The user has the command ```rename``` installed
* The user is running the script in a debian-based system
