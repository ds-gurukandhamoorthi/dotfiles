#!/bin/bash
SKIP=${1:-0}
FRECENT_BOOKS=$(fasd -flR pdf)
# Minimum number of pages to be considered as a book
MIN_PAGES_OF_BOOK=2

nb_pages_pdf () {
    local book=$1
    local nb_pages=$(pdfinfo "$book" | grep Pages | cut -d: -f2 | tr -d ' ')
    echo $nb_pages
}

echo "$FRECENT_BOOKS" | while read book; do
    echo "$book"
    if (( $(nb_pages_pdf "$book") >= MIN_PAGES_OF_BOOK )); then
        if (( $SKIP == 0 )); then
            zathura "$book"
            break
        else
            ((SKIP-=1))
        fi
    fi
    #if none of the pdfs contain more than MIN_PAGES_OF_BOOK then nothing shall be opened
done
#TODO: have a skip parameter(NB_SKIP). skip that number of books... NB_SKIP=1 = second most frecent
