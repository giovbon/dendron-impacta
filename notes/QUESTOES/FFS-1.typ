

#let todas_questoes = (
  (1, [
    Qual das alternativas abaixo melhor descreve a relação entre HTML, CSS e JavaScript no desenvolvimento web, e suas principais responsabilidades?
    #alternativas("HTML define a lógica de negócios, CSS cuida da interação do usuário e JavaScript estrutura o conteúdo.", "HTML é usado para estilizar elementos, CSS para manipulação do DOM e JavaScript para a estrutura semântica.", "HTML estrutura o conteúdo, CSS controla a apresentação visual e JavaScript adiciona interatividade e dinamismo.", "HTML gerencia a comunicação com o servidor, CSS armazena dados e JavaScript define o layout responsivo.", "HTML é uma linguagem de programação, CSS é um banco de dados e JavaScript é um framework de frontend.")
    // gab C
  ]),
  (2, [
    No contexto de um projeto web moderno, a utilização de frameworks ou bibliotecas como React, Angular e Vue.js no Frontend é amplamente difundida. Qual das alternativas abaixo apresenta a justificativa mais completa para a adoção dessas ferramentas, considerando os desafios que elas ajudam a resolver?
    #alternativas("Principalmente para substituir completamente o HTML, CSS e JavaScript, eliminando a necessidade de aprendizado dessas linguagens básicas.", "Para simplificar a estilização visual e o layout responsivo, tornando desnecessário o uso de CSS para projetos complexos.", "Para facilitar a manipulação de grandes volumes de dados no Backend e otimizar a comunicação com bancos de dados.", "Para gerenciar o estado da aplicação de forma eficiente, promover a reutilização de componentes, otimizar a performance em aplicações SPA (Single Page Applications) e agilizar o desenvolvimento de interfaces complexas.", "Exclusivamente para a criação de animações e efeitos visuais, sem impacto significativo na arquitetura ou na escalabilidade da aplicação.")
    //gab D
  ]),
  (3 ,[
    No React temos as props (ou propriedades), como no código exemplificativo abaixo:
    ```js
    function App() {
      return <Greeting name="Maria" />;
    }
    
    function Greeting(props) {
      return <h1>Olá, {props.name}!</h1>;
    }

    ```
    Qual é o propósito principal das "props" (propriedades) e como elas contribuem para a comunicação entre componentes?
  #alternativas("Props são usadas para armazenar o estado interno de um componente, permitindo que ele gerencie seus próprios dados.", "Props são uma forma de passar dados de um componente pai para um componente filho, garantindo um fluxo de dados unidirecional.", "Props são métodos que permitem a um componente filho modificar diretamente o estado de um componente pai.", "Props são exclusivas para a estilização de componentes, definindo suas cores e tamanhos.", "Props são eventos que os componentes podem disparar para notificar o componente pai sobre alguma ação.")
  //gab B
  ]),
  (4, [
    Qual é o nome da propriedade especial em React que permite que um componente receba outros elementos ou componentes aninhados dentro de suas tags de abertura e fechamento?
    #alternativas(`props`, `state`, `key`, `children`, `parent`)
    //gab D
  ]),
  (5, [
    No React, qual é a sintaxe especial que nos permite escrever código parecido com HTML dentro do JavaScript, como no exemplo: `const elemento = <h1>Olá, Mundo!</h1>;`
    #alternativas("JSX, uma extensão de sintaxe para JavaScript que se assemelha ao HTML para criar elementos de UI.", "Uma nova versão do HTML que permite lógica de programação.", "Um pré-processador de CSS que otimiza a estilização de componentes.", "Uma linguagem de script para o backend que gera HTML dinamicamente.", "Um formato de dados para comunicação entre o frontend e o backend.")
    //gab A
  ]),
  (6, [
    O que é "estado" no contexto do React, e qual é o Hook mais comum utilizado para gerenciamento desse estado?
    #alternativas("Uma variável global que pode ser acessada de qualquer lugar na aplicação, utilizando o hook useEffect", "Um estilo CSS aplicado a um componente, utilizando o hook useContext.", "Uma função que renderiza a interface do usuário, utilizando o hook useReducer.", "Um arquivo externo que armazena configurações da aplicação, utilizando o hook useCallback", "Um tipo de memória específica do componente para armazenar informações que podem mudar, utilizando o hook useState")
    //gab E
  ]),
  (7, [
    No React, um componente é fundamentalmente o quê, qual é a sua principal função e o que deve sempre retornar?
    #alternativas("É uma classe JavaScript que encapsula dados e comportamentos; sua principal função é manipular o DOM diretamente para otimizar o desempenho; e deve sempre retornar uma coleção de nós HTML.", "É um arquivo CSS que define estilos visuais para toda a aplicação; sua principal função é gerenciar o estado global da aplicação; e deve sempre retornar um objeto JavaScript com as propriedades de estilo.", "É um objeto JavaScript que representa um elemento HTML; sua principal função é conectar a aplicação a um banco de dados externo; e deve sempre retornar uma promessa assíncrona.", "É uma função JavaScript que combina lógica e estrutura; sua principal função é construir interfaces de usuário (UI) de forma modular e reutilizável; e deve sempre retornar um elemento único no retorno, que pode ser de qualquer tipo de dado aceito pelo JSX.", "É uma biblioteca de terceiros para validação de formulários; sua principal função é realizar requisições HTTP; e deve sempre retornar um valor booleano indicando sucesso ou falha.")
    //gab D
  ]),
  (8, [
    Analise os dois exemplos de código abaixo:
- Exemplo 1: `<button onClick={minhaFuncao}>Clique!</button>`
- Exemplo 2: `<button onClick={minhaFuncao()}>Clique!</button>`
Ao passar uma função como manipulador de eventos no React, qual dos exemplos acima representa a forma correta de fazê-lo?
#alternativas("Ambos os exemplos estão corretos e são intercambiáveis.", "O Exemplo 2 é o correto, pois a função é chamada diretamente.", "O Exemplo 1 é o correto, pois a função é passada como referência e não é chamada diretamente.", "A forma correta depende do tipo de evento que está sendo manipulado.", "Nenhum dos exemplos está correto; a função deve ser definida inline no onClick")
// gab C
  ]),
  (9, [
    No React, aprendemos que "informações que mudam dinamicamente são chamadas de estado". Também vimos que os "manipuladores de eventos são o melhor lugar para efeitos colaterais". Pensando nisso, como os eventos e o estado trabalham juntos para fazer a interface do seu aplicativo reagir às ações do usuário?
    #alternativas("Manipuladores de eventos disparam a atualização do estado do componente em resposta a uma interação do usuário, e é essa mudança de estado que o React utiliza para re-renderizar e atualizar a interface dinamicamente, demonstrando a reatividade.", "Eventos são usados exclusivamente para exibir dados, e o estado é manipulado apenas por funções fora dos componentes, sem relação com interações do usuário.", "O estado é alterado diretamente pelo navegador quando um evento ocorre, e o React apenas reflete essa mudança sem a necessidade de um manipulador de eventos.", "A reatividade no React é uma propriedade intrínseca dos componentes, independentemente da forma como eventos e estado são gerenciados.", "Efeitos colaterais em manipuladores de eventos referem-se apenas a operações de rede, e não à modificação do estado interno do componente.")
    //gab A
  ]),
  (10, [
    Qual a principal diferença na forma como o Next.js e o React se apresentam aos desenvolvedores?
    #alternativas("O React é um framework completo que já vem com roteamento e SSR pré-configurados, enquanto o Next.js é apenas uma biblioteca para criar componentes.", "O Next.js é uma biblioteca que disponibiliza ferramentas, e o React é um framework que oferece uma base estruturada para projetos.", "Ambos são frameworks, mas o Next.js é usado apenas para a parte visual da aplicação.", "O Next.js é um framework que oferece uma base estruturada para projetos React e já vem com funcionalidades pré-configuradas como roteamento, enquanto o React é uma biblioteca que disponibiliza ferramentas.", "Ambos são bibliotecas, mas o React é exclusivo para desenvolvimento mobile.")
    //gab D
  ]),
  (11,[
    No contexto do desenvolvimento Full Stack, qual a principal distinção entre o front-end e o back-end em termos de funcionalidade e responsabilidades?
    #alternativas("O front-end abrange a interface do usuário e as interações diretas, enquanto o back-end contém a lógica de execução da aplicação, integrações de dados e processamento.", "O front-end é responsável pela lógica de negócios e persistência de dados, enquanto o back-end lida apenas com a apresentação visual para o usuário.", "O back-end foca na interação direta com o usuário e na interface, e o front-end gerencia a comunicação com bancos de dados e outras aplicações.", "Ambos, front-end e back-end, são exclusivamente responsáveis pela manipulação do DOM e pela criação de animações em páginas web.", "O back-end é o único responsável por toda a lógica de negócio, persistência de dados e integrações com sistemas externos, mas o front-end possui a capacidade de alterar diretamente o esquema do banco de dados para otimizar o desempenho.")
    //gab A
  ]),
  (12, [
    O Flask é descrito como um "micro-framework". Qual característica principal de um micro-framework, em contraste com um framework abrangente, é enfatizada como um benefício para o desenvolvedor?
    #alternativas("Micro-frameworks são ideais para projetos de grande escala, pois oferecem uma vasta gama de funcionalidades pré-prontas que aceleram o desenvolvimento complexo.", "A principal vantagem de um micro-framework é sua capacidade de integração automática com qualquer banco de dados relacional, sem necessidade de configuração manual.", "Eles vêm com uma estrutura rígida e muitos componentes pré-definidos, o que é benéfico para iniciantes que precisam de um caminho claro a seguir.", "A principal característica é que micro-frameworks não utilizam nenhuma biblioteca externa, tornando as aplicações mais leves e independentes.", "Micro-frameworks são projetados para oferecer apenas o básico necessário para construir aplicações, concedendo ao desenvolvedor mais controle sobre as decisões de arquitetura e a manutenção de um código mais enxuto.")
    //gab E
  ]),
  (13, [
    Em um projeto Flask, os arquivos `config.py` e `requirements.txt` desempenham papéis distintos. Assinale a alternativa que descreve corretamente a função de cada um desses arquivos:
    #alternativas("O config.py é utilizado para listar as dependências do projeto, enquanto o requirements.txt é usado para armazenar configurações específicas da aplicação.", "O config.py contém as configurações da aplicação, como chaves secretas e configurações de banco de dados, enquanto o requirements.txt lista as bibliotecas necessárias para o funcionamento do projeto.", "O config.py é um arquivo de log que registra as atividades da aplicação, enquanto o requirements.txt é um arquivo de configuração para o servidor web.", "O config.py é utilizado para definir rotas da aplicação, enquanto o requirements.txt é usado para gerenciar as sessões de usuário.", "O config.py e o requirements.txt são intercambiáveis e podem ser usados para qualquer configuração ou dependência do projeto.")
    //gab B
  ]),
  (14, [
    Um Blueprint no Flask é uma ferramenta essencial para a organização de aplicações. Qual dos seguintes benefícios é diretamente proporcionado pela utilização de Blueprints?
    #alternativas("Simplificação da gestão de configurações centralizadas em um único arquivo.", "Exclusividade na inicialização do servidor Flask em ambiente de produção.", "Facilitação da modularidade e escalabilidade do código, dividindo a aplicação em componentes menores e mais gerenciáveis.", "Gerenciamento automático de dependências de pacotes Python.", "Proteção contra ataques de injeção de SQL.")
    // gab C
  ]),
  (15,[
    Qual das seguintes afirmações melhor descreve a principal diferença entre containers e máquinas virtuais?
    #alternativas("Containers utilizam um hypervisor para gerenciar a virtualização, enquanto máquinas virtuais compartilham o kernel do sistema operacional host.", "Máquinas virtuais são projetadas para eliminar o problema de incompatibilidade entre ambientes, diferentemente dos containers.", "Máquinas virtuais são leves e iniciam rapidamente, ao passo que containers executam um sistema operacional completo para cada aplicação.", "Containers compartilham o kernel do sistema operacional host e isolam apenas os processos necessários, enquanto máquinas virtuais executam um sistema operacional completo, incluindo kernel e hypervisor.", "Tanto containers quanto máquinas virtuais exigem a instalação de um novo sistema operacional completo para cada aplicação.")
    //gab D
  ]),
  (16, [
    Após iniciar um container, um usuário percebe que ele está com um nome aleatório e deseja parar e remover esse container. Qual sequência de comandos ele deve utilizar, considerando que o container é chamado "elastic_goldberg" e está em execução?
    #alternativas("`docker rm elastic_goldberg` seguido de `docker stop elastic_goldberg`", "`docker kill elastic_goldberg` seguido de `docker rmi elastic_goldberg`", "`docker stop elastic_goldberg` seguido de `docker rm elastic_goldberg`", "`docker pause elastic_goldberg` seguido de `docker rm elastic_goldberg`", "`docker rm -f elastic_goldberg`  (apenas um comando, pois já remove forçado)")
    //gab C
  ]),
  (17, [
    No contexto do Docker, os comandos `docker ps` e `docker stats` são utilizados para diferentes propósitos. Assinale a alternativa que descreve corretamente a função de cada um desses comandos:
    #alternativas("O comando docker ps exibe informações detalhadas sobre os contêineres em execução (porta, status, imagem usada), enquanto o docker stats fornece informações detalhadas sobre o uso de recursos dos contêineres em execução.", "O comando docker ps é utilizado para iniciar contêineres, enquanto o docker stats é usado para parar contêineres em execução.", "O comando docker ps lista as imagens disponíveis no sistema, enquanto o docker stats exibe o histórico de comandos executados.", "O comando docker ps mostra o uso de recursos dos contêineres em tempo real, enquanto o docker stats é usado para exibir informações detalhadas dos containers em execução (porta, status, imagem usada).", "O comando docker ps é utilizado para remover contêineres, enquanto o docker stats é usado para criar novas imagens.")
    //gab A

  ]),
  (18, [
    Qual das opções abaixo descreve corretamente as principais responsabilidades de cada componente no padrão MVC?
    #alternativas("O Model é responsável pela interface do usuário, a View gerencia a lógica de negócios e o Controller processa a interação com o banco de dados.", "O Model manipula os dados e a lógica de negócios , a View é encarregada de apresentar os dados ao usuário , e o Controller lida com as entradas do usuário, coordenando as ações entre Model e View.", "O Model apresenta os dados, a View controla o fluxo da aplicação e o Controller armazena as informações do banco de dados.", "O Controller é responsável pela interface do usuário, o Model processa as entradas do usuário e a View gerencia a lógica de negócios.", "O Model lida com a apresentação dos dados, a View gerencia a lógica de negócios e o Controller é responsável pela persistência dos dados.")
    //gab B
  ]),
  (19, [
    O que o acrônimo SGBD significa e qual é o seu papel fundamental no contexto dos bancos de dados?
    #alternativas("Sistema de Geração de Boletos Digitais; focado em transações financeiras.", "Serviço Global de Busca de Dados; utilizado para pesquisar informações em múltiplas fontes.", "Software de Grande Base de Dados; responsável por controlar grandes massas de informações.", "Sistema de Gerenciamento de Backup e Desempenho; focado em otimizar a performance de sistemas.", "Sistema Gerenciador de Banco de Dados; um software que permite aos usuários definir, criar, manter e controlar o acesso ao banco de dados. ")
  ]),
  //gab E
  (20, [
    Qual é o ciclo de desenvolvimento que o TDD (Desenvolvimento Orientado a Testes) propõe, e qual a ordem correta das suas fases?
    #alternativas("Código → Teste → Refatoração.", "Refatoração → Teste → Código.", "Planejamento → Teste → Implementação.", "Teste → Código → Refatoração.","Análise → Design → Implementação.")
  ])
  //gab D
)