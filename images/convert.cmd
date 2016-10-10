for %%F in (*.svg) do (
    inkscape -D -z --file=%%~nF.svg --export-pdf=pdfs/%%~nF.pdf --export-latex
)
popd
