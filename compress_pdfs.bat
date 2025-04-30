@echo off
setlocal

:: Set the path to Ghostscript
set "GS=C:\Program Files (x86)\gs\gs10.05.1\bin\gswin32c.exe"

:: Directory containing PDFs
set "SOURCE_FOLDER=D:\dev\compress-pdf"
:: Directory to save compressed PDFs
set "DEST_BASE=%SOURCE_FOLDER%\compressed"

:: Create subfolders for each compression level
for %%S in (screen ebook printer prepress) do (
    if not exist "%DEST_BASE%\%%S" (
        mkdir "%DEST_BASE%\%%S"
    )
)

:: Process each PDF
for %%F in ("%SOURCE_FOLDER%\*.pdf") do (
    echo Processing: %%~nxF

    "%GS%" -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile="%DEST_BASE%\screen\%%~nF_screen.pdf" "%%F"
    "%GS%" -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile="%DEST_BASE%\ebook\%%~nF_ebook.pdf" "%%F"
    "%GS%" -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH -sOutputFile="%DEST_BASE%\printer\%%~nF_printer.pdf" "%%F"
    "%GS%" -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress -dNOPAUSE -dQUIET -dBATCH -sOutputFile="%DEST_BASE%\prepress\%%~nF_prepress.pdf" "%%F"
)

echo Compression complete!
pause