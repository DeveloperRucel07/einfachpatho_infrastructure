#!/bin/bash
BACKUP_DIR="/opt/einfachpatho/backups"
mkdir -p "$BACKUP_DIR"

FILENAME="$BACKUP_DIR/einfachpatho_$(date +%Y%m%d_%H%M%S).sql.gz"
docker exec einfachpatho_postgres pg_dumpall -U einfachpatho | gzip > "$FILENAME"
find "$BACKUP_DIR" -type f -mtime +30 -delete

echo "[SUCCESS] Backup saved under: $FILENAME"