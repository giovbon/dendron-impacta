#import "funcs.typ"

#let docker-container = [
= Docker

/ Virtualização: é a criação de uma versão virtual de um recurso computacional, como sistemas operacionais, servidores, armazenamento, redes ou aplicações, permitindo que múltiplos ambientes isolados rodem sobre o mesmo hardware físico. Ela permite que recursos físicos sejam divididos, abstraídos ou simulados para otimizar o uso, melhorar o isolamento, e aumentar a flexibilidade e escalabilidade dos sistemas.
/ Máquina Virtual: ou _Virtual Machine_ é um ambiente computacional simulado que emula um computador físico completo, incluindo processador, memória, disco, e interfaces de rede. Ela roda um sistema operacional próprio como se estivesse em um hardware real, mas na verdade está operando sobre um software chamado hipervisor, que gerencia e aloca os recursos do hardware físico para múltiplas VMs.
/ Hipervisor: é um software ou firmware que permite criar, executar e gerenciar máquinas virtuais (VMs). Ele atua como uma camada entre o hardware físico e as VMs, alocando recursos como CPU, memória, disco e rede para cada máquina virtual de forma isolada e controlada.
/ Container: é uma unidade leve e isolada que empacota uma aplicação junto com tudo o que ela precisa para funcionar (código, bibliotecas, dependências). Ele compartilha o mesmo kernel do sistema operacional host, sendo mais eficiente e rápido do que uma máquina virtual. Containers garantem que o software funcione da mesma forma em qualquer ambiente. #funcs.foot-link("https://youtu.be/0qotVMX-J5s", "Containerization Explained
")
/ Docker: é uma plataforma que automatiza a criação, o empacotamento e a execução de containers. Ele fornece ferramentas e comandos simples para que desenvolvedores possam construir ambientes isolados, portáteis e consistentes, facilitando o desenvolvimento, testes e deploy de aplicações.

A criação do Docker foi motivada pela necessidade de resolver o problema clássico de "na minha máquina funciona", ou seja, garantir que uma aplicação funcionasse da mesma forma em diferentes ambientes. Antes do Docker, virtualização com máquinas virtuais (VMs) era comum, mas essas VMs eram pesadas, lentas para iniciar e consumiam muitos recursos, pois cada uma precisava de um sistema operacional completo.

#figure(image("img/vms-vs-container.png", width: 90%),caption: [Comparação entre VMs e Containers])

