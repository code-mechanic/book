function Div(el)
  if FORMAT:match 'latex' then
    if el.classes[1] == "info" or el.classes[1] == "warning" or el.classes[1] == "success" then
      local env = el.classes[1]
      table.insert(el.content, 1, pandoc.RawBlock('latex', '\\begin{' .. env .. '}'))
      table.insert(el.content, pandoc.RawBlock('latex', '\\end{' .. env .. '}'))
      return el.content
    end
  end
end
