function Div(el)
  if FORMAT:match 'latex' then
    if el.classes[1] == "info" or el.classes[1] == "warning" or el.classes[1] == "success" or el.classes[1] == "correctbox" or el.classes[1] == "questionbox" then
      local env = el.classes[1]
      table.insert(el.content, 1, pandoc.RawBlock('latex', '\\begin{' .. env .. '}'))
      table.insert(el.content, pandoc.RawBlock('latex', '\\end{' .. env .. '}'))
      return el.content
    end
  end
end

function Span(el)
  if FORMAT:match 'latex' then
    if el.classes[1] == 'underline' then
      local content = el.content
      table.insert(content, 1, pandoc.RawInline('latex', '\\underline{'))
      table.insert(content, pandoc.RawInline('latex', '}'))
      return content
    elseif el.classes[1] == 'correct-text' then
      local content = el.content
      table.insert(content, 1, pandoc.RawInline('latex', '\\textcolor{green!70!black}{'))
      table.insert(content, pandoc.RawInline('latex', '}'))
      return content
    elseif el.classes[1] == 'incorrect-text' then
      local content = el.content
      table.insert(content, 1, pandoc.RawInline('latex', '\\textcolor{red}{'))
      table.insert(content, pandoc.RawInline('latex', '}'))
      return content
    end
  end
end
