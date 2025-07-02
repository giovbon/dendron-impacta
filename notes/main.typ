#import "funcs.typ" // as funcs
#import "redes.typ"
#import "internet.typ"
#import "microsservicos.typ"
//#import ""

#set page(
  header: [#text(font: "Liberation Mono", size: 9pt)[#funcs.titulo_doc - IMPACTA]],
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

#pagebreak() 

#redes.introducao_redes

#internet.internet

#pagebreak()  

#microsservicos.microsservicos-vs-monolitico

#pagebreak() 

= APIs <api_def>

/ API: (_Application Programming Interface_) é um conjunto de regras, protocolos e ferramentas que permite que diferentes peças de softwares se comuniquem e troquem dados entre si. #footnote[ #link("https://youtu.be/hltLrjabkiY")[APIs explicadas em 6 minutos!]]  

Por exemplo, para que um app de entregas possa localizar um endereço ele faz uma requisição à API #link("https://viacep.com.br/")[ViaCEP], enviando um CEP: `https://viacep.com.br/ws/01001000/json/`. A API acessa os dados de endereços e devolve como resposta ao app informações estruturadas em JSON do endereço solicitado. Isso ocorre sem que o desenvolvedor precise saber como a API realmente funciona por trás dos panos (caixa preta).

APIs podem ser locais (em bibliotecas ou sistemas operacionais) ou expostas na web (como REST, SOAP, RPC), permitindo integrações, reutilização de código e criação de ecossistemas conectados de forma padronizada.

A arquitetura da API geralmente é explicada em termos de cliente e servidor. A aplicação que envia a solicitação é chamada de cliente e a aplicação que envia a resposta é chamada de servidor. Então, no exemplo do clima, o ViaCEP é o servidor e o app é o cliente.

#figure(image("./img/client-server.png", width: 50%),caption: [APIs dentro da arquitetura cliente-servidor.])

== REST e RESTful
/ REST: é um estilo arquitetural definido por Roy Fielding que estabelece um conjunto de restrições para comunicação entre sistemas distribuídos via HTTP, como cliente-servidor, stateless, cache, sistema em camadas, interface uniforme e, idealmente, HATEOAS.
/ API RESTful: (ou RESTful API) é uma interface de comunicação entre sistemas que segue os princípios do estilo arquitetural REST(_Representational State Transfer_). #funcs.foot-link("https://youtu.be/CVBpYfPKGlE", "The Right Way To Build REST APIs")
Os os princípios da arquitetura REST são:
- Usa o protocolo HTTP para comunicação e manipula recursos identificados por URLs, como por exemplo `https://viacep.com.br/ws/01001000/json/`. 
- Ela utiliza os métodos HTTP corretos: `GET` para buscar dados, `POST` para criar, `PUT` ou `PATCH` para atualizar e `DELETE` para remover.
- É *stateless*, ou seja, cada requisição carrega todas as informações necessárias, sem depender de um estado salvo no servidor. 
- As respostas geralmente retornam dados em formatos como JSON ou XML, com cabeçalhos que indicam o formato, cache, autenticação e status da operação.

As APIs REST oferecem diversos benefícios que as tornam amplamente utilizadas no desenvolvimento moderno de software. Em primeiro lugar, elas seguem padrões bem estabelecidos da web, como o protocolo HTTP, o uso de URLs para identificar recursos e formatos de dados como JSON, o que facilita tanto o consumo quanto a implementação das APIs. Além disso, são baseadas em uma arquitetura stateless, ou seja, cada requisição é independente e carrega todas as informações necessárias, o que favorece a escalabilidade, já que o servidor não precisa manter estado entre as chamadas.

Outro benefício importante é a possibilidade de utilizar cache, o que melhora o desempenho e reduz a carga no servidor, já que os dados podem ser reutilizados pelo cliente sem necessidade de novas requisições. As APIs REST também promovem um forte desacoplamento entre cliente e servidor, permitindo que cada parte evolua de forma independente, além de permitir a inclusão de camadas intermediárias, como proxies e gateways.

A interface padronizada baseada em verbos HTTP torna o uso intuitivo e facilita a manipulação de recursos. Além disso, os dados geralmente são transmitidos em formatos leves e legíveis, como JSON, o que simplifica o desenvolvimento, a depuração e a integração com outros sistemas. Por fim, REST oferece flexibilidade para evolução contínua da API, suporte a diferentes formatos e grande interoperabilidade, sendo ideal para aplicações distribuídas, microserviços e integrações com sistemas diversos (aplicativos móveis, navegadores e etc).

Ao comparar essas característica do REST a alternativas, temos:

- SOAP: É um protocolo de comunicação rígido que utiliza XML e possui uma estrutura de mensagens estrita, com regras definidas em WSDL. Ao contrário do REST, não é stateless por padrão, o que pode resultar em maior sobrecarga, menor legibilidade e uso limitado de cache, levando a uma complexidade e desempenho inferiores em sistemas distribuídos modernos.
    - No SOAP, o cliente é fortemente acoplado ao servidor porque depende de um contrato rígido definido via WSDL, que especifica exatamente os métodos disponíveis, os parâmetros esperados e a estrutura das mensagens. Isso significa que qualquer mudança no servidor pode quebrar o funcionamento do cliente, exigindo atualizações coordenadas. Esse acoplamento reduz a flexibilidade e dificulta a evolução independente dos sistemas, ao contrário do REST, que promove um acoplamento mais fraco e maior tolerância a mudanças.
- GraphQL: uma linguagem de consulta que centraliza o acesso a dados em uma única rota, permitindo que o cliente especifique exatamente quais dados deseja. Isso proporciona flexibilidade, mas aumenta a complexidade do servidor, dificulta o uso de cache em níveis HTTP e complica o monitoramento e controle de acesso, já que não se baseia em recursos padronizados como URLs.

/ Endpoints: um endpoint em uma API RESTful é o endereço exato (URL) onde o cliente faz requisições para acessar ou manipular recursos no servidor. Cada endpoint representa uma porta de entrada específica, por exemplo, `/usuarios` para listar todos os usuários ou `/usuarios/123` para obter, atualizar ou deletar o usuário com ID `123` . Quando o cliente envia uma requisição HTTP (como GET, POST, PUT, DELETE) para esse endereço, o servidor processa o pedido, valida e autentica (caso necessário) e responde com os dados ou o status correspondente.  #footnote[ #link("https://youtu.be/CE_QXxXxZR8")[What is an API Endpoint?]]

Endpoints são fundamentais pois fazem a conexão entre cliente e servidor.

/ Recursos: são entidades ou objetos que representam dados manipulados pela aplicação, como usuários, produtos, posts, etc. Cada recurso é acessado por uma URL única (endpoint) e pode ser manipulado por métodos HTTP de forma padronizada.

/ Requisição: ou solicitação REST é uma mensagem enviada por um cliente (como um navegador ou aplicativo) a um servidor, com o objetivo de acessar, criar, alterar ou excluir recursos. Ela é composta por elementos como o método HTTP (GET, POST, PUT, DELETE), a URL do recurso, os cabeçalhos (com informações como tipo de conteúdo) e, quando necessário, um corpo com os dados enviados.
  - *Cabeçalho* (header): contém metadados da requisição, como o tipo de conteúdo enviado (Content-Type: application/json), o formato esperado na resposta (Accept: application/json), tokens de autenticação, e outras informações de controle.
  - *Corpo* (body): contém os dados reais enviados ao servidor, geralmente em formato JSON, XML ou formulário. É usado principalmente em métodos como POST ou PUT para enviar informações como novos registros ou atualizações (ex: dados de um novo usuário).

Há diferentes tipos de *parâmetros* em APIs RESTful, onde cada tipo de parâmetro tem um papel específico e é usado de acordo com o tipo de operação que queremos realizar com a API:

- *_Path parameters_*: são partes fixas da URL que servem para identificar um recurso específico. Por exemplo, em GET `/usuarios/5`, o 5 é o ID do usuário que queremos acessar. Esses parâmetros são obrigatórios e usados quando queremos manipular um recurso diretamente.
- _*Query parameters*_: são usados para refinar uma consulta e aparecem após o sinal de interrogação na URL. Por exemplo, em GET `/produtos?categoria=livros&pagina=2`, os parâmetros categoria e pagina ajudam a filtrar ou paginar os resultados. Eles são opcionais e usados principalmente para busca e filtros.
- _*Header parameters*_: são enviados no cabeçalho da requisição HTTP e não aparecem na URL. Eles carregam informações de controle como autenticação (Authorization) ou tipo de conteúdo (Content-Type). São úteis para configurar o comportamento da comunicação entre cliente e servidor. Ex: `Authorization: Bearer token123`
- *_Body parameters_*: aparecem no corpo da requisição, geralmente em métodos como POST, PUT e PATCH. Servem para enviar dados estruturados (normalmente em JSON), como quando criamos ou atualizamos um recurso. Ex: `{ "nome": "João", "email": "joao@example.com" }`

/ Métodos HTTP: (ou verbos HTTP) são utilizados para indicar a ação que o cliente deseja realizar em relação a um recurso no servidor. #footnote[ #link("https://youtu.be/tkfVQK6UxDI")[HTTP Request Methods | GET, POST, PUT, DELETE]]

Os principais são:

#table(
  columns: (auto, 1fr, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [*Método*], [*Descrição*], [*Idempotente?*],
  ),
  [`GET`], 
  [Recupera dados de um recurso específico. É seguro e não altera o estado do servidor.], 
  [Sim],

  [`POST`], 
  [Envia dados para criar um novo recurso. Pode alterar o estado do servidor e criar múltiplos recursos.], 
  [Não],

  [`PUT`], 
  [Atualiza um recurso existente ou cria se não existir. O resultado é sempre o mesmo após múltiplas requisições.], 
  [Sim],

  [`DELETE`], 
  [Remove um recurso específico do servidor. A mesma requisição repetida tem o mesmo efeito.], 
  [Sim],
)

