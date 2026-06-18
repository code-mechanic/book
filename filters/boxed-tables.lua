local function trim(value)
  return (value:gsub("^%s+", ""):gsub("%s+$", ""))
end

local function append(items, value)
  items[#items + 1] = value
end

local function escape_latex(value)
  local replacements = {
    ["\\"] = "\\textbackslash{}",
    ["{"] = "\\{",
    ["}"] = "\\}",
    ["$"] = "\\$",
    ["&"] = "\\&",
    ["#"] = "\\#",
    ["_"] = "\\_",
    ["%"] = "\\%",
    ["~"] = "\\textasciitilde{}",
    ["^"] = "\\textasciicircum{}",
  }

  return value:gsub("[\\{}$&#_%%~^]", replacements)
end

local function escape_code(value)
  return escape_latex(value):gsub(" ", "~")
end

local function code_block_attributes(block)
  local attributes = {}

  if block.identifier ~= nil and block.identifier ~= "" then
    append(attributes, "#" .. block.identifier)
  end

  if block.classes ~= nil then
    for _, class in ipairs(block.classes) do
      append(attributes, "." .. class)
    end
  end

  if block.attributes ~= nil then
    for key, value in pairs(block.attributes) do
      append(attributes, key .. '="' .. tostring(value):gsub('"', '\\"') .. '"')
    end
  end

  if #attributes == 0 then
    return ""
  end

  return "{" .. table.concat(attributes, " ") .. "}"
end

local function fenced_code_block(block)
  local text = block.text or ""
  local fence = "~~~~"

  while text:find(fence, 1, true) ~= nil do
    fence = fence .. "~"
  end

  return fence
    .. code_block_attributes(block)
    .. "\n"
    .. text
    .. "\n"
    .. fence
    .. "\n"
end

local function render_inlines(inlines)
  if inlines == nil or #inlines == 0 then
    return ""
  end

  local rendered = {}

  for _, inline in ipairs(inlines) do
    if inline.t == "Str" then
      append(rendered, escape_latex(inline.text))
    elseif inline.t == "Space" then
      append(rendered, " ")
    elseif inline.t == "SoftBreak" or inline.t == "LineBreak" then
      append(rendered, "\\newline{}")
    elseif inline.t == "Emph" then
      append(rendered, "\\emph{" .. render_inlines(inline.content) .. "}")
    elseif inline.t == "Strong" then
      append(rendered, "\\textbf{" .. render_inlines(inline.content) .. "}")
    elseif inline.t == "Code" then
      append(rendered, "\\texttt{" .. escape_code(inline.text) .. "}")
    elseif inline.t == "Math" then
      if tostring(inline.mathtype) == "DisplayMath" then
        append(rendered, "\\[" .. inline.text .. "\\]")
      else
        append(rendered, "$" .. inline.text .. "$")
      end
    elseif inline.t == "Link" then
      append(rendered, render_inlines(inline.content))
    elseif inline.t == "Image" then
      append(rendered, render_inlines(inline.caption))
    elseif inline.t == "Span" then
      append(rendered, render_inlines(inline.content))
    elseif inline.t == "Quoted" then
      append(rendered, "``" .. render_inlines(inline.content) .. "''")
    elseif inline.t == "SmallCaps" then
      append(rendered, "\\textsc{" .. render_inlines(inline.content) .. "}")
    elseif inline.t == "Superscript" then
      append(rendered, "\\textsuperscript{" .. render_inlines(inline.content) .. "}")
    elseif inline.t == "Subscript" then
      append(rendered, "\\textsubscript{" .. render_inlines(inline.content) .. "}")
    elseif inline.t == "Strikeout" then
      append(rendered, render_inlines(inline.content))
    elseif inline.t == "RawInline" and inline.format == "latex" then
      append(rendered, inline.text)
    elseif inline.content ~= nil then
      append(rendered, render_inlines(inline.content))
    elseif inline.text ~= nil then
      append(rendered, escape_latex(inline.text))
    end
  end

  return table.concat(rendered)
end

local function render_plain_code_block(block)
  local lines = {}
  local text = (block.text or ""):gsub("\r\n", "\n"):gsub("\r", "\n")

  if text == "" then
    return "~"
  end

  if text:sub(-1) ~= "\n" then
    text = text .. "\n"
  end

  for line in text:gmatch("(.-)\n") do
    if line == "" then
      append(lines, "~")
    else
      append(lines, escape_code(line))
    end
  end

  return "{\\ttfamily\\footnotesize\\begin{tabular}[t]{@{}l@{}}"
    .. table.concat(lines, "\\\\\n")
    .. "\\end{tabular}}"
end

local highlighted_code_blocks = {}

local function render_code_block(block)
  if pandoc.pipe == nil then
    return render_plain_code_block(block)
  end

  local markdown = fenced_code_block(block)
  if highlighted_code_blocks[markdown] ~= nil then
    return highlighted_code_blocks[markdown]
  end

  local ok, latex = pcall(
    pandoc.pipe,
    "pandoc",
    { "-f", "markdown", "-t", "latex", "--highlight-style=tango" },
    markdown
  )

  if not ok then
    return render_plain_code_block(block)
  end

  latex = trim(latex)
  if latex == "" then
    return render_plain_code_block(block)
  end

  highlighted_code_blocks[markdown] = "{\\footnotesize\n" .. latex .. "\n}"
  return highlighted_code_blocks[markdown]
end

local function render_blocks(blocks)
  if blocks == nil or #blocks == 0 then
    return "~"
  end

  local rendered = {}

  for _, block in ipairs(blocks) do
    if block.t == "Plain" or block.t == "Para" then
      append(rendered, render_inlines(block.content))
    elseif block.t == "CodeBlock" then
      append(rendered, render_code_block(block))
    elseif block.t == "RawBlock" and block.format == "latex" then
      append(rendered, block.text)
    elseif block.t == "BulletList" then
      local items = { "\\begin{itemize}\\setlength\\itemsep{0pt}" }

      for _, item in ipairs(block.content) do
        append(items, "\\item " .. render_blocks(item))
      end

      append(items, "\\end{itemize}")
      append(rendered, table.concat(items, "\n"))
    elseif block.t == "OrderedList" then
      local items = { "\\begin{enumerate}\\setlength\\itemsep{0pt}" }

      for _, item in ipairs(block.content) do
        append(items, "\\item " .. render_blocks(item))
      end

      append(items, "\\end{enumerate}")
      append(rendered, table.concat(items, "\n"))
    elseif block.t == "BlockQuote" then
      append(rendered, "\\emph{" .. render_blocks(block.content) .. "}")
    elseif block.t == "Header" then
      append(rendered, "\\textbf{" .. render_inlines(block.content) .. "}")
    elseif block.t == "HorizontalRule" then
      append(rendered, "\\rule{\\linewidth}{0.4pt}")
    elseif block.content ~= nil then
      append(rendered, render_blocks(block.content))
    end
  end

  local latex = trim(table.concat(rendered, "\n\n"))

  if latex == "" then
    return "~"
  end

  return latex
end

local function has_block_content(blocks)
  return trim(render_blocks(blocks)) ~= "~"
end

local function has_header(headers)
  if headers == nil or #headers == 0 then
    return false
  end

  for _, cell in ipairs(headers) do
    if has_block_content(cell) then
      return true
    end
  end

  return false
end

local function has_code_block(blocks)
  if blocks == nil then
    return false
  end

  for _, block in ipairs(blocks) do
    if block.t == "CodeBlock" then
      return true
    end

    if type(block.content) == "table" and has_code_block(block.content) then
      return true
    end
  end

  return false
end

local function table_has_code_block(tbl)
  if tbl.headers ~= nil then
    for _, cell in ipairs(tbl.headers) do
      if has_code_block(cell) then
        return true
      end
    end
  end

  if tbl.rows ~= nil then
    for _, row in ipairs(tbl.rows) do
      for _, cell in ipairs(row) do
        if has_code_block(cell) then
          return true
        end
      end
    end
  end

  return false
end

local function cell_align(align)
  local name = tostring(align)

  if name == "AlignCenter" then
    return "\\centering"
  elseif name == "AlignRight" then
    return "\\raggedleft"
  else
    return "\\raggedright"
  end
end

local function column_spec(align, width)
  return ">{"
    .. cell_align(align)
    .. "\\arraybackslash}p{"
    .. string.format("%.4f", width)
    .. "\\linewidth}"
end

local function count_columns(tbl)
  if tbl.aligns ~= nil and #tbl.aligns > 0 then
    return #tbl.aligns
  end

  if tbl.headers ~= nil and #tbl.headers > 0 then
    return #tbl.headers
  end

  if tbl.rows ~= nil and #tbl.rows > 0 then
    return #tbl.rows[1]
  end

  return 0
end

local function normalized_widths(widths, column_count)
  local result = {}
  local total = 0

  for index = 1, column_count do
    local width = widths[index] or 0
    result[index] = width
    total = total + width
  end

  for index = 1, column_count do
    if total > 0 then
      result[index] = result[index] / total * 0.92
    else
      result[index] = 0.92 / column_count
    end
  end

  return result
end

local function table_spec(specs, outer_border_only)
  if outer_border_only then
    return "|" .. table.concat(specs, "") .. "|"
  end

  return "|" .. table.concat(specs, "|") .. "|"
end

local function latex_cell(cell, align)
  local lines = {
    "\\begin{minipage}[t]{\\linewidth}",
    cell_align(align),
    render_blocks(cell),
    "\\strut",
    "\\end{minipage}",
  }

  return table.concat(lines, "\n")
end

local function latex_row(cells, aligns, add_bottom_line)
  local rendered_cells = {}

  for index, cell in ipairs(cells) do
    rendered_cells[index] = latex_cell(cell, aligns[index])
  end

  local row = table.concat(rendered_cells, "\n&\n") .. "\n\\tabularnewline"
  if add_bottom_line then
    row = row .. "\n\\hline"
  end

  return row
end

function Table(tbl)
  if FORMAT ~= "latex" and FORMAT ~= "beamer" then
    return nil
  end

  local column_count = count_columns(tbl)
  if column_count == 0 then
    return nil
  end

  local widths = normalized_widths(tbl.widths or {}, column_count)
  local specs = {}

  for index = 1, column_count do
    specs[index] = column_spec(tbl.aligns[index], widths[index])
  end

  local outer_border_only = table_has_code_block(tbl)
  local add_row_lines = not outer_border_only

  local lines = {
    "\\begingroup",
    "\\setlength{\\tabcolsep}{4pt}",
    "\\renewcommand{\\arraystretch}{1.25}",
    "\\begin{longtable}{" .. table_spec(specs, outer_border_only) .. "}",
  }

  local caption = render_inlines(tbl.caption)
  if caption ~= "" then
    append(lines, "\\caption{" .. caption .. "}\\tabularnewline")
  end

  append(lines, "\\hline")

  if has_header(tbl.headers) then
    local header = latex_row(tbl.headers, tbl.aligns, add_row_lines)
    append(lines, header)
    append(lines, "\\endfirsthead")
    append(lines, "\\hline")
    append(lines, header)
    append(lines, "\\endhead")
  end

  for _, row in ipairs(tbl.rows) do
    append(lines, latex_row(row, tbl.aligns, add_row_lines))
  end

  if outer_border_only then
    append(lines, "\\hline")
  end

  append(lines, "\\end{longtable}")
  append(lines, "\\endgroup")

  return pandoc.RawBlock("latex", table.concat(lines, "\n"))
end
