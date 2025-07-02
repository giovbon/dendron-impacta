// data: 1 sem 2025 - questões fracas e fáceis feitas pelo Caio

#let todas_questoes = (
  [
Qual das alternativas abaixo representa corretamente o funcionamento do protocolo HTTP?

#alternativas("Comunicação em tempo real entre dois servidores usando WebSockets", "Protocolo de envio assíncrono de dados entre navegadores","Protocolo de requisição e resposta baseado em texto sem estado","Sistema de encapsulamento de pacotes em redes locais","Protocolo utilizado apenas em redes locais")

//    #line(length: 60%)
  ],
  [
    Em uma API RESTful, qual método HTTP é utilizado para criar um novo recurso?
    #alternativas("GET", "POST", "PUT", "DELETE", "PATCH")
  ],
  [
    No padrão MVC, qual é a função do componente Controller?
    #alternativas("Armazenar os dados da aplicação","Criar a interface gráfica do usuário", "Receber e processar requisições, coordenando a lógica da aplicação", "Fazer a comunicação direta com o banco de dados", "Gerenciar a persistência de dados no servidor")
  ],
  [
    Uma aplicação monolítica:
  #alternativas("É dividida em múltiplos serviços independentes", "Possui uma arquitetura distribuída baseada em containers", "Integra todas as funcionalidades em um único código executável", "Funciona apenas com serviços em nuvem", "Permite uma escalabilidade infinita sem alterações no código")
  ],
  [
    Qual é uma vantagem dos microsserviços em comparação com uma arquitetura monolítica?
    #alternativas("Melhor integração com bancos de dados relacionais", "Maior dependência entre os módulos", "Independência de desenvolvimento, escalabilidade e implantação", "Necessidade menor de ferramentas como Docker", "Código mais simples e fácil de testar")
  ],
  [
    O Swagger é utilizado para:
    #alternativas("Gerar tokens de autenticação", " Documentar e testar APIs de forma interativa", "Criptografar requisições HTTP", "Versionar códigos em repositórios Git", "Monitorar a performance da aplicação")
  ],
  [
    Qual comando básico é usado para instânciar e criar uma API em Flask?
    #alternativas(`flask init app`, `python flask run`, `flask start app`, `app.run()`, `app = Flask()`)
  ],
  [
    Em uma aplicação Flask, o decorador `@app.route()` serve para:
    #alternativas("Iniciar o servidor da aplicação", "Configurar os bancos de dados", "Criar rotas para endpoints da API", "Executar testes automatizados", "Definir configurações globais da aplicação")
  ],
  [
    No modelo cliente-servidor, o cliente:
  #alternativas("Responde às requisições feitas pelo servidor", "Sempre armazena os dados da aplicação", "Inicia a comunicação solicitando recursos ou serviços", "Garante a persistência dos dados no servidor", "Faz a autenticação dos usuários")
  ],
  [No Docker, um container é:
#alternativas("Uma máquina virtual completa", "Um ambiente isolado e leve que executa uma aplicação", "Um tipo de banco de dados relacional", "Um serviço de hospedagem na nuvem", "Um sistema de gerenciamento de containers")
],
[
  Qual comando do Docker é usado para construir uma imagem a partir de um `Dockerfile`?
  #alternativas(`docker run`, `docker-compose up`, `docker build`, `docker install`, `docker create`)
],
[
  O GitHub é:
  #alternativas("Um sistema operacional baseado em Linux", "Uma ferramenta de deploy de containers", "Um serviço de hospedagem de código com controle de versão baseado em Git", "Um ambiente de execução para linguagens de programação web", "Um editor de código para desenvolvedores")
],
[
  Para enviar alterações locais ao repositório remoto no GitHub, usamos:
  #alternativas(`git push`, `git init`, `git commit`, `git add`, `git pull`)
],
[
  Uma API é considerada RESTful quando:
#alternativas("Está escrita em Flask", "Usa somente o método GET", "Segue os princípios de arquitetura REST, como uso de recursos e verbos HTTP", "Utiliza bancos de dados relacionais", "Permite a execução de comandos SQL via HTTP")
],
[
  Um endpoint que responde a uma requisição GET geralmente serve para:
  #alternativas("Excluir um recurso", "Criar um novo dado", "Atualizar parcialmente um recurso", "Listar ou retornar informações", "Enviar informações sensíveis para o servidor")
],
[
  Qual das opções a seguir é uma boa prática em arquitetura de microsserviços?
  #alternativas("Compartilhar o mesmo banco de dados entre todos os serviços", "Ter serviços fortemente acoplados", "Manter serviços pequenos, independentes e com comunicação clara", "Centralizar toda a lógica de negócio em um serviço principal", "Utilizar apenas um único tipo de banco de dados em todos os serviços")
],
[
  A principal função do arquivo `Dockerfile` é:
  #alternativas("Controlar o versionamento de código-fonte", "Definir como o container deve ser executado e configurado", "Publicar imagens no GitHub", "Gerenciar bancos de dados relacionais", "Criar variáveis de ambiente no sistema operacional")
],
[
  Em uma aplicação Flask, a função `jsonify()` é utilizada para:
  #alternativas("Renderizar páginas HTML", "Criar conexões com o banco de dados", "Retornar dados em formato JSON", "Importar bibliotecas externas", "Conectar a API ao frontend")
],
[
  Em relação à estrutura de um projeto Flask, qual das opções a seguir representa uma boa prática?
  #alternativas("Colocar todas as rotas e lógica de negócio em um único arquivo .py", "Separar rotas, modelos e configurações em arquivos e pastas distintos para melhor organização", "Utilizar apenas variáveis globais em vez de banco de dados", "Evitar o uso de ambientes virtuais para simplificar a instalação de dependências", "Organizar as rotas apenas com base nas necessidades da API")
],
[
  Qual das opções abaixo melhor descreve o papel do arquivo `requirements.txt` em uma aplicação Flask?
#alternativas("Inicializa o servidor de desenvolvimento local", "Define as rotas da aplicação", "Lista as dependências e bibliotecas que devem ser instaladas no ambiente", "Executa testes automatizados definidos na aplicação", "Gerencia as permissões de acesso ao sistema")
]
)

