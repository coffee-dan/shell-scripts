#!/bin/bash
echo Remove single quotes and commas
rename "s/[',]//g" *
echo Substituting & with and
rename 's/\&/and/g' *
echo Substituting blank spaces with underscores
rename 's/\s/_/g' *
echo Substituting left over underscores within _-_ or _--_
rename 's/_\-_/\-/g' *
rename 's/_\-\-_/\-\-/g' *