Um método HTTP é considerado *idempotente* quando a realização da mesma operação múltiplas vezes tem o mesmo efeito que realizá-la uma única vez. Em outras palavras, não importa quantas vezes você execute a mesma requisição, o resultado final no servidor será o mesmo. Isso é especialmente útil em situações de falhas de rede, onde uma requisição pode ser enviada várias vezes. Métodos idempotentes garantem que o estado do servidor permaneça consistente, independentemente de quantas vezes a mesma operação é realizada.

/ Status code: ou códigos de status HTTP, são respostas numéricas de três dígitos que um servidor envia para indicar o resultado de uma requisição feita por um cliente. #funcs.foot-link("https://youtu.be/qmpUfWN7hh4", "HTTP Status Codes Explained In 5 Minutes
")

Eles são divididos em cinco categorias principais: 

1. Os códigos *`1xx`* indicam que a requisição foi recebida e está em processamento; 
2. Os *`2xx`* confirmam que a operação foi bem-sucedida, como o 200 (OK) ou 201 (Created); 
3. Os *`3xx`* indicam redirecionamento, como o 301 (Moved Permanently) ou 302 (Found); 
4. Os *`4xx`* sinalizam erros causados pelo cliente, como o 400 (Bad Request), 401 (Unauthorized), 403 (Forbidden) e 404 (Not Found); 
5. Os *`5xx`* indicam falhas internas do servidor, como o 500 (Internal Server Error) ou 503 (Service Unavailable). 

