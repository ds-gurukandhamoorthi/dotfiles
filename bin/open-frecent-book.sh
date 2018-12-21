#!/bin/bash
FRECENT_BOOKS=$(fasd -flR pdf)
# Minimum number of pages to be considered as a book
MIN_PAGES_OF_BOOK=2

echo "$FRECENT_BOOKS" | while read book; do
    echo "$book"
    nb_pages=$(pdfinfo "$book" | grep Pages | cut -d: -f2 | tr -d ' ')
    if (( nb_pages >= MIN_PAGES_OF_BOOK )); then
        zathura "$book"
        break
    fi
    #if none of the pdfs contain more than MIN_PAGES_OF_BOOK then nothing shall be opened
done
#TODO: have a skip parameter(NB_SKIP). skip that number of books... NB_SKIP=1 = second most frecent