// questões dissertativas, inclua em novo [texto-questao] depois de ], 

#let questoes_dissertativas = (
  [
Explique com suas palavras a diferença entre uma arquitetura monolítica e uma baseada em microsserviços. Aponte ao menos duas vantagens e duas desvantagem dos microsserviços.
#linhas12()

  ],
  [
    Descreva os passos essenciais para criar uma aplicação Flask com dois endpoints (`GET` e `POST`), usando um dicionário como banco de dados; simples. Mencione também como essa aplicação poderia ser executada usando Docker. Entidade médico e paciente.
    #linhas12()
  ],
)

// gabarito, formate manualmente de acordo com o número de questões, seguindo padrão abaixo

#let gabarito = [
    
  #table(
  columns: 6,
[*Questão*], [*A*], [*B*], [*C*], [*D*], [*E*],

[1],[],[],[],[],[],
[2],[],[],[],[],[],
[3],[],[],[],[],[],
[4],[],[],[],[],[],
[5],[],[],[],[],[],
[6],[],[],[],[],[],
[7],[],[],[],[],[],
[8],[],[],[],[],[],
[9],[],[],[],[],[],
[10],[],[],[],[],[],
[11],[],[],[],[],[],
[12],[],[],[],[],[],
[13],[],[],[],[],[],
[14],[],[],[],[],[],
[15],[],[],[],[],[],
[16],[],[],[],[],[],
[17],[],[],[],[],[],
[18],[],[],[],[],[],
[19],[],[],[],[],[],
[20],[],[],[],[],[],
)
]

// cálculo de pontuações, é inserido automaticamente abaixo do gabarito: versao da prova, numero das questões objetivas, (valor por questão), numero das questões dissertativas e (valor por questão) 

#let qtd_objetivas = todas_questoes.len()
#let qtd_dissertativas = questoes_dissertativas.len()

#let peso_total = (qtd_objetivas * peso_objetiva)

#let valor_dissertativa = 0
#if ter_dissertativas {
  peso_total = (qtd_objetivas * peso_objetiva) + (qtd_dissertativas * peso_dissertativa)
  valor_dissertativa = calc.round((nota_total * peso_dissertativa) / peso_total, digits: 2)
}

#let valor_objetiva = calc.round((nota_total * peso_objetiva) / peso_total, digits: 2)

	/* RESPOSTA GABARITO 
 1: C, 2: B, 3: C, 4: C, 5: C, 6: B, 7: E, 8: C, 9: C, 10: B, 11: C, 12: C, 13: A, 14: C, 15: D, 16: C, 17: B, 18: C, 19: B, 20: C
 
 */
)