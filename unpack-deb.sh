#!/bin/sh

deb=$1

usage()
{

	echo "Usage:"
	echo "\t $0 debfile"
}

check()
{
if [ -z $deb ]; then

	echo "no enough input"
	usage
	exit

elif [ ${deb##*.} != "deb" ];then

	echo "not .deb file"
	usage
	exit

fi
}

run()
{

	name="$(basename $deb)"
	dir="${name%.*}"

	mkdir -p "$dir" "$dir/DEBIAN"
	echo "extract $deb to $dir"
	dpkg-deb -x $deb  "$dir"
	echo "extract debian control to $dir/DEBIAN"
	dpkg-deb -e $deb "$dir/DEBIAN"

}

check
run
