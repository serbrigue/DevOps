#!/bin/bash
# scripts/monitor_app.sh

CONTAINER_NAME="mi-webapp"

# Verificamos si el contenedor está corriendo
if [ "$(docker inspect -f '{{.State.Running}}' $CONTAINER_NAME)" != "true" ]; then
    echo "$(date): El contenedor $CONTAINER_NAME se ha detenido. Reiniciando..." >> /var/log/app_monitor.log
    docker start $CONTAINER_NAME
else
    # Verificación de salud interna (Healthcheck HTTP)
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3000/health)
    
    if [ "$HTTP_CODE" -ne 200 ]; then
         echo "$(date): La app no responde (Código $HTTP_CODE). Reiniciando contenedor..." >> /var/log/app_monitor.log
         docker restart $CONTAINER_NAME
    fi
fi