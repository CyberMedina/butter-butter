@echo off
setlocal EnableDelayedExpansion

echo ===================================================
echo   Butterscotch 3DS - Game Cache Preprocessor (PC)
echo ===================================================
echo.

if "%~1"=="" (
    echo Uso:
    echo   prepare_game.bat ^<ruta_al_juego_o_data.win^>
    echo.
    echo Ejemplo:
    echo   prepare_game.bat "C:\Program Files (x86)\Steam\steamapps\common\Undertale"
    echo   prepare_game.bat "C:\Program Files (x86)\Steam\steamapps\common\DELTARUNE"
    echo.
    pause
    exit /b 1
)

set TARGET=%~1

if not exist "%~dp0ctr-cache-preprocess.exe" (
    echo [ERROR] No se encontro ctr-cache-preprocess.exe.
    echo Por favor asegurese de compilarlo antes.
    pause
    exit /b 1
)

echo Procesando: "%TARGET%"
echo.
"%~dp0ctr-cache-preprocess.exe" "%TARGET%"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ===================================================
    echo   [EXITO] Preprocesamiento completado.
    echo   La carpeta 'cache' ha sido creada en la carpeta
    echo   del juego. Ya puedes copiarla a tu tarjeta SD.
    echo ===================================================
) else (
    echo.
    echo [ERROR] Hubo un error durante el preprocesamiento (codigo: %ERRORLEVEL%).
)

echo.
pause
