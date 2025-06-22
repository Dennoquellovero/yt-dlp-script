@echo off
setlocal enabledelayedexpansion

echo Aggiorno yt-dlp.exe
echo -------------------------- 
yt-dlp -U

echo --------------------------
set /p answer="Vuoi scaricare anche il video? (S/N): "
echo --------------------------

set "answer=%answer:a=A%"
set "answer=%answer:s=S%"
set "answer=%answer:n=N%"

if "%answer%"=="S" (
	set "command=yt-dlp -f bestvideo+bestaudio/best --cookies cookies.txt --embed-metadata --embed-thumbnail -o ".\Video\%%(title^)s.%%(ext^)s""

	echo --------------------------
	echo Sia il video che l'audio verranno scaricati
	echo --------------------------

) else (

	if "%answer%"=="N" (

		set "command=yt-dlp -f bestaudio --extract-audio --embed-metadata --embed-thumbnail --convert-thumbnails jpg --ppa "ffmpeg: -c:v mjpeg -vf crop=\"'if(gt(ih,iw),iw,ih)':'if(gt(iw,ih),ih,iw)'\"" -o ".\Audio\%%(title^)s.%%(ext^)s" --audio-format"

		echo Solo l'audio verra' scaricato.
		echo --------------------------
		
		set /p format="Scegli un formato audio (ES: flac, m4a, ogg): "
		echo --------------------------

		set "command=!command! !format!"

	) else (
		echo --------------------------
		echo Rispondi Si' oppure no.
		echo --------------------------
		exit /b
	)
)

set /p videolink="Inserisci il collegamento al video YouTube: "
echo --------------------------

set "command=%command% "!videolink!"

start %command%

endlocal