#figure(image("./img/404-not-found.png", width: 70%),caption: [Erro 404.])

Esses códigos ajudam clientes e desenvolvedores a entender o que ocorreu com a requisição, possibilitando reações apropriadas como reenvios, redirecionamentos ou exibição de mensagens de erro.

Para ver uma demonstração de todos esses conceitos em python veja @request[a seção]

O *versionamento de APIs*, é uma prática essencial para garantir que mudanças na API não afetem negativamente os sistemas que já a utilizam. À medida que uma API evolui, é comum que endpoints sejam modificados, parâmetros mudem ou funcionalidades antigas sejam descontinuadas. Sem versionamento, qualquer alteração pode quebrar o funcionamento de aplicações clientes, causando erros e exigindo ajustes imediatos. Para evitar isso, versionar permite manter múltiplas versões da API ativas ao mesmo tempo, oferecendo estabilidade para quem consome os serviços. Há formas de fazer esse versionamento: 
- pela URI (como `/api/v1/orders`), que é a forma mais comum e de fácil identificação; 
- por parâmetros de consulta (exemplo: `/api/orders?version=1`), menos usada e menos amigável a caches; 
- e por cabeçalhos HTTP personalizados, como `Accept: application/vnd.myapi.v2+json`, que mantém a URL limpa e é considerada mais alinhada ao estilo REST, mas tem menor suporte por ferramentas simples. 

/ Swagger: é uma ferramenta que facilita a documentação e o teste de APIs REST, permitindo que desenvolvedores descrevam suas APIs de forma padronizada usando o formato OpenAPI. Com isso, é possível gerar automaticamente uma interface visual interativa, onde é possível ver os endpoints disponíveis, os parâmetros esperados e até testar as requisições diretamente no navegador. Isso ajuda tanto no desenvolvimento quanto na comunicação entre equipes. #funcs.foot-link("https://youtu.be/7LQrTQTS_R0", "What is Swagger? | Swagger Introduction For Beginners")

#figure(image("./img/swagger-ui.png", width: 80%),caption: [Interface gráfica do Swagger.])

Imagine uma equipe de back-end desenvolvendo uma API e outra de front-end precisando consumi-la ao mesmo tempo. Sem uma documentação de API a comunicação entre as equipes seria confusa e cheia de erros. Com o Swagger, a equipe de front-end pode visualizar todos os endpoints, parâmetros e respostas diretamente em uma interface interativa no navegador, além de poder testar as chamadas da API sem escrever código. Isso agiliza o desenvolvimento, evita retrabalho e melhora a colaboração entre times.

=== 4 Níveis de Maturidade

Os 4 níveis de maturidade de uma API REST foram propostos por Leonard Richardson e representam um modelo progressivo que mostra o quanto uma API realmente adere aos princípios REST.

#table(
  columns: 2,
  table.header(
    [Nível],
    [Característica principal],
  ),
  [0],
  [Transporte via HTTP], 
  [1],
  [Recursos com URIs],
  [2],
  [Uso correto de verbos HTTP],
  [3],
  [HATEOAS]
)
- O *nível 0* é o mais básico, onde a API usa o protocolo HTTP apenas como um meio de transporte, sem aproveitar seus recursos — as requisições geralmente são feitas para uma única URL e toda a lógica é definida no corpo da mensagem, o que se assemelha a chamadas RPC. 
- No *nível 1*, a API começa a utilizar recursos identificáveis por URIs distintas, ou seja, diferentes partes do sistema (como pedidos, clientes, produtos) são acessadas por diferentes URLs, facilitando a organização e estrutura da aplicação. 
- O *nível 2* acrescenta o uso correto dos verbos HTTP, como GET, POST, PUT e DELETE, permitindo que a API se beneficie da semântica do próprio protocolo para definir as ações realizadas sobre os recursos. 
- Já o *nível 3*, o mais avançado, introduz o conceito de *HATEOAS* (_Hypermedia as the Engine of Application State_), onde a própria resposta da API inclui links que guiam o cliente sobre quais ações ele pode realizar a seguir, sem depender de conhecimento prévio sobre a estrutura da aplicação. Cada nível representa um passo rumo a uma API mais padronizada, intuitiva, reutilizável e fácil de evoluir.

