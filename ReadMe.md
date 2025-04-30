✅ Prerequisites:

You need to install **Ghostscript** first. Download from:

[https://www.ghostscript.com/download/gsdnld.html](https://www.ghostscript.com/download/gsdnld.html)

Once installed, note the path (e.g., `C:\Program Files (x86)\gs\gs10.05.1\bin\gswin32c.exe`)

---

### 🛠 Sample Batch File (`compress_pdfs.bat`):

```bat
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
```

---

### 📌 PDF Compression Levels (choose one for `-dPDFSETTINGS`):

* `/screen` – Lowest quality, smallest file size
* `/ebook` – Medium quality (good for e-readers)
* `/printer` – High quality
* `/prepress` – High quality for printing (big files)

---

### ✅ How to Use:

1. Install Ghostscript.
2. Replace the paths in the script (`GS`, `SOURCE_FOLDER`) with actual locations.
3. Save the code as `compress_pdfs.bat`.
4. Double-click it or run it via Command Prompt.

---
