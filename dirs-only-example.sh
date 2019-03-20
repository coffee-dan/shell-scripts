#!/bin/bash
# Implementation of find + xargs + rename
# "find" searches the current working directory "." for files of -type d or 
#   directory. Then uses flag -print0 which delimits the file names found
#   with null characters instead of the default \n (newline) thus allowing
#   newlines and other types of whitespace in the filenames. The flag 
#   -maxdepth 1 is used to ensure the script is applied non recursively.
#   The script thus applies to the directory that the script is acting within
#   and all directories within the current working directory.
# "xargs" takes the result of "find", where -0 lets "xargs" know that the input
#   recieved is delimited by null character, and applies flag -I {}. The flag
#   -I replaces occurances of {} in the initial-arguements with the names read
#   from standard input.
#   "xargs" has the form "xargs [options] [command [initial-arguements]]
# "rename" is the command in "xargs". Rename uses the result of xargs to 
#   perform a dry run of substitution of all instances of "e" to "E" dictated
#   by -n and echoes to the terminal exactly what would have been executed as
#   dictated by -v.
find . -maxdepth 1 -type d -print0 | xargs -0 -I {} rename -v -n 's/e/E/g' "{}"