A maioria das APIs hoje está no nível 2: usa URLs organizadas por recursos e os verbos HTTP corretos. Ignoram o nível 3 (HATEOAS), preferindo documentar rotas (swagger) em vez de gerar links dinamicamente.

Isso ocorre pois implementar HATEOAS requer que o servidor inclua links hipermídia dinâmicos em cada resposta, o que aumenta a complexidade do desenvolvimento, documentação e manutenção da API, além de potencialmente elevar o tráfego de dados e os custos de processamento em sistemas de alta demanda. Embora seja parte da definição original de REST, não existe um padrão amplamente aceito para sua implementação, dificultando a integração com ferramentas e bibliotecas populares que não oferecem suporte nativo a hipermídia. Na prática, os clientes costumam conhecer a estrutura da API por meio de documentação, preferindo controlar a navegação por conta própria, tornando HATEOAS redundante ou confuso em muitos casos.

#figure(image("./img/APIs.png", width: 95%),caption: [Funcionamento de API RESTful.])





#pagebreak()

= Python

Python é uma linguagem de programação amplamente utilizada no desenvolvimento de APIs e microsserviços devido à sua simplicidade, legibilidade e vasto ecossistema de bibliotecas. 

Abaixo a explicação dos conceitos é feita em maior parte em códigos. É importante que você faça os exercícios em código para internalizar os conceitos (seja no Google Colab, Jupyter Notebook ou de outra forma). 

Referências. #funcs.foot-link("https://learnxinyminutes.com/pt-br/python/", "Aprenda X em Y Minutos") | #funcs.foot-link("https://dn790001.ca.archive.org/0/items/FundamentosDoPensamentoAlgortmico_201811/Fundamentos%20do%20Pensamento%20Algor%C3%ADtmico.pdf", "Fundamentos do Pensamento Algorítmo - Natanale Antonioli")

== Básico

```python
# Comentários em uma única linha começam com uma cerquilha (também conhecido por sustenido).

""" Strings de várias linhas podem ser escritas
    usando três ", e são comumente usadas
    como comentários.
"""
```

```python
# Matemática é como você espera que seja
1 + 1   # 2
8 - 1   # 7
10 * 2  # 20
3 ** 2 # 9 (exponenciação)
5 // 2 # 2 (divisão inteira)
5 % 2 # 1 (resto)
```

=== Operadores Relacionais

```python
2 > 3 # False
2 < 3 # True
2 >= 2 # True
4 <= 3 # False
3 == 3 # True
4 != 4 # False
```
=== Operadores Lógicos

```python
not True # False
True and False # False
True or False # True
```

=== Variáveis, `print` e `input`

```python
alguma_variavel = "Python"

# Python tem uma função print
print("Eu sou o", alguma_variavel, ", Prazer em conhecer!") 
# Eu sou o Python , Prazer em conhecer!

# Forma simples para capturar dados de entrada via console
input_string_var = input("Digite alguma coisa: ") # Retorna o que foi digitado em uma string
```
=== Strings

```python
# Strings são criadas com " ou '
"Isto é uma string."
'Isto também é uma string.'

# Strings também podem ser somadas!
"Olá " + "mundo!"  # => "Olá mundo!"
# Strings podem ser somadas sem usar o '+'
"Olá " "mundo!"    # => "Olá mundo!"

# Uma string pode ser manipulada como se fosse uma lista de caracteres
"Isso é uma string"[0]  # => 'I'

# .format pode ser usado para formatar strings, dessa forma:
"{} podem ser {}".format("Strings", "interpoladas")  # => "Strings podem ser interpoladas"

# Você pode repetir os argumentos para digitar menos.
"Seja ágil {0}, seja rápido {0}, salte sobre o {1} {0}".format("Jack", "castiçal")
# => "Seja ágil Jack, seja rápido Jack, salte sobre o castiçal Jack."

# Você pode usar palavras-chave se quiser contar.
"{nome} quer comer {comida}".format(nome="Beto", comida="lasanha")  # => "Beto quer comer lasanha"
```

=== Controle de fluxo

```python
some_var = 5

if some_var > 10:
    print(some_var," é absolutamente maior que 10.")
elif some_var < 10:    # Esta cláusula elif é opcional.
    print(some_var," é menor que 10.")
else:                  # Isto também é opcional.
    print(some_var," é, de fato, 10.")
# 5  é menor que 10.
```

=== Repetição, `range`

