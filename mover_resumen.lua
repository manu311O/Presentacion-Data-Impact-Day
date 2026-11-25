-- Mueve el bloque ::: {#resumen} (generado al final, cuando ya existen todas las cifras)
-- al principio del documento, justo después del título. Así el resumen usa resultados
-- calculados después y aun así aparece primero en el PDF, en un solo render.
function Pandoc(doc)
  local hallado = nil
  local cuerpo = pandoc.Div(doc.blocks):walk({Div = function(d)
    if d.identifier == "resumen" then hallado = d; return {} end
  end})
  doc.blocks = cuerpo.content
  if hallado then doc.blocks:insert(1, hallado) end
  return doc
end
