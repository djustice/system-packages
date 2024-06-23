#!/bin/bash

for sp in $(ls)
do
	echo "system: processing: $sp"
	if head -n 3 $sp/PKGBUILD | grep -q "BlackArch"; then
		sed -i '1,3c\#\n# system-linux.com rebuild alpha - djustice@system-linux.com\n#\n' $sp/PKGBUILD
	fi

	sed -i 's/blackarch/system/g' $sp/PKGBUILD

	cd $sp
	makepkg -Coe
	sudo rm pkg src *.tar *.pack *.db *.bz2 *.sql *.zip *.sql *.db $sp Amass bluefog -r
	cd ..
done
