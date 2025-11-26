#!/bin/bash

echo -e "${Blue}Shutting service down${Color_Off}"
docker compose down

echo -e "${Blue}Pulling new images${Color_Off}"
docker compose pull

echo -e "${Blue}Running service${Color_Off}"
docker compose up -d

echo -e "${Blue}Showing Logs${Color_Off}"
docker compose logs -tf