```python

# Laços for iteram sobre listas

for animal in ["cachorro", "gato", "rato"]:
    # Você pode usar format() para interpolar strings formatadas
    print("{} é um mamífero".format(animal))

# range(número) retorna um iterável de números de zero até o número escolhido

for i in range(4):
    print(i)

# range(menor, maior)" gera um iterável de números começando pelo menor até o maior

for i in range(4, 8):
    print(i)

# range(menor, maior, passo)" retorna um iterável de números começando pelo menor número até o maior númeno, pulando de passo em passo. Se o passo não for indicado, o valor padrão é um.

for i in range(4, 8, 2):
    print(i)

# Laços while executam até que a condição não seja mais válida (False)

x = 0
while x < 4:
    print(x)
    x += 1  # Maneira mais curta para for x = x + 1

# O break interrompe completamente um laço (for ou while) antes que ele termine naturalmente.

for numero in range(1, 11):
    if numero == 5:
        break
    print(numero)

# O continue pula a iteração atual e vai para a próxima do laço, sem executar o que vem depois dele naquela rodada.

for numero in range(1, 6):
    if numero == 3:
        continue
    print(numero)
```

=== Funções
```python
# Use "def" para criar novas funções.
def add(x, y):
    print("x é {} e y é {}".format(x, y))
    return x + y  # Retorne valores com a cláusula return

# Chamando funções com parâmetros
add(5, 6)

'''
x é 5 e y é 6
11
'''
```
=== Módulos

```python
# Você pode importar módulos
import math
print(math.sqrt(16))  # => 4.0

# Você pode importar apenas funções específicas de um módulo
from math import ceil, floor
print(ceil(3.7))   # => 4.0
print(floor(3.7))  # => 3.0

# Você pode importar todas as funções de um módulo para o namespace atual
# Atenção: isso não é recomendado
from math import *

# Você pode encurtar o nome dos módulos
import math as m
math.sqrt(16) == m.sqrt(16)  # => True

# Módulos python são apenas arquivos python comuns. Você pode escrever os seus, e importá-los. O nome do módulo é o mesmo nome do arquivo.

# Importando funções do arquivo operacoes.py

# Opção 1: importa tudo do módulo
import operacoes

print(operacoes.somar(5, 3))      # => 8
print(operacoes.subtrair(10, 4))  # => 6

# Opção 2: importa funções específicas
from operacoes import somar

print(somar(7, 2))  # => 9
# subtrair não está disponível aqui, a menos que também seja importada

# Opção 3: importa com apelido
import operacoes as op

print(op.somar(1, 1))  # => 2
```

=== `Request` <request>

Requisição à API ViaCEP que deve retornar os dados de um cep, como logradouro, cidade, bairro e estado:

> `request.py`
```python
import requests

# CEP de exemplo
cep = '02211050'
url = f'https://viacep.com.br/ws/{cep}/json/' # url base

response = requests.get(url) # envia a requisição, salvando resposta em variável

if response.status_code == 200: # verifica se a status code foi 200 (OK).
    dados = response.json() # transforma o JSON da resposta em um dicionário Python.
    if 'erro' in dados: # A chave 'erro' no JSON indica que o CEP não foi encontrado.
        print("CEP não encontrado.")
    else:
        print(f"Logradouro: {dados['logradouro']}")
        print(f"Bairro: {dados['bairro']}")
        print(f"Cidade: {dados['localidade']}")
        print(f"Estado: {dados['uf']}")
else:
    print(f"Erro ao consultar o CEP. Código HTTP: {response.status_code}")
```
Execute com `python request.py`

== Estruturas de dados
Em Python, as estruturas de dados são maneiras de organizar e armazenar dados de forma eficiente. 
#table(
  columns: (auto, 1fr, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [*Tipo*], [*Descrição*], [*Mutável?*],
  ),
  [@list[`List`]], 
  [Coleção ordenada de elementos que permite duplicatas e é mutável.], 
  [Sim],

  [@tuple[`Tuple`]], 
  [Coleção ordenada de elementos imutável que permite duplicatas.], 
  [Não],

  [@set[`Sets`]], 
  [Coleção não ordenada de elementos únicos que não permite duplicatas e é mutável.], 
  [Sim],

  [@dict[`Dict`]], 
  [Coleção de pares chave-valor, onde as chaves são únicas e os valores podem ser duplicados, e é mutável.], 
  [Sim],
)

=== Listas <list>

Uma lista é uma coleção ordenada de elementos que pode conter itens de diferentes tipos.
- Sintaxe: Criada usando colchetes, por exemplo: `minha_lista = [1, 2, 3, "quatro"]`.
- Mutabilidade: As listas são mutáveis, ou seja, você pode alterar, adicionar ou remover elementos após a criação.
- Duplicatas: Permite elementos duplicados.
- Acesso: Os elementos podem ser acessados por índice.

#v(1em)

