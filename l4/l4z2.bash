#!/bin/bash

# Sprawdzenie, czy podano wystarczającą liczbę argumentów
if [ "$#" -ne 3 ]; then
  echo "Użycie: $0 <SVN_URL> <REVISION_START> <REVISION_END>"
  exit 1
fi

SVN_URL="$1"
REVISION_START="$2"
REVISION_END="$3"

# Pobranie ostatniego katalogu z URL
REPO_NAME=$(basename "$SVN_URL")
TEMP_DIR="svn_temp"
GIT_REPO="$REPO_NAME"

# Sprawdzenie, czy r1 <= r2
if [ "$REVISION_START" -gt "$REVISION_END" ]; then
  echo "REVISION_START musi być mniejsze lub równe REVISION_END"
  exit 1
fi

# Stworzenie tymczasowego katalogu
if [ -d "$TEMP_DIR" ]; then
  rm -rf "$TEMP_DIR"
fi
mkdir "$TEMP_DIR"

# Stworzenie repozytorium Git
if [ -d "$GIT_REPO" ]; then
  rm -rf "$GIT_REPO"
fi
mkdir "$GIT_REPO"
cd "$GIT_REPO" || exit
git init
cd ..

# Pętla po rewizjach
for REV in $(seq "$REVISION_START" "$REVISION_END"); do
  echo "Przetwarzanie rewizji $REV..."

  # Pobranie stanu SVN dla danej rewizji
  svn export --force "$SVN_URL@$REV" "$TEMP_DIR"

  # Usuwanie plików i katalogów, które nie podlegają wersjonowaniu
  find "$TEMP_DIR" -name '.git' -exec rm -rf {} +
  find "$TEMP_DIR" -name '.svn' -exec rm -rf {} +
  find "$TEMP_DIR" -name '.gitignore' -exec rm -rf {} +

  # Pobranie wiadomości z SVN
  LOG_MESSAGE=$(svn log -r "$REV" "$SVN_URL" | sed -n '4p')

  # Skopiowanie stanu do repozytorium Git
  cd "$GIT_REPO" || exit
  rm -rf *
  cp -r "../$TEMP_DIR/"* .
  git add .
  git commit -m "SVN Revision $REV: $LOG_MESSAGE"
  cd ..
done

# Sprzątanie
rm -rf "$TEMP_DIR"

echo "Repozytorium Git zostało utworzone w katalogu: $GIT_REPO"
