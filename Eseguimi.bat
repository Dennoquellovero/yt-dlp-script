@echo off
setlocal enabledelayedexpansion

set /p answer="Vuoi scaricare anche il video? (S/N): "

set "answer=%answer:a=A%"
set "answer=%answer:s=S%"
set "answer=%answer:n=N%"

if "%answer%"=="S" (
	set "command=yt-dlp -f bestvideo+bestaudio/best --cookies cookies.txt --embed-metadata --embed-thumbnail -o ".\Video\%%(title^)s.%%(ext^)s""

	echo Sia il video che l'audio verranno scaricati

) else (

	if "%answer%"=="N" (

		set "command=yt-dlp -f bestaudio --extract-audio --embed-metadata --embed-thumbnail --convert-thumbnails jpg --ppa "ffmpeg: -c:v mjpeg -vf crop=\"'if(gt(ih,iw),iw,ih)':'if(gt(iw,ih),ih,iw)'\"" -o ".\Audio\%%(title^)s.%%(ext^)s" --audio-format"

		echo Solo l'audio verra' scaricato.
	
		set /p format="Scegli un formato audio (ES: flac, m4a, ogg): "
	
		set "command=!command! !format!"

	) else (
		echo Rispondi Si' oppure no.
		exit /b
	)
)

set /p videolink="Inserisci il collegamento al video YouTube: "

set "command=%command% "!videolink!"

echo !command!

start %command%

endlocal