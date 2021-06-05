#!/bin/bash

cleanup() {
    # kill mkdocs serve
    kill $(jobs -p)

    # sync docs dir with main repo
    cd ..
    rsync --dry-run -azv --exclude 'mkdocs-serve' --exclude '.*' mkdocs-serve/docs/ ./
}

# run cleanup on exit
trap cleanup EXIT

# enable globing
shopt -s nullglob dotglob extglob

# debugging
#set -x

# setup dir structure
mkdir -p mkdocs-serve/docs
cp -r mkdocs/* mkdocs-serve/
cp -r !(mkdocs|mkdocs-serve|.git|.|..) mkdocs-serve/docs/

# run mkdocs
cd mkdocs-serve
echo -e "\e[41m\e[30mNOTE: Edit markdown files in docs/ to take advantage of live-reload, they will be copied over when you stop the dev server.\e[0m"
sleep 3
mkdocs serve &
sleep 1

# open dev server in default browser
xdg-open "http://127.0.0.1:8000"

wait