```python
li = []
# Você pode iniciar uma lista com valores
outra_li = [4, 5, 6]

# Adicione conteúdo ao fim da lista com append
li.append(1)    # li agora é [1]
li.append(2)    # li agora é [1, 2]
li.append(4)    # li agora é [1, 2, 4]
li.append(3)    # li agora é [1, 2, 4, 3]
# Remova do final da lista com pop
li.pop()        # => 3 e agora li é [1, 2, 4]
# Vamos colocá-lo lá novamente!
li.append(3)    # li agora é [1, 2, 4, 3] novamente.

# Acesse uma lista da mesma forma que você faz com um array
li[0]   # => 1
# Acessando o último elemento
li[-1]  # => 3

# Acessar além dos limites gera um IndexError
li[4]  # Gera o IndexError

# Você pode acessar vários elementos com a sintaxe de limites
# Inclusivo para o primeiro termo, exclusivo para o segundo
li[1:3]   # => [2, 4]
# Omitindo o final
li[2:]    # => [4, 3]
# Omitindo o início
li[:3]    # => [1, 2, 4]
# Selecione cada segunda entrada
li[::2]   # => [1, 4]

del li[2]  # li agora é [1, 2, 3]

# Você pode somar listas
# Observação: valores em li e other_li não são modificados.
li + other_li  # => [1, 2, 3, 4, 5, 6]

# Concatene listas com "extend()"
li.extend(other_li)  # Agora li é [1, 2, 3, 4, 5, 6]

# Verifique se algo existe na lista com "in"
1 in li  # => True

# Examine  tamanho com "len()"
len(li)  # => 6
```

=== Tuplas <tuple>
Uma tupla é semelhante a uma lista, mas é imutável.
- Sintaxe: Criada usando parênteses, por exemplo: `minha_tupla = (1, 2, 3, "quatro")`.
- Mutabilidade: As tuplas são imutáveis, ou seja, não podem ser alteradas após a criação.
- Duplicatas: Permite elementos duplicados.
- Acesso: Os elementos podem ser acessados por índice.
#v(1em)

```python
# Tuplas são como l istas, mas imutáveis.
tup = (1, 2, 3)
tup[0]      # => 1
tup[0] = 3  # Gera um TypeError

# Observe que uma tupla de tamanho um precisa ter uma vírgula depois do
# último elemento mas tuplas de outros tamanhos, mesmo vazias, não precisa,.
type((1))   # => <class 'int'>
type((1,))  # => <class 'tuple'>
type(())    # => <class 'tuple'>

# Você pode realizar com tuplas a maior parte das operações que faz com listas
len(tup)         # => 3
tup + (4, 5, 6)  # => (1, 2, 3, 4, 5, 6)
tup[:2]          # => (1, 2)
2 in tup         # => True

# Você pode desmembrar tuplas (ou listas) em variáveis.
a, b, c = (1, 2, 3)  # a é 1, b é 2 e c é 3
# Por padrão, tuplas são criadas se você não coloca parêntesis.
d, e, f = 4, 5, 6
```

=== Sets <set>
Um conjunto é uma coleção não ordenada de elementos únicos.
- Sintaxe: Criado usando chaves, por exemplo: `meu_conjunto = {1, 2, 3, 4}`.
- Mutabilidade: Os conjuntos são mutáveis, mas não podem conter elementos duplicados.
- Duplicatas: Não permite elementos duplicados.
- Acesso: Não suporta acesso por índice, pois não é ordenado.

#v(1em)

```python 
# Armazenamento em sets... bem, são conjuntos
empty_set = set()
# Inicializa um set com alguns valores. Sim, ele parece um dicionário. Desculpe.
some_set = {1, 1, 2, 2, 3, 4}  # some_set agora é {1, 2, 3, 4}

# Inclua mais um item no set
filled_set.add(5)  # filled_set agora é {1, 2, 3, 4, 5}

# Faça interseção de conjuntos com &
other_set = {3, 4, 5, 6}
filled_set & other_set  # => {3, 4, 5}

# Faça união de conjuntos com |
filled_set | other_set  # => {1, 2, 3, 4, 5, 6}

# Faça a diferença entre conjuntos com -
{1, 2, 3, 4} - {2, 3, 5}  # => {1, 4}

# Verifique a existência em um conjunto com in
2 in filled_set   # => True
10 in filled_set  # => False
```

=== Dicionários <dict>
Um dicionário é uma coleção de pares chave-valor.
- Sintaxe: Criado usando chaves, por exemplo: `meu_dict = {"nome": "João", "idade": 30}`.
- Mutabilidade: Os dicionários são mutáveis, permitindo a adição, remoção e alteração de pares chave-valor.
- Duplicatas: As chaves devem ser únicas, mas os valores podem ser duplicados.
- Acesso: Os valores são acessados por suas chaves, não por índice.

#v(1em)

