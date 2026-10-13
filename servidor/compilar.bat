@echo off
if not exist build\classes mkdir build\classes
javac -encoding UTF-8 -cp ".;lib\lipermi-1.0.1.jar;lib\EjemploLipeRmiLibImc.jar" -d build\classes src\johnarrieta\seminario\imc\rmi\*.java src\johnarrieta\seminario\imc\rmi\net\*.java
echo Servidor compilado con exito.
