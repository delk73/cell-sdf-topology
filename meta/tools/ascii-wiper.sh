#!/usr/bin/env bash
set -euo pipefail

MODE="${1:-scan}"
REPORT="meta/outputs/ascii_wiper_report.txt"
mkdir -p meta/outputs

echo "# ascii-wiper report" > "$REPORT"
echo "Mode: $MODE" >> "$REPORT"
echo "Generated: $(date)" >> "$REPORT"
echo "" >> "$REPORT"

EXIT=0

# Use -print0 to handle spaces safely
find . -type f \
  ! -path "./.git/*" \
  ! -path "./meta/outputs/*" \
  ! -path "./node_modules/*" \
  ! -name "ascii-wiper.sh" \
  ! -name "*.png" \
  ! -name "*.jpg" \
  ! -name "*.jpeg" \
  ! -name "*.gif" \
  ! -name "*.pdf" \
  ! -name "*.bak" \
  -print0 |
while IFS= read -r -d '' f; do
  if grep -P '[^\x00-\x7F]' "$f" >/dev/null; then
    echo "Non-ASCII found in: $f" >> "$REPORT"

    # Dump offending lines with hex codes
    while IFS= read -r line; do
      echo "  $line" >> "$REPORT"
      badchars=$(echo "$line" | grep -oP '[^\x00-\x7F]' | sort | uniq)
      for c in $badchars; do
        hex=$(printf "%s" "$c" | xxd -pu | tr -d '\n')
        echo "    char: $c  hex: $hex" >> "$REPORT"
      done
    done < <(grep -nP '[^\x00-\x7F]' "$f")

    EXIT=1

    if [[ "$MODE" == "wipe" ]]; then
      sed -i \
        -e 's/\xE2\x80\x9C/"/g' \
        -e 's/\xE2\x80\x9D/"/g' \
        -e "s/\xE2\x80\x99/'/g" \
        -e 's/\xE2\x80\x93/-/g' \
        -e 's/\xE2\x80\x94/-/g' \
        -e 's/\xE2\x80\xA2/-/g' \
        -e 's/\xE2\x86\x92/->/g' \
        -e 's/\xE2\x86\x94/<->/g' \
        -e 's/\xE2\x80\xA6/.../g' \
        -e 's/\xE2\x89\xAA/<</g' \
        -e 's/\xE1\xB5\xA2/i/g' \
        "$f"
      echo "  Cleaned: $f" >> "$REPORT"
    fi
  fi
done

if [[ $EXIT -eq 0 ]]; then
  echo "No non-ASCII characters found." >> "$REPORT"
fi

echo "Report written to $REPORT"
exit $EXIT
