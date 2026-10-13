@echo off
echo ==========================================
echo   COMPILANDO LIBRERIA, SERVIDOR Y CLIENTE
echo ==========================================

set "JAR_CMD=jar"
where jar >nul 2>&1
if errorlevel 1 (
    if defined JAVA_HOME (
        set "JAR_CMD=%JAVA_HOME%\bin\jar.exe"
    ) else (
        if exist "C:\Program Files\Java\jdk-21\bin\jar.exe" (
            set "JAR_CMD=C:\Program Files\Java\jdk-21\bin\jar.exe"
        )
    )
)

echo [1/3] Compilando Libreria EjemploLipeRmiLibImc...
if not exist libreria\build\classes mkdir libreria\build\classes
if not exist libreria\dist mkdir libreria\dist
javac -encoding UTF-8 -d libreria\build\classes libreria\src\johnarrieta\seminario\imc\rmi\lib\*.java
"%JAR_CMD%" -cf libreria\dist\EjemploLipeRmiLibImc.jar -C libreria\build\classes .

copy /Y libreria\dist\EjemploLipeRmiLibImc.jar lib\ >nul
copy /Y libreria\dist\EjemploLipeRmiLibImc.jar servidor\lib\ >nul
copy /Y libreria\dist\EjemploLipeRmiLibImc.jar cliente\lib\ >nul

echo [2/3] Compilando Servidor...
if not exist servidor\build\classes mkdir servidor\build\classes
javac -encoding UTF-8 -cp ".;lib\lipermi-1.0.1.jar;lib\EjemploLipeRmiLibImc.jar" -d servidor\build\classes servidor\src\johnarrieta\seminario\imc\rmi\*.java servidor\src\johnarrieta\seminario\imc\rmi\net\*.java

echo [3/3] Compilando Cliente...
if not exist cliente\build\classes mkdir cliente\build\classes
javac -encoding UTF-8 -cp ".;lib\lipermi-1.0.1.jar;lib\EjemploLipeRmiLibImc.jar" -d cliente\build\classes cliente\src\johnarrieta\seminario\imc\rmi\*.java cliente\src\johnarrieta\seminario\imc\rmi\vistas\*.java

echo ==========================================
echo   COMPILACION COMPLETADA CON EXITO
echo ==========================================
