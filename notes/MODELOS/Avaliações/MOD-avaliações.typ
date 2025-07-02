#import "@preview/examify:0.1.1": * 
#import emoji: face
#import "DATA-avaliações.typ": * // PARA MUDAR DADOS DE PROVA


// ----------------- cálculos pontos por questão

#let len_objetivas = todas_questoes.len()
#let len_dissertativas = questoes_dissertativas.len()

#let un_valor_dissertativas = 0.0
#let un_valor_objetivas = calc.round(nota_total / len_objetivas, digits: 2)
#if ter_dissertativas == true {
      un_valor_objetivas = calc.round(valor_objetivas / len_objetivas, digits: 2)
      un_valor_dissertativas = calc.round(valor_dissertativas / len_dissertativas, digits: 2)
}

#if ter_dissertativas and valor_dissertativas + valor_objetivas != nota_total {
  panic("Soma de valores de dissertativas e objetivas diferente da nota total")
}

// -------------- configurações globais de página e texto

#set page(
  paper: "a4",
  margin: (x: 1cm, y: 1.8cm),
  numbering: "1 / 1",
)
#set text(
  font: fonte,
  size: tam_fonte
)
#set par(
  justify: true,
  leading: 0.52em,
)

// --------------- cabeçalho

#align(center)[
  #image("logo.png", width: 5cm)
  #v(2em)
  #text(size: 18pt, weight: "bold")[#materia]
  
  #text(size: 14pt, weight: "bold")[Avaliação #tipo_avaliacao]
  #text(size: 10pt)[#versao]
  
  #text(size: 11pt)[#semestre semestre de #ano, professor #nome_prof.]

  #v(2em)
]

#stack(
    dir: ltr,
    rect(width: 340pt, height: 30pt)[#align(left)[#text(size: 12pt)[*Nome*:]]],
    rect(width: 200pt, height: 30pt)[#align(left)[#text(size: 12pt)[*Matrícula:*]]],
  )
#stack(
    dir: ltr,
    rect(width: 160pt, height: 20pt)[#align(left)[#text(size: 10pt)[*Data:*]]],
    rect(width: 180pt, height: 20pt)[#align(left)[#text(size: 10pt)[*Curso:* #curso]]],
    rect(width: 200pt, height: 20pt)[#align(left)[#text(size: 10pt)[*Turma:* #turma]]],
  )

// ---------------------------- instruções
  #v(5em)
#align(center)[
#text(weight: "bold", size: 12pt)[LEIA AS INSTRUÇÕES ABAIXO:]

#stack(
    dir: ltr,
    rect(width: 500pt, height: 350pt ,stroke: none)[#align(left)[#text(size: 11pt)[
      #v(0.5em) 
      
Início da prova:
- Matutino: #horario_matutino
- Noturno: #horario_noturno

A nota da prova compõe a nota semestral, juntamente com a média das avaliações parciais AP.

#emoji.warning Você deverá permanecer, no mínimo, por *#periodo_minimo*, na sala de aplicação das provas.

 #emoji.checkmark.box A interpretação da prova faz parte do processo de avaliação. #if ter_dissertativas { "A organização lógica, clareza e a legibilidade das respostas na resolução da prova também serão consideradas na correção. As respostas às questões dissertativas devem ser registradas à caneta."
}

#emoji.crossmark *Não use qualquer equipamento eletrônico* (celular, calculadora, etc); não se comunique com os demais estudantes nem troque material com eles; não consulte material bibliográfico, cadernos ou anotações de qualquer espécie.

#emoji.crossmark Qualquer tentativa de *fraude ou cola* será punido com *nota zero*.

#emoji.crossmark A persistência em *conversas* de alunos durante a prova causará penalidades, como por exemplo o desconto progressivo da nota final, a critério do professor.

#if ter_gabarito [
  #emoji.pen.fountain Todas as respostas devem ser registradas à *caneta* preta ou azul no *gabarito* localizado na última página.
  
  #emoji.warning O gabarito é *definitivo*, portanto certifique-se de preencher corretamente suas respostas. Respostas fora do gabarito, rasuradas ou sem preenchimento serão, *sem exceção*, consideradas *erradas*.
]
]]],
  )
]

// ---------------------- QUESTÕES

#pagebreak() // Inicia o conteúdo em 2 colunas em uma nova página

#set page(columns: 2) // Aplica as duas colunas A PARTIR DAQUI

#set heading(numbering: "1.")

#if mostrar_titulos == true {
  text(size: 16pt, weight: "bold")[Questões Objetivas]
}

// --------- exibe as questões ordenadas pelo número
#let questoes_ordenadas = array.sorted(todas_questoes, key: it => it.at(0))

#for questao in questoes_ordenadas [
  *#questao.at(0)*. #questao.at(1)
]


