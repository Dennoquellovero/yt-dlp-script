$ProgressPreference = 'SilentlyContinue'


do {
 		$answerUpdateProg = Read-Host "Vuoi scaricare/aggiornare yt-dlp-script? Ciò sovrascriverà i relativi file. (S/N)"
	} while ($answerUpdateProg -notin @("s", "n", "S", "N"))

Write-Host "-----------------------------"

if ($answerUpdateProg -in("S", "s")) {

    Write-Host "-----------------------------"
	Write-Host "Aggiorno yt-dlp-script..."
	Write-Host "-----------------------------"
	Write-Host "Scarico ed installo yt-dlp-script."

	if (Test-Path -Path "Eseguimi.bat"){
		Remove-Item "Eseguimi.bat" -Force
	}

	Invoke-WebRequest -Uri "https://github.com/Dennoquellovero/yt-dlp-script/archive/refs/heads/main.zip" -OutFile "Eseguimi.bat"

	Write-Host "-----------------------------"
	Write-Host "yt-dlp-script installato."
} else {

	Write-Host "-----------------------------"
	Write-Host "yt-dlp-script non verrà  scaricato/aggiornato."
}

Write-Host "-----------------------------"

do {
 		$answerUpdateDepen = Read-Host "Vuoi scaricare/aggiornare le dipendenze? (yt-dlp.exe & ffmpeg.exe & ffprobe.exe). (S/N)"
	} while ($answerUpdateProg -notin @("s", "n", "S", "N"))

if ($answerUpdateDepen -in("s", "S")) {

    Write-Host "-----------------------------"
	Write-Host "Aggiorno le dipendenze..."
	Write-Host "-----------------------------"
	Write-Host "Scarico yt-dlp.exe"
	
	if (Test-Path -Path ".\yt-dlp.exe"){
		Remove-Item ".\yt-dlp.exe" -Force
	}

	Invoke-WebRequest -Uri "https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe" -OutFile ".\yt-dlp.exe"

	Write-Host "-----------------------------"
	Write-Host "yt-dlp.exe installato."
    Write-Host "-----------------------------"

	Write-Host "Scarico ffmpeg.exe e ffprobe.exe"
	Write-Host "-----------------------------"

	if (Test-Path -Path ".\ffmpeg.exe"){
		Remove-Item ".\ffmpeg.exe" -Force
	}

	if (Test-Path -Path ".\ffprobe.exe"){
		Remove-Item ".\ffprobe.exe" -Force
	}

	if (Test-Path -Path ".\ffmpeg-master-latest-win64-gpl-shared.zip"){
		Remove-Item ".\ffmpeg-master-latest-win64-gpl-shared.zip" -Force
	}

	Invoke-WebRequest -Uri "https://github.com/BtbN/FFmpeg-Builds/releases/latest/download/ffmpeg-master-latest-win64-gpl-shared.zip" -OutFile ".\ffmpeg-master-latest-win64-gpl-shared.zip"

	Expand-Archive -Path ".\ffmpeg-master-latest-win64-gpl-shared.zip" -DestinationPath ".\" -Force

	Move-Item -Path ".\ffmpeg-master-latest-win64-gpl-shared\bin\ffmpeg.exe" -Destination ".\ffmpeg.exe" 

	Move-Item -Path ".\ffmpeg-master-latest-win64-gpl-shared\bin\ffprobe.exe" -Destination ".\ffprobe.exe" 

    if (Test-Path -Path ".\ffmpeg-master-latest-win64-gpl-shared.zip"){
		Remove-Item ".\ffmpeg-master-latest-win64-gpl-shared.zip" -Force
	}

    if (Test-Path -Path ".\ffmpeg-master-latest-win64-gpl-shared"){
		Remove-Item ".\ffmpeg-master-latest-win64-gpl-shared" -Force -Recurse
	}


    Write-Host "ffmpeg.exe e ffprobe.exe installati"
	Write-Host "-----------------------------"

} else {

	Write-Host "-----------------------------"
	Write-Host "Le dipendenze non verranno scaricate/aggiornate."
	Write-Host "-----------------------------"
}

Write-Host "Finito."

Read-Host "Premi Invio per uscire."

