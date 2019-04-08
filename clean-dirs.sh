#!/bin/bash
echo Retrieving directories matching pattern of album directory
echo ...

echo Translating .JPG and the like to lowercase \(i.e. .jpg\)
# rename 's/\.[^.]$/.\L$1/gi' *
find . -maxdepth 1 -type d -print0 \
  | xargs -0 -I {} rename 's/\.[^.]$/.\L$1/g' "{}"

echo Removing punctuation \(\' , \! \?\)
# rename "s/[',!?]//g" *
find . -maxdepth 1 -type d -print0 \
  | xargs -0 -I {} rename "s/[',!?]//g" "{}"

echo Substituting \& with and
# rename 's/\&/and/g' *
find . -maxdepth 1 -type d -print0 \
  | xargs -0 -I {} rename 's/\&/and/g' "{}"

echo Substituting open and closed parens with \( --\> __ and \) removed
# rename 's/\(/__/g' *
find . -maxdepth 1 -type d -print0 \
  | xargs -0 -I {} rename 's/\(/__/g' "{}"
# rename 's/\)//g' *
find . -maxdepth 1 -type d -print0 \
  | xargs -0 -I {} rename 's/\)//g' "{}"

echo Substituting blank spaces with underscores
# rename 's/\s/_/g' *
find . -maxdepth 1 -type d -print0 \
  | xargs -0 -I {} rename 's/\s/_/g' "{}"
echo Substituting left over underscores within _-_ or _--_
find . -maxdepth 1 -type d -print0 \
  | xargs -0 -I {} rename 's/_\-_/\-/g' "{}"
find . -maxdepth 1 -type d -print0 \
  | xargs -0 -I {} rename 's/_\-\-_/\-\-/g' "{}"
