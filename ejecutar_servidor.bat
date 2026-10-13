@echo off
echo Iniciando Servidor LipeRMI en puerto 9007...
java -cp "servidor\build\classes;servidor\lib\lipermi-1.0.1.jar;servidor\lib\EjemploLipeRmiLibImc.jar" johnarrieta.seminario.imc.rmi.Principal
pause