// -----------------------  DISSERTATIVAS

#let linhas12() = [
  #set line(length: 100%)
  #stack(
    spacing: 2em,
     h(1em),
      line(stroke: 0.8pt + gray),
      line(stroke: 0.8pt + gray),
      line(stroke: 0.8pt + gray),
      line(stroke: 0.8pt + gray),
      line(stroke: 0.8pt + gray),
      line(stroke: 0.8pt + gray),
      line(stroke: 0.8pt + gray),
      line(stroke: 0.8pt + gray),
      line(stroke: 0.8pt + gray),
      line(stroke: 0.8pt + gray),
      line(stroke: 0.8pt + gray)
  )
]

#if ter_dissertativas [ // exibe apenas se em data var estiver true
#set page(columns: 1)

#if mostrar_titulos == true {
  text(size: 16pt, weight: "bold")[Questões Dissertativas]
}
 
  #v(0.3em)

  // --------- exibe as questões ordenadas pelo número
#let questoes_ordenadas_dissert = array.sorted(questoes_dissertativas, key: it => it.at(0))

#for questao in questoes_ordenadas_dissert [
  #questao.at(0). #questao.at(1)
  #linhas12()
  ]
]

// ------------- GABARITO

#let gabarito20 = [
    
  #table(
  columns: 6,
[*Questão*], [*A*], [*B*], [*C*], [*D*], [*E*],

[*1*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],[#text(gray, size: 8pt)[E]],
[*2*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],[#text(gray, size: 8pt)[E]],
[*3*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],[#text(gray, size: 8pt)[E]],
[*4*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],[#text(gray, size: 8pt)[E]],
[*5*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],[#text(gray, size: 8pt)[E]],
[*6*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],[#text(gray, size: 8pt)[E]],
[*7*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],[#text(gray, size: 8pt)[E]],
[*8*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],[#text(gray, size: 8pt)[E]],
[*9*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],[#text(gray, size: 8pt)[E]],
[*10*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],[#text(gray, size: 8pt)[E]],
[*11*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],[#text(gray, size: 8pt)[E]],
[*12*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],[#text(gray, size: 8pt)[E]],
[*13*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],[#text(gray, size: 8pt)[E]],
[*14*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],[#text(gray, size: 8pt)[E]],
[*15*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],[#text(gray, size: 8pt)[E]],
[*16*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],[#text(gray, size: 8pt)[E]],
[*17*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],[#text(gray, size: 8pt)[E]],
[*18*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],[#text(gray, size: 8pt)[E]],
[*19*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],[#text(gray, size: 8pt)[E]],
[*20*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],[#text(gray, size: 8pt)[E]],
)
]

#let gabarito10 = [
    
  #table(
  columns: 6,
[*Questão*], [*A*], [*B*], [*C*], [*D*], [*E*],

[*1*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],[#text(gray, size: 8pt)[E]],
[*2*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],[#text(gray, size: 8pt)[E]],
[*3*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],[#text(gray, size: 8pt)[E]],
[*4*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],[#text(gray, size: 8pt)[E]],
[*5*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],[#text(gray, size: 8pt)[E]],
[*6*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],[#text(gray, size: 8pt)[E]],
[*7*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],[#text(gray, size: 8pt)[E]],
[*8*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],[#text(gray, size: 8pt)[E]],
[*9*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],[#text(gray, size: 8pt)[E]],
[*10*],[#text(gray, size: 8pt)[A]],[#text(gray, size: 8pt)[B]],[#text(gray, size: 8pt)[C]],[#text(gray, size: 8pt)[D]],
)
]

#if ter_gabarito {
  pagebreak() 
  set page(columns: 1)
  align(center)[
  
  #text(size: 16pt, weight: "bold")[Gabarito #versao] <gab>

  #if gabarito_de == 10 {
    gabarito10
  }
  #if gabarito_de == 20 {
    gabarito20
  }

]}

  #if exibir_resp_gab {

  line(
  length: 8cm,
  stroke: 2pt + red,
)
  set text(fill: red)
  text()[*Versão #versao* do gabarito:]
  let gab_ordenado = array.sorted(todas_questoes, key: it => it.at(0))

  for gab in gab_ordenado [
  *#gab.at(0)*  #sym.arrow #gab.at(2) |
]
  line(
  length:8cm,
  stroke: 1pt + red,
)
  if true [
   #todas_questoes.len() questões objetivas, valendo #un_valor_objetivas pontos cada.
  ]
  if ter_dissertativas [
    #linebreak()
  #questoes_dissertativas.len() questões dissertativas, valendo #un_valor_dissertativas pontos cada.]
  
  line(
  length: 8cm,
  stroke: 2pt + red,
)
}
