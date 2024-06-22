#!/bin/bash

#while read file; do echo $(git log --pretty=format:%ad -n 1 --date=raw -- $file) $file; done < <(git ls-tree -r --name-only HEAD) | sort -k1,1n

git ls-tree -r --name-only HEAD -z | TZ=UTC xargs -0n1 -I_ git --no-pager log -1 --date=iso-local --format="%ad _" -- _
