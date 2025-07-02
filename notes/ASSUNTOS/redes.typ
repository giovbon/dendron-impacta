#import "funcs.typ"

#let introducao_redes = [
= Introdução a Redes de Computadores

#figure(image("img/elem-comunica.png", width: 60%),caption: [Cinco elementos (mensagem, transmissor, receptor, meio e protocolo) de um sistema básico de comunicação de dados, que não é restrito à internet])

/ Redes de computadores: são sistemas que conectam dois ou mais dispositivos para compartilhar dados e recursos, como arquivos, impressoras e acesso à internet. Essas conexões podem ser feitas por cabos, ondas de rádio ou outros meios, permitindo a comunicação entre máquinas de forma rápida e eficiente. As redes variam em tamanho e alcance, desde redes locais (LANs) até redes globais como a internet.

/ Pacotes: são unidades menores em que os dados são divididos para serem transmitidos pela internet. Cada pacote contém parte da informação original, além de dados de controle, como endereços de origem e destino. Eles viajam separadamente pela rede, podendo seguir rotas diferentes, e são reorganizados no destino para reconstruir a mensagem completa. Esse processo permite uma comunicação mais eficiente e confiável, mesmo em redes complexas e congestionadas.

/ Protocolos: são conjuntos de regras que definem como os dispositivos de uma rede devem se comunicar. Eles padronizam a forma como os dados são formatados, enviados, recebidos e interpretados, garantindo que sistemas diferentes consigam trocar informações corretamente. Sem protocolos, a comunicação na internet seria desorganizada e ineficiente.

/ TCP: (_Transmission Control Protocol_) é responsável por garantir uma comunicação confiável entre dois dispositivos na internet. Ele estabelece uma conexão antes da troca de dados, verifica se os pacotes chegaram corretamente e na ordem certa, e retransmite os que forem perdidos. Além disso, controla o fluxo e o congestionamento da rede, assegurando que a transmissão ocorra de forma estável e segura. É usado em aplicações como navegadores, e-mails e transferências de arquivos.

As principais *topologias de redes incluem* a topologia em *barramento*, onde todos os dispositivos estão conectados a um único cabo, facilitando a instalação, mas tornando a rede vulnerável a falhas no cabo principal. Na topologia em *estrela*, os dispositivos se conectam a um ponto central, o que facilita o gerenciamento, mas torna a rede dependente desse ponto. A topologia em *anel* conecta cada dispositivo a dois outros, permitindo um desempenho consistente, mas podendo ser afetada por falhas em um único dispositivo. A topologia em *malha* oferece alta redundância e confiabilidade, pois cada dispositivo se conecta a vários outros, embora seja mais complexa e cara. Por fim, a topologia *híbrida* combina diferentes topologias, proporcionando flexibilidade e escalabilidade, mas pode ser complexa de gerenciar. A escolha da topologia depende das necessidades específicas da rede.

Os meios físicos se enquadram em duas categorias: meios guiados e meios não guiados. Nos meios guia­ dos, as ondas são dirigidas ao longo de um meio sólido, tal como um cabo de fibra ótica, um par de fios de cobre trançado ou um cabo coaxial. Nos meios não guiados, as ondas se propagam na atmosfera e no espaço, como é o caso de uma LAN sem fio ou de um canal digital de satélite.

Os meios de *transmissão em redes* de computadores incluem cabos de cobre, fibra óptica e transmissão sem fio. Os *cabos de cobre*, como o *par trançado* e o *coaxial*, são amplamente utilizados devido ao seu custo acessível e facilidade de instalação, mas têm limitações em termos de distância e interferência. A *fibra óptica*, por outro lado, utiliza luz para transmitir dados, oferecendo alta velocidade e capacidade de transmissão em longas distâncias, além de ser imune a interferências eletromagnéticas, embora seu custo e complexidade de instalação sejam maiores. A *transmissão sem fio*, que inclui tecnologias como *Wi-Fi* e *Bluetooth*, proporciona mobilidade e facilidade de instalação, mas pode ser afetada por obstáculos físicos e interferências de outros dispositivos. Os meios de transmissão de dados em *redes móveis*, como 3G, 4G e 5G, são tecnologias sem fio que utilizam ondas de rádio para transmitir informações entre dispositivos móveis e torres de celular.

Mais recentemente há o Starlink é um sistema de *internet via satélite* criado pela SpaceX, que utiliza uma constelação de satélites em órbita baixa para fornecer conectividade em áreas remotas e rurais. Ao contrário das tecnologias móveis como 3G, 4G e 5G, que dependem de torres de celular, o Starlink transmite dados entre satélites e terminais na Terra, oferecendo altas velocidades de download e baixa latência.

