#import "../ASSUNTOS/funcs.typ" // as funcs
#import "../ASSUNTOS/redes.typ"
#import "../ASSUNTOS/microsservicos.typ"
#import "../ASSUNTOS/python.typ"
#import "../ASSUNTOS/apis.typ"
#import "../ASSUNTOS/flask.typ"
#import "../ASSUNTOS/docker.typ"

#let titulo_doc = "Desenvolvimento de API e Microsserviços"
#set page(
  header: [#text(font: "Liberation Mono", size: 9pt)[#titulo_doc - IMPACTA]],
  paper: "a4",
  margin: (x: 2cm, y: 2.5cm),
  numbering: "1",
)
#set text(
  font: "Linux Libertine",
  size: 12pt,
)
#set par(
  justify: true,
  leading: 0.52em,
)

#set footnote(numbering: "1")
#set footnote.entry(gap: 0.8em)
#set heading(numbering: "1.")
#show link: underline

#outline( title: [Conteúdo])

// estilização dos blocos de código
#show raw.where(block: false): box.with(
  fill: luma(240),
  inset: (x: 3pt, y: 0pt),
  outset: (y: 3pt),
  radius: 2pt,
)

#show raw.where(block: true): block.with(
  fill: luma(250),
  inset: 10pt,
  radius: 4pt,
)
// estilização dos blocos de código

#pagebreak() 

#redes.introducao_redes

#pagebreak()  

#microsservicos.microsservicos

#pagebreak() 

#apis.REST

#pagebreak()

#python.python

#pagebreak() 

#flask.flask_api

#pagebreak() 

#docker.docker-container