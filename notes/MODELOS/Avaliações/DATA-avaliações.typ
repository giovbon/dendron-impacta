#let tam_fonte = 10pt
#let fonte = "Fira Sans"
#let materia = "Desenvolvimento de APIs e Microsserviços"
#let semestre = "1"
#let ano = "2025"
#let nome_prof = "Giovani Bontempo"
#let curso = ""
#let turma = ""
#let data = ""
#let versao = "1"
#let tipo_avaliacao = "Oficial" //Substitutiva
#let horario_matutino = "08h00 - 11h40"
#let horario_noturno = "19h00 - 22h40"
#let periodo_minimo = "1 hora"
#let nota_total = 10.0
#let ter_dissertativas = false
#let mostrar_titulos = true
#let ter_gabarito = true
#let exibir_resp_gab = true //se for imprimir a prova deixar false
#let gabarito_de = 20 // ou 10
// duas vars abaixo apenas tem efeito se ter_dissertativas == true
#let valor_dissertativas = 7.0
#let valor_objetivas = 3.0

// ---------------- funções

#let alternativas(arg1, arg2, arg3, arg4, arg5) = [
  
#set par(first-line-indent: 0.6em, spacing: 0.5em, hanging-indent: 0.6em)
*A)* #arg1 \
*B)* #arg2 \
*C)* #arg3 \
*D)* #arg4 \
*E)* #arg5 \
]

// ------------- questões objetivas

// PREENCHIMENTO: (numero_questao, [enunciado + alternativas usando função], resposta_gabarito)
#let todas_questoes = (
  (1, [
    Qual o funcionamento do protocolo HTTP?
    #alternativas("WebSockets", "Envio assíncrono Envio assíncrono Envio assíncrono Envio assíncrono Envio assíncrono Envio assíncrono Envio assíncrono", "Requisição e resposta sem estado", "Encapsulamento local", "Somente redes locais")
  ], "A"),
  (2, [
    Qual método HTTP cria um novo recurso?
    #alternativas("GET", "POST", "PUT", "DELETE", "PATCH")
  ], "B"),
    (3, [
    Qual método HTTP cria um novo recurso?
    #alternativas("GET", "POST", "PUT", "DELETE", "PATCH")
  ], "B"),
)

// ---------------- questões dissertativas
// PREENCHIMENTO:  (numero_questao, [enunciado]) 
// OBS: as linhas de resposta são incluídas automaticamente (12 linhas)
#let questoes_dissertativas = (
  (3,[
  Explique com suas palavras a diferença entre uma arquitetura monolítica e uma baseada em microsserviços. Aponte ao menos duas vantagens e duas desvantagem dos microsserviços.
  ]),
    (4,[
  Explique com suas palavras a diferença entre uma arquitetura monolítica e uma baseada em microsserviços. Aponte ao menos duas vantagens e duas desvantagem dos microsserviços.
  ]),
)