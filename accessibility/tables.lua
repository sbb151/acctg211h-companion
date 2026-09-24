-- Preserve native Pandoc table semantics; contain only necessary 2D scrolling.
function Table(tbl)
  if not FORMAT:match('html') then return nil end
  local label = pandoc.utils.stringify(tbl.caption.long)
  if label == '' then label = 'Scrollable data table' end
  return pandoc.Div({tbl}, pandoc.Attr('', {'a11y-table-region'}, {
    {'role', 'region'}, {'tabindex', '0'}, {'aria-label', label}
  }))
end
