@echo off
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

if not exist build\classes mkdir build\classes
if not exist dist mkdir dist
javac -encoding UTF-8 -d build\classes src\johnarrieta\seminario\imc\rmi\lib\*.java
"%JAR_CMD%" -cf dist\EjemploLipeRmiLibImc.jar -C build\classes .
echo Libreria empaquetada en dist\EjemploLipeRmiLibImc.jar
