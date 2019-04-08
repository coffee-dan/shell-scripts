#!/bin/bash
echo Translating .JPG and the like to lowercase \(i.e. .jpg\)
rename -v 's/\.[^.]$/.\L$1/g' *
echo Remove single quotes and commas
rename -v "s/[',!?]//g" *
echo Substituting \& with and
rename -v 's/\&/and/g' *
echo Substituting blank spaces with underscores
rename -v 's/\s/_/g' *
# Implement parens logic
echo Substituting left over underscores within _-_ or _--_
rename -v 's/_\-_/\-/g' *
rename -v 's/_\-\-_/\-\-/g' *
