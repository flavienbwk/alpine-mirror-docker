#!/bin/sh

set -ex

# make sure we never run 2 rsync at the same time
lockfile="/tmp/alpine-mirror.lock"
if [ -z "$flock" ] ; then
	exec env flock=1 flock -n $lockfile "$0" "$@"
fi

alpine_version="v3.13"
src=rsync://rsync.alpinelinux.org/alpine/${alpine_version}
dest=downloads

for arch in "x86" "x86_64"
do
	for release in "main" "community" "releases"
	do
		arch_src="$src/$release/$arch"
		arch_dest="$dest/${alpine_version}/$release"
		mkdir -p "$arch_dest"
		rsync \
			--archive \
			--update \
			--info=progress2 \
			--hard-links \
			--timeout=600 \
			"$arch_src" "$arch_dest"
	done
done

