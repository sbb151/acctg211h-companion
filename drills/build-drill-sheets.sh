#!/usr/bin/env bash
#
# build-drill-sheets.sh — render per-week mechanics drill sheets to PDF.
#
# For each drill-wkNN.qmd fragment this produces two PDFs in ./pdf/:
#   wkNN-drills.pdf      student sheet (prompts only)
#   wkNN-drills-key.pdf  instructor key (prompts + self-check answers)
#
# The fragments (drill-wkNN.qmd, key-wkNN.qmd) are the single source of
# truth: the same files are {{< include >}}-ed into the Companion chapters.
# This script wraps them in a minimal standalone document so each week can
# also be posted to Canvas as a printable PDF.
#
# Usage:
#   ./build-drill-sheets.sh            # build every week
#   ./build-drill-sheets.sh 04 09      # build only weeks 04 and 09
#
# Requires: quarto + a LaTeX engine (lualatex, bundled with Quarto's tinytex).
# Run from anywhere; the script cd's to its own directory.

set -euo pipefail
cd "$(dirname "$0")"
mkdir -p pdf

# Per-week subtitles. Add a case here when a new week's fragment is created.
# (A case statement is used instead of an associative array so the script runs
#  on the bash 3.2 that ships with macOS; zero-padded week numbers like "08"
#  would otherwise be misread as invalid octal during array indexing.)
title_for () {
  case "$1" in
    02) echo "Week 2 — Certainty and Linked Statements" ;;
    03) echo "Week 3 — Uncertainty and News" ;;
    04) echo "Week 4 — Information and Incentives" ;;
    05) echo "Week 5 — Accruals and Statement Connections" ;;
    06) echo "Week 6 — Revenue Recognition and Abnormal Returns" ;;
    07) echo "Week 7 — The Statement of Cash Flows, Receivables, and Inventory" ;;
    08) echo "Week 8 — Long-Term Assets, Depreciation, and Impairment" ;;
    09) echo "Week 9 — Bonds, Leases, and Covenant Slack" ;;
    10) echo "Week 10 — Equity, EPS, and Stock-Based Compensation" ;;
    11) echo "Week 11 — Cost Behavior and Cost-Volume-Profit Analysis" ;;
    12) echo "Week 12 — Variances, ROI, Residual Income, and EVA" ;;
    13) echo "Week 13 — Capital Budgeting: NPV, IRR, and Payback" ;;
    *)  echo "Week ${1} — Mechanics Drill Set" ;;
  esac
}

# Determine which weeks to build.
if [ "$#" -gt 0 ]; then
  WEEKS=("$@")
else
  WEEKS=()
  for f in drill-wk*.qmd; do
    wk="${f#drill-wk}"; wk="${wk%.qmd}"
    WEEKS+=("$wk")
  done
fi

render_one () {
  local wrapper="$1" outname="$2"
  quarto render "$wrapper" --to pdf >/dev/null
  mv "${wrapper%.qmd}.pdf" "pdf/${outname}"
  rm -f "$wrapper"
}

for wk in "${WEEKS[@]}"; do
  frag="drill-wk${wk}.qmd"
  key="key-wk${wk}.qmd"
  sub="$(title_for "$wk")"
  [ -f "$frag" ] || { echo "skip: $frag not found"; continue; }

  # --- student sheet (prompts only) ---
  ws="_tmp_wk${wk}_student.qmd"
  cat > "$ws" <<EOF
---
format:
  pdf:
    papersize: letter
    geometry: [top=1in, bottom=1in, left=1in, right=1in]
    fontsize: 11pt
---

# ACCTG 211H — Mechanics Drill Set {.unnumbered}

**${sub}**

{{< include ${frag} >}}
EOF
  render_one "$ws" "wk${wk}-drills.pdf"
  echo "built pdf/wk${wk}-drills.pdf"

  # --- instructor key (prompts + answers) ---
  if [ -f "$key" ]; then
    wk_key="_tmp_wk${wk}_key.qmd"
    cat > "$wk_key" <<EOF
---
format:
  pdf:
    papersize: letter
    geometry: [top=1in, bottom=1in, left=1in, right=1in]
    fontsize: 11pt
---

# ACCTG 211H — Mechanics Drill Set (Answer Key) {.unnumbered}

**${sub}**

{{< include ${frag} >}}

{{< pagebreak >}}

# Self-Check Answers

{{< include ${key} >}}
EOF
    render_one "$wk_key" "wk${wk}-drills-key.pdf"
    echo "built pdf/wk${wk}-drills-key.pdf"
  fi
done

echo "Done. PDFs in $(pwd)/pdf/"
