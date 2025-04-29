#!/bin/bash
set -e

BASE_DIR="$HOME/files"

echo "Удаление старой директории $BASE_DIR..."
rm -rf "$BASE_DIR"

echo "Создание новой структуры в $BASE_DIR..."
mkdir -p "$BASE_DIR/dir1/subdir"
mkdir -p "$BASE_DIR/.hidden/.subhidden"

for i in {1..5}; do
  tr -dc 'a-zA-Z\n ' </dev/urandom | head -c 1024 > "$BASE_DIR/file$i.txt"
done

for i in {1..3}; do
  tr -dc 'a-zA-Z\n ' </dev/urandom | head -c 1024 > "$BASE_DIR/.hidden/.file$i.log"
done

for i in {1..3}; do
  tr -dc 'a-zA-Z\n ' </dev/urandom | head -c 1024 > "$BASE_DIR/dir1/subdir/file$i.txt"
done

echo "Структура создана в $BASE_DIR"
