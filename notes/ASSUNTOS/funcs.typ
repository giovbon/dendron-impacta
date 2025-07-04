// Funções

#let imagem(caminho, tamanho, legenda) = [
  
  #figure(
  image(caminho, width: tamanho),
  caption: [
    #legenda.
  ],
)
]

#let foot-link(url, texto) = [
  #footnote[ #link(url)[#texto]] 
]

#let exercicio(texto) = [

  #set block(spacing: 0em)
  #set text(top-edge: "cap-height")
  #rect(fill: black, stroke: 2pt + yellow)[ #emoji.hand.write  #text(white, number-type: "old-style", size: 10pt, tracking: -0.4pt, font: "Fira Sans")[#texto]]
]

// usar #v(2em) antes