#!/bin/bash
echo "Fecha y hora:$(timedatectl)"
echo "Nombre del host:$(hostname)"
echo "Usuarios conectados:$(who)"
echo "Espacio disponible:$(df -h)"
echo "Momoria disponible:$(free -h)"
echo "Contenedores docker:$(docker ps -a)"

