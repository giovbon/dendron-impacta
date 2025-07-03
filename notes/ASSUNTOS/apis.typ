#import "funcs.typ"

#let REST = [

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

== 4 Níveis de Maturidade

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

Através dessa imagem pode-se dizer que uma API REST "descansa" (_rest_ em inglês significa descansar) até ser acionada por um cliente que solicita dados. Em uma arquitetura REST, a API permanece em um estado de espera, pronta para receber requisições HTTP. Quando um cliente faz uma solicitação, a API processa essa requisição e retorna a resposta apropriada. Esse modelo de operação é eficiente, pois a API não consome recursos desnecessariamente enquanto não está em uso, ativando-se apenas quando necessário.

]