```python 
# Dicionários armazenam mapeamentos
empty_dict = {}
# Aqui está um dicionário preenchido na definição da referência
filled_dict = {"um": 1, "dois": 2, "três": 3}

# Observe que chaves para dicionários devem ser tipos imutáveis. Isto é para
# assegurar que a chave pode ser convertida para uma valor hash constante para
# buscas rápidas.
# Tipos imutáveis incluem inteiros, flotas, strings e tuplas.
invalid_dict = {[1,2,3]: "123"}  # => Gera um TypeError: unhashable type: 'list'
valid_dict = {(1,2,3):[1,2,3]}   # Já os valores, podem ser de qualquer tipo.

# Acesse valores com []
filled_dict["um"]  # => 1

# Acesse todas as chaves como um iterável com "keys()". É necessário encapsular
# a chamada com um list() para transformá-las em uma lista. Falaremos sobre isso
# mais adiante. Observe que a ordem de uma chave de dicionário não é garantida.
# Por isso, os resultados aqui apresentados podem não ser exatamente como os
# aqui apresentados.
list(filled_dict.keys())  # => ["três", "dois", "um"]


# Acesse todos os valores de um iterável com "values()". Novamente, é
# necessário encapsular ele com list() para não termos um iterável, e sim os
# valores. Observe que, como foi dito acima, a ordem dos elementos não é
# garantida.
list(filled_dict.values())  # => [3, 2, 1]

# Verifique a existência de chaves em um dicionário com "in"
"um" in filled_dict  # => True
1 in filled_dict      # => False

# Acessar uma chave inexistente gera um KeyError
filled_dict["quatro"]  # KeyError

# Use o método "get()" para evitar um KeyError
filled_dict.get("um")      # => 1
filled_dict.get("quatro")     # => None
# O método get permite um parâmetro padrão para quando não existir a chave
filled_dict.get("um", 4)   # => 1
filled_dict.get("quatro", 4)  # => 4

# "setdefault()" insere em dicionário apenas se a dada chave não existir
filled_dict.setdefault("cinco", 5)  # filled_dict["cinco"] tem valor 5
filled_dict.setdefault("cinco", 6)  # filled_dict["cinco"] continua 5

# Inserindo em um dicionário
filled_dict.update({"quatro":4})  # => {"um": 1, "dois": 2, "três": 3, "quatro": 4}
#filled_dict["quatro"] = 4        #outra forma de inserir em um dicionário

# Remova chaves de um dicionário com del
del filled_dict["um"]  # Remove a chave "um" de filled_dicts
```

== POO
/ POO: ou programação orientada a objetos, é um paradigma de programação que organiza o código imitando o mundo real. Em vez de escrever funções isoladas e manipular variáveis soltas, você modela classes (moldes) que descrevem objetos (instâncias desses moldes) com atributos (dados) e métodos (comportamentos).#footnote[ #link("https://youtu.be/pbb0jzXt_xA")[Programação Orientada a Objetos | Explicação Simples]] | #footnote[ #link("https://youtu.be/97A_Cyyh-eU")[Como Funcionam Classes e Programação Orientada a Objetos em Python - Aprenda em 10 Minutos!]]

As vantagens principais são:
- *Encapsulamento*: protege dados internos através de modificadores como public, protected e private;
- *Herança*: permite que classes compartilhem lógica comum;
- *Polimorfismo*: possibilita que classes tenham métodos com o mesmo nome, mas comportamentos diferentes dependendo do contexto
- *Abstração*: permite esconder detalhes complexos e mostrar apenas o que é essencial, facilitando o uso e a manutenção do código, permitindo controlar o acesso aos atributos, escondendo detalhes internos e protegendo os dados.


```python
class ContaBancaria:
    def __init__(self, titular, saldo=0):
        self.titular = titular
        self.saldo = saldo

    def depositar(self, valor):
        if valor > 0:
            self.saldo += valor
            print(f"Depósito de R${valor} feito por {self.titular}.")
        else:
            print("Valor de depósito inválido.")

    def sacar(self, valor):
        if valor <= self.saldo:
            self.saldo -= valor
            print(f"Saque de R${valor} realizado por {self.titular}.")
        else:
            print(f"Saldo insuficiente para {self.titular}.")

    def exibir_saldo(self):
        print(f"{self.titular} tem R${self.saldo} na conta.")


# Criando objetos (contas)
conta1 = ContaBancaria("Alice", 1000)
conta2 = ContaBancaria("Bob", 500)

# Operações
conta1.depositar(200)
conta1.sacar(150)
conta1.exibir_saldo()

conta2.sacar(700)
conta2.exibir_saldo()
```
#pagebreak() 
= Flask
/ Flask: é um microframework para desenvolvimento web em Python, criado por Armin Ronacher em 2010. Ele é leve e flexível, permitindo que os desenvolvedores construam aplicações web de forma rápida, sem impor uma estrutura rígida. É indicado para criar APIs, aplicações web simples e protótipos, sendo especialmente útil em projetos que não requerem a complexidade de frameworks maiores, como Django. Sua extensibilidade permite adicionar funcionalidades conforme necessário, tornando-o uma escolha popular para desenvolvedores que buscam simplicidade e personalização.

/ Framework: é uma estrutura de software que fornece um conjunto de ferramentas, bibliotecas e convenções para facilitar o desenvolvimento de aplicações. Ele estabelece uma base imposta sobre a qual os desenvolvedores podem construir, tendo funcionalidades pré-definidas. Exemplo: Django.

/ Micro-Framework: é uma versão mais leve e simplificada de um framework tradicional. Ele oferece funcionalidades básicas e essenciais, permitindo que escolham de bibliotecas adicionais conforme necessário. Isso faz com que que os desenvolvedores criem aplicações de forma rápida e com menos complexidade, sendo ideais para projetos menores ou para desenvolvedores que desejam mais controle sobre a estrutura da aplicação, sem as imposições de um framework completo.

