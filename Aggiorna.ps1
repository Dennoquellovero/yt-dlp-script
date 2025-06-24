$ProgressPreference = 'SilentlyContinue'


do {
 		$answerUpdateProg = Read-Host "Vuoi scaricare/aggiornare yt-dlp-script? Ciò sovrascriverà i relativi file. (S/N)"
	} while ($answerUpdateProg -notin @("s", "n", "S", "N"))

if ($answerUpdateProg -in("S", "s")) {

    Write-Host "-----------------------------"
	Write-Host "Aggiorno yt-dlp-script..."
	Write-Host "-----------------------------"
	Write-Host "Scarico ed installo yt-dlp-script."

	if (Test-Path -Path "Eseguimi.bat"){
		Remove-Item "Eseguimi.bat" -Force
	}

	Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Dennoquellovero/yt-dlp-script/refs/heads/main/Eseguimi.bat" -OutFile "Eseguimi.bat"

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

	if (Test-Path -Path ".\7zr.exe"){
		Remove-Item ".\7zr.exe" -Force
	}

	if (Test-Path -Path ".\ffmpeg-master-latest-win64-gpl-shared.zip"){
		Remove-Item ".\ffmpeg-master-latest-win64-gpl-shared.zip" -Force
	}

    Invoke-WebRequest -Uri "https://www.7-zip.org/a/7zr.exe" -OutFile ".\7zr.exe"

	Invoke-WebRequest -Uri "https://www.gyan.dev/ffmpeg/builds/ffmpeg-git-essentials.7z" -OutFile ".\ffmpeg-git-essentials.7z"

	& ".\7zr.exe" x ".\ffmpeg-git-essentials.7z" -o".\ffmpeg-git-essentials" -y > $null 2>&1

	Move-Item -Path ".\ffmpeg-git-essentials\ffmpeg-*-essentials_build\bin\ffmpeg.exe" -Destination ".\ffmpeg.exe" 

	Move-Item -Path ".\ffmpeg-git-essentials\ffmpeg-*-essentials_build\bin\ffprobe.exe" -Destination ".\ffprobe.exe" 

    if (Test-Path -Path ".\ffmpeg-git-essentials.7z"){
		Remove-Item ".\ffmpeg-git-essentials.7z" -Force
	}

    if (Test-Path -Path ".\ffmpeg-git-essentials"){
		Remove-Item ".\ffmpeg-git-essentials" -Force -Recurse
	}

    if (Test-Path -Path ".\7zr.exe"){
		Remove-Item ".\7zr.exe" -Force
    }

    Write-Host "ffmpeg.exe e ffprobe.exe installati"
	Write-Host "-----------------------------"

} else {

	Write-Host "-----------------------------"
	Write-Host "Le dipendenze non verranno scaricate/aggiornate."
	Write-Host "-----------------------------"
}

Write-Host "Finito."

Read-Host "Premi Invio per uscire"

