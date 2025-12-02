#!/bin/sh
set -e

# Garante que as pastas persistentes existem dentro de /app/private
mkdir -p \
  /app/private/attachments \
  /app/private/user-avatars \
  /app/private/background-images \
  /app/private/favicons

# Se ainda não forem symlink, substitui as pastas de /app/public por links
if [ ! -L /app/public/user-avatars ]; then
  rm -rf /app/public/user-avatars
  ln -s /app/private/user-avatars /app/public/user-avatars
fi

if [ ! -L /app/public/background-images ]; then
  rm -rf /app/public/background-images
  ln -s /app/private/background-images /app/public/background-images
fi

if [ ! -L /app/public/favicons ]; then
  rm -rf /app/public/favicons
  ln -s /app/private/favicons /app/public/favicons
fi

# Manda rodar o comando original (./start.sh)
exec "$@"
