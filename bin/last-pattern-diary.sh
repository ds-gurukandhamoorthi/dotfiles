PAT=$(cat -)
ls -tr 201* | xargs grep "$PAT" | tail -1 | cut -d':' -f2-

