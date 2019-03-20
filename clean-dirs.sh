#!/bin/bash
echo Retrieving directories matching pattern of album directory
echo ...
echo Translating .JPG and the like to lowercase \(i.e. .jpg\)
rename 's/\.[^.]$/.\L$1/gi' *
echo Removing punctuation \(\' , \!\)
rename "s/[',!]//g" *
echo Substituting \& with and
rename 's/\&/and/g' *
echo Substituting open and closed parens with \( --\> __ and \) removed
rename 's/\(/__/g' *
rename 's/\)//g' *
echo Substituting blank spaces with underscores
rename 's/\s/_/g' *
echo Substituting left over underscores within _-_ or _--_
rename 's/_\-_/\-/g' *
rename 's/_\-\-_/\-\-/g' *