Em 2013, Solomon Hykes e sua equipe na empresa dotCloud criaram o Docker, com o objetivo de facilitar o empacotamento, distribuição e execução de aplicações de forma leve e padronizada, usando a tecnologia de containers do Linux (como cgroups #footnote("Cgroups (control groups) permitem limitar e controlar o uso de recursos por grupos de processos, como por CPU, Memória (RAM), Disco e Rede"), namespaces #footnote("Namespaces criam ambientes isolados para processos, garantindo que cada container acredite estar rodando sozinho no sistema") e UnionFS #footnote("O Union File System age combinando várias camadas de sistema de arquivos em um só, de forma leve e rápida. Isso permite que as imagens dos containers sejam montadas em camadas reutilizáveis, economizando espaço e acelerando o deploy.")). A motivação era criar uma ferramenta simples e eficiente para desenvolvedores, que permitisse empacotar uma aplicação com tudo que ela precisa para rodar, isolada do sistema onde está sendo executada. Com o Docker, os containers passaram a ser mais acessíveis, rápidos e fáceis de usar, impulsionando a adoção em massa dessa tecnologia na indústria de software.

Containers são ideais para arquiteturas de microsserviços porque isolam cada serviço com suas próprias dependências, garantindo que rodem de forma independente e consistente. Eles são leves, portáteis e iniciam rapidamente, facilitando o desenvolvimento, implantação e escalabilidade individual dos microsserviços, o que aumenta a agilidade, flexibilidade e resiliência do sistema como um todo.

Arquitetura do Docker Desktop:

- Docker *Engine*: é a plataforma principal do Docker, composta pela CLI, pelo daemon e pelo runtime. Ele orquestra todo o processo de criação, gerenciamento e execução de containers. Embora não execute diretamente os containers, ele utiliza um runtime de containers compatível com OCI (como o runc) para isso.
  - Docker *CLI* (Command Line Interface): é a ferramenta de linha de comando usada pelos usuários para interagir com o Docker Engine. Permite executar comandos como criar imagens, iniciar containers e gerenciar volumes, redes e outros recursos.
  - Docker *Daemon* (dockerd): é o processo em segundo plano que recebe os comandos da CLI, gerencia containers, imagens, volumes e redes, e delega a execução de containers ao runtime (como runc).
  - *Runtime* de container: é o componente responsável por executar o processo do container em isolamento, utilizando recursos do kernel Linux como namespaces e cgroups. O Docker usa por padrão o runtime runc, que é compatível com o padrão OCI. Outros runtimes também podem ser utilizados, como crun, gVisor ou Kata Containers.

/ OCI: (_Open Container Initiative_) é um projeto aberto criado para definir padrões abertos e universais para containers e suas imagens. O objetivo da OCI é garantir que containers sejam interoperáveis entre diferentes ferramentas e plataformas, evitando vendor lock-in #footnote("Vendor lock-in é uma situação em que um cliente fica preso a um fornecedor específico de tecnologia, produto ou serviço, porque mudar para outra solução se torna muito difícil, caro ou arriscado."). Especificamente, a OCI padroniza dois principais aspectos: o formato da imagem de container, ou como a imagem deve ser construída e armazenada e o runtime de container, ou como o container deve ser executado no sistema. Assim, ferramentas como Docker, Podman #footnote("Podman é uma alternativa ao Docker para criar e gerenciar containers, destacando-se por não precisar de um daemon central e por permitir executar containers sem privilégios de root, aumentando a segurança."), Kubernetes e outras seguem os padrões OCI para garantir compatibilidade e portabilidade entre elas.

== WSL

No Docker Desktop para Windows e Mac, o Docker Engine roda dentro de uma VM leve porque esses sistemas não possuem suporte nativo ao kernel do Linux. Atualmente, em PCs Windows, uma das melhores formas de usar docker é por meio do WSL2.

/ WSL: (_Windows Subsystem for Linux_) é uma tecnologia da Microsoft que permite executar distribuições Linux diretamente no Windows, sem a necessidade de usar uma máquina virtual completa ou configurar um sistema em dual boot. 

Na primeira versão, o WSL funciona como uma camada de compatibilidade que traduz chamadas do sistema Linux para chamadas equivalentes no Windows, o que permite rodar muitos comandos e ferramentas Linux. No entanto, ele não utiliza um kernel Linux real, o que limita a compatibilidade com algumas aplicações, como o Docker, por exemplo.

Já o WSL2 é uma evolução significativa que introduz uma máquina virtual leve contendo um kernel Linux real, desenvolvido e otimizado pela própria Microsoft. Isso garante maior compatibilidade com ferramentas e softwares Linux, além de um desempenho superior em operações de entrada e saída (I/O). Com o WSL2, o Docker pode ser executado de forma nativa, e o sistema pode se beneficiar de um kernel Linux real, que inclusive pode ser atualizado. 

#funcs.imagem("img/wsl2.png", 70%, "WSL2: Linux rodando junto ao Windows")

Abra o PowerShell ou CMD e digite o comando `wsl --install`. Isso habilitará um ícone do Ubuntu no Windows, que é a distro padrão disponível do WSL. Abra ele e aguarde a instalação e configuração do sistema.
Após isso dê os comandos abaixo para instalar o Docker:

```bash
sudo apt update
sudo apt upgrade -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce -y
sudo service docker start
sudo usermod -aG docker $USER
docker --version
docker run hello-world
```

== Docker CLI

```bash
# os containers estão executando imagens
docker run <image-name>

# você pode executar imagens públicas do Docker Hub
# ou imagens de um registro privado
docker run https://privateregistry.com/<image-name>

# os containers são iniciados em primeiro plano. Assim que você matar o processo, por exemplo, fechar o terminal, o container será parado. Para rodar um container em segundo plano, você precisa executar em modo destacado (detached)
docker run --detached <image-name>
# ou simplesmente
docker run --d <image-name>

# lista todos os containers
docker container ls
# ou sintaxe abreviada
docker ps

# lista todos os containers, incluindo os parados
docker container ls --all

# para um container
docker stop <container-id>
# remove um container, apenas containers parados podem ser removidos
docker rm <container-id>

# inicia um container parado
docker start <container-id>

# reinicia um container em execução
docker restart <container-id>

# remove automaticamente um container quando ele é parado
docker run --rm <image-name>

##########################

#!/bin/bash

# Cria uma nova imagem a partir de um Dockerfile
# Uso: docker build -t <image-name> <path>
docker build -t my-image .

# Executa um container a partir de uma imagem
# Uso: docker run <image-name>
docker run --name my-container -d my-image

# Exibe informações detalhadas sobre o container
# Uso: docker inspect <container-id>
docker inspect my-container

# Mostra os logs de saída do container
# Uso: docker logs <container-id>
docker logs my-container

# Executa um comando dentro do container em execução
# Uso: docker exec -it <container-id> <command>
docker exec -it my-container /bin/bash

# Para o container em execução
# Uso: docker stop <container-id>
docker stop my-container

# Remove o container parado
# Uso: docker rm <container-id>
docker rm my-container

# Remove a imagem do sistema
# Uso: docker rmi <image-name>
docker rmi my-image

# Para todos os containers em execução
# Uso: docker stop $(docker ps -q)
docker stop $(docker ps -q)

# Remove todos os containers parados
# Uso: docker container prune
docker container prune

# Remove imagens não utilizadas
# Uso: docker image prune
docker image prune

# Cria uma nova rede para containers
# Uso: docker network create <network-name>
docker network create my-network

# Conecta um container a uma rede específica
# Uso: docker network connect <network-name> <container-id>
docker network connect my-network my-container


```

== Dockerfile

/ Dockerfile: é um arquivo de texto que define passo a passo como construir uma imagem Docker, especificando o sistema base, os pacotes a serem instalados, arquivos a serem copiados e o comando que será executado ao iniciar o container. Ele automatiza a criação de ambientes de execução padronizados, facilitando a portabilidade e a reprodutibilidade de aplicações.

- É arquivo é sempre estritamente nomeado `Dockerfile` sem quaisquer extensões.
- Temos que construir nossa imagem personalizada em cima de alguma base Docker já disponível imagem. (há uma imagem vazia chamada scratch o que literalmente permite que você construa uma imagem do zero).
- Todos os comandos maiúsculos fazem parte da sintaxe, não é diferenciado maiúsculas de minúsculas, mas isso é usado como uma convenção.

As instruções abaixo são comandos do Dockerfile, que definem como uma imagem Docker deve ser construída. #funcs.foot-link("https://docs.docker.com/reference/dockerfile/", "Dockerfile reference
")
#table(
  columns: 2,
  table.header(
    [Instrução],
    [Descrição],
  ),
  [`FROM`],
  [Cria um novo estágio de build a partir de uma imagem base.],
  [`RUN`],
  [Executa comandos de build.],
  [`COPY`],
  [Copia arquivos e diretórios.],
  [`CMD`],
  [Especifica comandos padrão.],
  [`ENTRYPOINT`],
  [Especifica o executável padrão.],
  [`EXPOSE`],
  [Informa quais portas sua aplicação escuta.],
  [`ENV`],
  [Define variáveis de ambiente.],
  [`WORKDIR`],
  [Altera o diretório de trabalho.],
  [`ADD`],
  [Adiciona arquivos e diretórios locais ou remotos.],
  [`ARG`],
  [Usa variáveis em tempo de build.],
  [`USER`],
  [Define o ID de usuário e grupo.],
  [`VOLUME`],
  [Cria pontos de montagem de volumes.],
  [`HEALTHCHECK`],
  [Verifica a saúde do container na inicialização.],
  [`LABEL`],
  [Adiciona metadados a uma imagem.],
  [`MAINTAINER`],
  [Especifica o autor de uma imagem.],
  [`ONBUILD`],
  [Define instruções para quando a imagem for usada em uma build.],
  [`SHELL`],
  [Define o shell padrão de uma imagem.],
  [`STOPSIGNAL`],
  [Especifica o sinal de system call para saída do container.],
)

Aqui está um exemplo bem comum e prático de Dockerfile para uma aplicação web em Python usando Flask. Ele inclui os principais comandos usados no dia a dia:

```Dockerfile
# 1. Usa uma imagem base oficial do Python
FROM python:3.11-slim

# 2. Define o diretório de trabalho dentro do container
WORKDIR /app

# 3. Copia os arquivos da aplicação para dentro do container
COPY . .

# 4. Instala as dependências listadas no requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# 5. Define variáveis de ambiente
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# 6. Expõe a porta que o Flask irá usar
EXPOSE 5000

# 7. Define o comando padrão para rodar a aplicação
CMD ["flask", "run"]
```

]