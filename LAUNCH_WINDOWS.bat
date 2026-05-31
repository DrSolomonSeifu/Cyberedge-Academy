@echo off
title CyberEdge Academy Launcher
color 1F
echo.
echo  ============================================
echo   CyberEdge Academy - Cybersecurity Training
echo   by Dr. Solomon Seifu
echo  ============================================
echo.

SET FILE=%~dp0CyberEdge_Master_Portal.html

:: Try Chrome first
SET CHROME="%ProgramFiles%\Google\Chrome\Application\chrome.exe"
SET CHROME86="%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
SET EDGE="%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"
SET EDGE64="%ProgramFiles%\Microsoft\Edge\Application\msedge.exe"

IF EXIST %CHROME% (
    echo  Launching with Google Chrome...
    start "" %CHROME% --start-maximized "%FILE%"
    goto :done
)
IF EXIST %CHROME86% (
    echo  Launching with Google Chrome...
    start "" %CHROME86% --start-maximized "%FILE%"
    goto :done
)
IF EXIST %EDGE64% (
    echo  Launching with Microsoft Edge...
    start "" %EDGE64% --start-maximized "%FILE%"
    goto :done
)
IF EXIST %EDGE% (
    echo  Launching with Microsoft Edge...
    start "" %EDGE% --start-maximized "%FILE%"
    goto :done
)

:: Fallback to default browser
echo  Launching with default browser...
start "" "%FILE%"

:done
echo  Portal launched successfully!
echo.
echo  TIP: To install as a desktop app, click the
echo  install icon in your browser's address bar.
echo.
timeout /t 3 >nul
