# Weekly Mechanics Drill Sets

Short, single-skill mechanics drills that run alongside the conceptual spine of
ACCTG 211H. They are graded for **completion** (5% of the course grade), exist to
build the muscle memory the quizzes and final exam presume, and are the mechanical
counterpart to the pre-class reading questions. See §5 of the redesign plan
(`syllabi/acctg211h_sp2027_redesign_plan.md`) for the rationale.

## How it works

Each mechanics-bearing week (Weeks 2–13) has two source fragments:

| File | Contents |
|---|---|
| `drill-wkNN.qmd` | The drill prompts (a `## Drill Set` section). |
| `key-wkNN.qmd`   | The self-check answers, with brief worked arithmetic. |

These fragments are the **single source of truth**. They are consumed two ways:

1. **In the Companion book.** The relevant chapter `{{< include >}}`s the prompt
   fragment as a `## Drill Set` section, immediately followed by a collapsible
   callout that includes the key:

   ```markdown
   {{< include ../drills/drill-wkNN.qmd >}}

   ::: {.callout-tip collapse="true"}
   ## Drill Set — Self-Check Answers

   {{< include ../drills/key-wkNN.qmd >}}
   :::
   ```

   The answers stay hidden behind a click in the HTML book.

2. **As printable PDFs for Canvas.** `build-drill-sheets.sh` wraps each fragment
   in a minimal standalone document and renders two PDFs per week into `pdf/`:
   - `wkNN-drills.pdf` — student sheet (prompts only)
   - `wkNN-drills-key.pdf` — instructor key (prompts + answers)

## Building the PDFs

```bash
cd companion/drills
./build-drill-sheets.sh          # build every week that has a fragment
./build-drill-sheets.sh 04 09    # build only weeks 04 and 09
```

Requires `quarto` and a LaTeX engine (lualatex, bundled with Quarto's tinytex).
When you add a new week, add a one-line subtitle to the `title_for` case statement at the top of
the script.

## Authoring conventions

- **Money:** write amounts as `\$3,600` (escaped dollar sign, ordinary comma).
  Do **not** use the bare `$3{,}600` form — outside math mode it renders the
  braces literally in HTML.
- **Tone:** terse, single-skill, clean numbers. One to three minutes per drill.
  The point is reps, not depth — deeper, multi-part problems live in each
  chapter's `## Problems` section.
- **Volume is tiered** to the week's mechanical load: 3–4 reps in light weeks,
  8–10 in heavy weeks.
- **Verify every key.** Answer keys are self-check, so a wrong key is worse than
  no key. Confirm all arithmetic (amortization, EPS, NPV, depreciation, CVP,
  variances) before committing.

## Mapping of weeks to chapters

| Week | Chapter file | Mechanics |
|---|---|---|
| 2 | `arc1-information/02-certainty.qmd` | PV, economic income, linked statements |
| 3 | `arc1-information/03-uncertainty.qmd` | Expected values, states, and news |
| 4 | `arc1-information/04-information-incentives.qmd` | Frequency updating, information value, effort incentives |
| 5 | `arc1-information/05-framework.qmd` | First accruals and statement connections |
| 6  | `arc2-markets/06-efficient-markets.qmd` | Revenue recognition; abnormal returns |
| 7  | `arc2-markets/07-accruals.qmd`          | Statement of cash flows, receivables, inventory |
| 8  | `arc2-markets/08-long-term-assets.qmd`  | PP&E, depreciation, intangibles, impairment |
| 9  | `arc2-markets/09-liabilities.qmd`       | Bonds, leases, covenant slack |
| 10 | `arc2-markets/10-equity-compensation.qmd` | Equity, EPS, stock-based comp |
| 11 | `arc3-internal/11-decentralization.qmd` | Cost behavior, CVP |
| 12 | `arc3-internal/12-performance.qmd`      | Variances, ROI, residual income, EVA |
| 13 | `arc3-internal/13-capital-budgeting.qmd` | NPV, IRR, payback, profitability index |

Week 1 uses discussion and simulation; Weeks 14–15 use debates and synthesis. Weeks 2–3 drills are due before Thursday after the Tuesday worked example; Weeks 4–5 are due Sunday after both meetings. See the opening-unit README for dates.

Weeks 6–10 drills are due Sunday after both meetings, at 11:59 p.m. Eastern: February 21, February 28, March 7, March 21, and March 28, 2027. Required IDs are 1–6; 1–8; 1, 2, 5–9; 1–6, 8–9; and 1–5, 7–8, respectively. Other items retain their numbers but are optional.

Weeks 11–13 required IDs are 2–5 and 7–8; 1–2 and 5–6; and 1–5, respectively. Due Sundays April 4, April 11, and April 18, 2027, at 11:59 p.m. Eastern, after both meetings. Other IDs are optional and excluded from quizzes/final. Week 13 includes supplied PV factors; IRR and PI are optional. Public self-check keys retain every original item number.
