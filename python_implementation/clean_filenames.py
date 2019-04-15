#!/usr/bin/python3
#gross frankenstein python x bash shit
#\todo delete this cancer from the earth
import sys
import re
import os
import copy


def processFile(file_name):
    processed_file_name = file_name
    
    #translating file exentions to lower case(.JPEG to .jpeg)
    temp = re.search(r'\..*', processed_file_name)
    if temp is not None:
        old_extension  = temp.group(0)
        new_extension = copy.copy(old_extension).lower()
        processed_file_name = re.sub(old_extension, new_extension, processed_file_name)
    #remove single quotes and commas
    processed_file_name = re.sub(r'\'|\"', '', processed_file_name)
    #substituting & with and
    processed_file_name = re.sub('&', 'and', processed_file_name)
    #substituting black space with underscore
    processed_file_name = re.sub(' ', '_', processed_file_name)
    
    #Substituting left over underscores within _-_ or _--_
    print(processed_file_name)
    return processed_file_name



#main
#change into user specified directory
def usage():
    print('usage: clean_filenames [[[directory_name] | [-help]]')

if len(sys.argv) > 1:
    if sys.argv[1] == '--help':
            usage()
            sys.exit()

    if os.chdir(sys.argv[1]) != -1:
        #list current directory before
        print(os.listdir('.'))
        for root, dirs, files in os.walk('.'):
            for name in files:
                os.system('' + 'mv ' + ' ' + '\'' + name +  '\'' +  ' ' +  '\'' + processFile(name) +  '\'' )
                # os.system('clear') 
                # os.rename(name, processFile(name))
    else:
        print('ERROR:')
    #list current directory after
    print(os.listdir('.'))
    
else:
    usage()
