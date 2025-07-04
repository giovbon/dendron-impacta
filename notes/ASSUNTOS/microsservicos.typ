

#let microsservicos = [
= Microsserviços <microsservices>

#figure(image("./img/mono-vs-microserv.jpg", width: 70%),caption: [Diferenças entre arquiteturas monolíticas e de microsserviços.])

/ Aplicações monolíticas: é um sistema construído como uma única base de código coesa, onde todos os módulos — interface, lógica de negócios e acesso a dados — estão integrados e implantados juntos. Todas as funcionalidades, mesmo que distintas, compartilham o mesmo banco de dados, servidor e ambiente, o que torna mais simples desenvolver e testar inicialmente, mas pode dificultar a escalabilidade, manutenção e implantação à medida que o sistema cresce. #footnote[#link("https://youtu.be/3fwRmW8pgWU")[Monólitos vs Microserviços | Explicado em 5 minutos]]

Uma das principais *vantagens* desse modelo é a facilidade no desenvolvimento inicial, o que o torna ideal para projetos pequenos ou MVPs (produtos mínimos viáveis). O processo de deploy é simples, já que toda a aplicação é empacotada em um único artefato, o que também reduz a complexidade operacional.

No entanto, à medida que a aplicação cresce, começam a surgir *desvantagens*. O sistema se torna mais difícil de manter, já que os módulos estão fortemente acoplados. Escalar uma funcionalidade específica exige escalar toda a aplicação, o que é ineficiente. Além disso, qualquer mudança ou falha em uma parte pode afetar o sistema inteiro, tornando os deploys mais arriscados. Por isso, aplicações monolíticas são mais apropriadas para sistemas menores, com equipes reduzidas e requisitos simples de operação.

/ Microsserviços: é uma arquitetura em que a aplicação é dividida em pequenos serviços independentes, cada um responsável por uma função específica do negócio. Esses serviços se comunicam geralmente por APIs (ver em @api_def[seção]) e podem ser desenvolvidos, implantados e escalados separadamente. Isso traz mais flexibilidade, resiliência e autonomia para as equipes, mas aumenta a complexidade da operação, exigindo boas práticas de monitoramento, comunicação e infraestrutura. #footnote[#link("https://youtu.be/lL_j7ilk7rc")[Microservices Explained in 5 Minutes]] | #footnote[#link("https://aws.amazon.com/pt/microservices/")[O que são microsserviços]]

Isso oferece *vantagens* importantes como a escalabilidade granular, permitindo que apenas partes específicas do sistema sejam escaladas conforme a demanda. Também aumenta a resiliência, pois uma falha em um serviço não compromete todo o sistema. Além disso, times podem trabalhar de forma autônoma em diferentes serviços, escolhendo tecnologias adequadas para cada contexto.

Os microserviços permitem o uso de uma arquitetura poliglota. Isso significa que você pode escolher a linguagem de programação ideal para cada parte do sistema. Talvez algo seja feito por uma equipe com boas habilidades em Go, então eles constroem esse serviço usando Go. E digamos que outro serviço já vem de um código legado em PHP que não se quer refatorar nem mexer, como resultado apenas é migrado esse código antigo. Assim, temos a vantagem de poder escolher a linguagem certa para cada parte do sistema.

Microserviços são ótimos para equipes ágeis. Quando falamos de CI/CD (integração e entrega contínuas), isso só é possível com uma arquitetura como essa. Com aplicações monolíticas, os ciclos eram muito mais longos, no estilo cascata (waterfall), com entregas em produção em períodos muito espaçados.

Com arquiteturas de microserviços, se houver um gargalo em algum lugar, por exemplo, no serviço de pagamento, pode-se escalá-lo de forma independente dos outros componentes. Isso torna os microserviços mais eficazes para eliminar gargalos e atender a requisitos de desempenho. E isso anda junto com a resiliência. Se um componente falhar, os usuários ainda podem acessar outras partes da aplicação. Talvez não consigam fazer pagamentos, mas ainda podem ver o catálogo. Em aplicações monolíticas, uma falha assim poderia derrubar tudo.

Entretanto, essa abordagem também traz *desafios*. A complexidade operacional cresce, exigindo ferramentas para orquestração, deploy contínuo, monitoramento, comunicação entre serviços e gerenciamento de falhas. A troca de dados entre os microsserviços pode introduzir latência e tornar mais difícil garantir a consistência das informações. Assim, os microsserviços são mais indicados para sistemas grandes, com múltiplos domínios de negócio, equipes maiores e necessidade de alta escalabilidade e independência entre os módulos. #footnote[ #link("https://aws.amazon.com/pt/compare/the-difference-between-monolithic-and-microservices-architecture/")[Qual é a diferença entre arquitetura monolítica e de microsserviços?]] 
]