== Python Virtual Environments
/ _Python Virtual Environments_: ou Ambientes Virtuais Python são ferramentas que permitem criar ambientes isolados para projetos em Python. Isso significa que cada projeto pode ter suas próprias versões de pacotes e dependências, sem interferir em outros projetos ou no Python instalado globalmente no sistema. #funcs.foot-link("https://youtu.be/Y21OR1OPC9A", "Python Virtual Environments - Full Tutorial for Beginners")

Esses ambientes são úteis para evitar conflitos entre bibliotecas, garantir que um projeto funcione com versões específicas e manter o sistema organizado. Sem ambientes virtuais, haveria conflito de versões de bibliotecas, bagunça no sistema, e dificuldades para colaborar ou fazer deploy. Com eles, cada projeto funciona em uma “bolha” independente, tornando o desenvolvimento mais estável e profissional.

Os ambientes virtuais funcionam dentro da pasta onde foram criados, e para usá-los, normalmente você precisa estar dentro da pasta do projeto. Uma vez ativado, o terminal entra naquele ambiente, e você pode instalar ou rodar tudo isoladamente.

/ PIP: ou _Pip Installs Packages_ é o gerenciador de pacotes oficial do Python, usado para instalar, atualizar e remover bibliotecas e módulos disponíveis no repositório PyPI (Python Package Index) com um simples comando como por exemplo `pip install nome-do-pacote`.

```bash
# Criar ambiente virtual
python -m venv nome_do_ambiente

# ativar o ambiente em linux
nome_do_ambiente/bin/Activate 
#ou 
.\nome_do_ambiente\bin\Activate

# ativar o ambiente em windows (CMD)
.\nome_do_ambiente\Scripts\activate

# Com o ambiente ativado, use:
pip install nome_do_pacote

# desativa o ambiente
deactivate

# para excluir o ambiente apenas delete a pasta do ambiente virtual
rm -rf nome_do_ambiente # linux
rmdir /s /q nome_do_ambiente # windows

# Para instalar o flask dentro do ambiente python ativo:
pip install flask
```

== `requirements.txt`

O *`requirements.txt`* é um arquivo de texto que lista todas as dependências (bibliotecas) necessárias para um projeto Python funcionar corretamente, geralmente com as versões específicas usadas. Ele é essencial para compartilhar o ambiente do projeto com outras pessoas ou para fazer deploy em servidores, garantindo que todos usem os mesmos pacotes. O comando `pip freeze > requirements.txt` cria esse arquivo.

Quando o arquivo requirements.txt já existe e você executa o comando `pip freeze > requirements.txt`, o conteúdo anterior do arquivo é sobrescrito. Isso significa que a lista de bibliotecas e suas versões que estava no arquivo será substituída pela nova lista gerada pelo comando pip freeze, refletindo o estado atual das bibliotecas instaladas no ambiente Python.

Ao mover o projeto para um novo ambiente, com o ambiente virtual ativado, use o seguinte comando para instalar as dependências listadas no requirements.txt: `pip install -r requirements.txt`

== API básica

Criação de endpoint (conforme teoria na @api_def[seção]). Abaixo há um exemplo de uma API básica usando o framework Flask em Python:

> `app.py`
```python
from flask import Flask, jsonify # Importa o Flask e a função jsonify, que converte dicionários Python em JSON (formato usado em APIs).
app = Flask(__name__) # O argumento __name__ indica ao Flask onde está o ponto de entrada da aplicação.

@app.route('/users', methods=['GET']) # Define uma endpoint da aplicação: Quando o navegador ou cliente acessar o caminho /users usando o método HTTP GET, a função getUsers será chamada.

def getUsers(): # Função que será executada quando a rota /users for acessada com GET
    dados = { 'mensagem': 'OLA MUNDO!'} # Cria um dicionário dados com uma mensagem.
    return jsonify(dados) # Usa jsonify para transformar esse dicionário em uma resposta JSON, que será enviada para o cliente.

if __name__ == '__main__': # Verifica se o arquivo está sendo executado diretamente (e não importado)
    app.run(debug=True) #  inicia o servidor Flask em modo debug: Isso permite ver erros mais detalhados no navegador. O servidor reinicia automaticamente se o código for alterado.
```

Ao executar `python app.py` esse código entra em execução. Acesso a url informada em execução: `Running on http://127.0.0.1:5000` ou algo parecido e adicione `/users` no final, ficando `http://127.0.0.1:5000/users`. Ao fazer isso a mensagem `OLA MUNDO!` é exibida em json.

O endereço `http://127.0.0.1:5000/` retorna "Not Found" porque sua aplicação Flask só define a rota `/users`, e não há nenhuma rota associada à raiz (`/`). Para que algo apareça ali, seria necessário adicionar uma rota específica para `/` no código.

Código sem comentários:

> `app.py`
```python
from flask import Flask, jsonify
app = Flask(__name__)

@app.route('/users', methods=['GET'])

def getUsers():
    dados = { 'mensagem': 'OLA MUNDO!'}
    return jsonify(dados)

if __name__ == '__main__':
    app.run(debug=True)
```









