@echo off
setlocal

:: Set the path to Ghostscript
set "GS=C:\Program Files (x86)\gs\gs10.05.1\bin\gswin32c.exe"

:: Directory containing PDFs
set "SOURCE_FOLDER=D:\dev\compress-pdf"
:: Directory to save compressed PDFs
set "DEST_FOLDER=%SOURCE_FOLDER%\compressed"

:: Create output directory if it doesn't exist
if not exist "%DEST_FOLDER%" (
    mkdir "%DEST_FOLDER%"
)

:: Loop through each PDF in the source folder
for %%F in ("%SOURCE_FOLDER%\*.pdf") do (
    echo Compressing: %%~nxF
    "%GS%" -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 ^
        -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH ^
        -sOutputFile="%DEST_FOLDER%\%%~nxF" "%%F"
)

echo Done!
pause