A escolha do meio de transmissão depende das necessidades específicas da rede, como velocidade, distância e custo.

Os *tipos de redes* de computadores incluem LAN, WAN, MAN. 
- A *LAN* (_Local Area Network_) é uma rede que cobre uma área geográfica limitada, como uma residência ou escritório, permitindo alta velocidade de transmissão e baixo custo; exemplos incluem redes domésticas conectadas via cabos Ethernet ou Wi-Fi. 
- A *MAN* (_Metropolitan Area Network_) cobre uma área maior que uma LAN, mas menor que uma WAN, como uma cidade, e é frequentemente usada por empresas ou instituições para interconectar várias LANs; um exemplo seria uma rede que conecta diferentes filiais de uma empresa em uma área metropolitana.
- A *WAN* (_Wide Area Network_) abrange áreas geográficas extensas, conectando redes locais em diferentes cidades ou países, como a internet, que interliga diversas LANs ao redor do mundo. 

]


#let internet = [

== Internet
/ Internet: é a infraestrutura de uma rede global de computadores interconectados que trocam informações digitalizadas. Funciona com base em um conjunto de regras chamadas *protocolos*, que padronizam como os dados são enviados, roteados e recebidos. Dispositivos obtêm um endereço IP (Internet Protocol) que identifica unicamente cada nó na rede. #funcs.foot-link("https://youtu.be/AABqPceCwZk", "Como Funciona a Internet?")

- *Surface Web* é a parte da internet acessível por navegadores comuns e indexada por mecanismos de busca como Google. 
- *Deep Web* engloba conteúdos que não estão indexados, como bancos de dados acadêmicos, sistemas internos de empresas, e-mails, ou páginas protegidas por login — ou seja, não são necessariamente ilegais. 
- *Dark Web* é uma parte da Deep Web acessível apenas por tecnologias específicas, como a rede Tor (The Onion Router), que permite navegação anônima e criptografada. Nela, é comum encontrar fóruns, mercados ilegais, sendo muitas vezes associada a atividades ilegais justamente pela dificuldade de rastreamento e regulação (mas nem sempre, como o caso de jornalistas que a usam para comunicação de dados sensíveis). Também é comum o uso de criptomoedas, como Bitcoin, para garantir anonimato nas transações.
=== Linha do tempo da internet

- *(1969)* A ARPANET foi a primeira rede de computadores a implementar a comutação de pacotes, permitindo a comunicação entre diferentes sistemas. Criada pela DARPA, ela conectava universidades e centros de pesquisa nos EUA e tornou-se a base técnica da Internet moderna.
- *(1972)* Ray Tomlinson enviou o primeiro e-mail entre dois computadores conectados à ARPANET, utilizando o símbolo `@` para separar o nome do usuário do nome do computador. Isso revolucionou a comunicação digital. 
- *(1974)* Vint Cerf e Robert Kahn desenvolveram o protocolo TCP/IP, que permitiu a interconexão de diferentes redes, formando a base da internet como conhecemos hoje.
- *(1983)* Criado para traduzir endereços IP numéricos (difíceis de memorizar) em nomes amigáveis como “exemplo.com”, o Sistema de Nomes de Domínio (DNS) foi introduzido, tornando a navegação na internet mais amigável. 
  - Em 1° de janeiro de 1983, ocorre a migração do Network Control Protocol (NCP) para o padrão TCP/IP, idealizado por Vint Cerf e Bob Kahn, criando um protocolo universal que permitiu a interconexão de diversas redes. 
- *(1990)* Tim Berners-Lee desenvolveu a World Wide Web no CERN, criando um sistema de navegação baseado em hipertextos. Ele também criou o primeiro navegador e servidor web, facilitando o acesso à informação na internet. 
- *(1993)* Browsers gráficos como Mosaic popularizam o acesso, impulsionando o crescimento comercial da rede.
- *(1994)* Realizada a primeira compra segura usando SSL: um CD da banda Sting foi comprado pela NetMarket, demonstrando a viabilidade do e‑commerce seguro. 
- *(2000 >)* Nos anos 2000, a Internet migra para conexões de banda larga #footnote("Banda larga é um tipo de conexão à internet que permite transmitir grandes quantidades de dados rapidamente e de forma contínua. Ela é caracterizada por ser sempre ativa (não precisa “discá-la” como as antigas) e ter alta velocidade de download e upload, permitindo, por exemplo, ver vídeos, ouvir músicas e jogar online com qualidade. Antes da banda larga, o acesso à internet era feito principalmente por discagem telefônica (conhecida como internet discada ou dial-up)"), trazendo streaming, e‑mail robusto, rede sociais (Wikipedia, MySpace, Facebook), smartphones e tecnologias como Wi‑Fi, 3G e 5G – conectando bilhões globalmente.

]