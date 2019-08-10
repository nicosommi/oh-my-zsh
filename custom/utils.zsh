compresspdf() {
    echo 'Usage: compresspdf [input file] [output file] [screen|ebook|printer|prepress]'
    echo 'Required: brew install ghostscript'
    gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"screen"} -dCompatibilityLevel=1.4 -sOutputFile="$2" "$1"
}
