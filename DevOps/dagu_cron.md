# Dagu Cron

# Docker-Compose file
```
version: '3.8'
services:
  dagu:
    image: ghcr.io/daguflow/dagu:latest
    ports:
      - "8080:8080"
    volumes:
      - $HOME/.config/dagu:/home/dagu/.config/dagu
      - $HOME/.config/dagu/.local/share:/home/dagu/.local/share
    user: "${UID}:${GID}"
```

