#import "funcs.typ"

#let flask_api = [

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
python -m venv nome_do_ambiente #OBS: será criada pasta dentro do projeto com oo nome do ambiente que escolher

# ativar o ambiente OBS: SEMPRE QUE REABRIR O PROJETO PRECISARÁ ATIVAR ESSE AMBIENTE

# em linux
source nome_do_ambiente/bin/activate 
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

Ao executar `python app.py` esse código entra em execução. Acesse a url informada em execução: `Running on http://127.0.0.1:5000` ou algo parecido e adicione `/users` no final, ficando `http://127.0.0.1:5000/users`. Ao fazer isso a mensagem `OLA MUNDO!` é exibida em json.

O endereço `http://127.0.0.1:5000/` retorna "Not Found" porque sua aplicação Flask só define a rota `/users`, e não há nenhuma rota associada à raiz (`/`). Para que algo apareça ali, seria necessário adicionar uma rota específica para `/` no código.

Código sem comentários, incluindo a rota raiz (`/`), retornando uma mensagem genérica:

> `app.py`
```python
from flask import Flask, jsonify
app = Flask(__name__)

@app.route('/users', methods=['GET'])

def getUsers():
    dados = { 'mensagem': 'OLA MUNDO!'}
    return jsonify(dados)

@app.route('/', methods=['GET'])
def getIndex():
    dados = {'msg': 'Bem vindo ao Index'}
    return jsonify(dados)

if __name__ == '__main__':
    app.run(debug=True)
```

Ferramentas como o *Postman* e similares (Insomnia, Ply e etc) são utilizada para testar e desenvolver APIs, permitindo que desenvolvedores enviem requisições HTTP (incluindo POST com dados no body) e analisem as respostas para verificar o funcionamento correto da API.

Utilizando a extensão Ply no VsCode (identificação: `ply-ct.vscode-ply`) podemos testar essa API criada. Depois de instalar a extensão, vá em *New Request*, salve o arquivo `.ply` em algum lugar, logo será aberta nova aba conforme abaixo, inclua a *url*, escolha o *método* GET e teste os endpoints criados `/` e `/users`.

#figure(image("img/2025-07-03_12-21.png", width: 95%),caption: [Teste de endpoints da API])

Através dessa demonstração vemos que a API permanece em um estado de espera, pronta para receber requisições HTTP. Quando um cliente faz uma solicitação, a API processa essa requisição e retorna a resposta apropriada. Esse modelo de operação é eficiente, pois a API não consome recursos desnecessariamente enquanto não está em uso, ativando-se apenas quando necessário.

== Aprofundando

Vamos iniciar um projeto do zero, abaixo os comandos que deve executar: 

```bash
python -m venv env

source env/bin/activate # se em linux
.\env\bin\Activate # ou em Windows

pip freeze > requirements.txt
pip install flask
pip install flask-restful
pip install flask_sqlalchemy
# se em windows substitua `touch` por `type nul > nome arquivo`
touch .gitignore # inclua env dentro 
touch api.py
touch create_db.py
```

Detalhando as dependências instaladas:

O #link("https://flask-restful.readthedocs.io/en/latest/", "Flask-RESTful") é uma extensão do Flask que simplifica a criação de APIs RESTful em Python, permitindo definir recursos como classes, facilitar a serialização de dados e gerenciar erros de forma eficiente.

/ ORM: (_Object-Relational Mapping_) é uma técnica que permite interagir com bancos de dados relacionais usando objetos da linguagem de programação, evitando a necessidade de escrever SQL diretamente para Python. Ele facilita a manipulação de bancos de dados, permitindo que desenvolvedores definam modelos de dados como classes e realizem operações de consulta e persistência de forma intuitiva e eficiente.

O #link("https://www.sqlalchemy.org/", "SQLAlchemy") é uma biblioteca Python que implementa esse conceito, permitindo que desenvolvedores definam tabelas como classes e colunas como atributos, facilitando a manipulação de dados com comandos em Python. Com ele, é possível criar, consultar, atualizar e deletar registros de forma mais intuitiva e integrada ao código, mantendo a estrutura e regras do banco relacional.

O #link("https://flask-sqlalchemy.readthedocs.io/en/stable/quickstart/","Flask-SQLAlchemy") é uma extensão do Flask que simplifica a integração do SQLAlchemy.

Abaixo, o código define uma API RESTful usando Flask, Flask-RESTful e SQLAlchemy para gerenciar usuários armazenados em um banco de dados SQLite #footnote("SQLite é um sistema de banco de dados relacional leve que armazena os dados em um único arquivo local, sem precisar de um servidor dedicado. Ele interpreta comandos SQL e gerencia estruturas como tabelas e índices diretamente nesse arquivo, sendo ideal para aplicações pequenas, testes, protótipos e apps móveis."). Ele permite criar, listar, buscar, atualizar e excluir usuários por meio das rotas `/api/users/` e `/api/users/<id>`. A estrutura inclui validação de entrada com `reqparse`, formatação das respostas com `marshal_with` e mapeamento do modelo `UserModel` para a tabela do banco. 

#line(length: 100%, stroke: 1pt)

> `api.py`

```python
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_restful import Resource, Api, reqparse, fields, marshal_with, abort

# Criação da aplicação Flask
app = Flask(__name__)

# Configuração do banco SQLite
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///database.db'
db = SQLAlchemy(app)

# Criação da API RESTful
api = Api(app)

# Modelo de usuário para o banco de dados
class UserModel(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    email = db.Column(db.String(80), unique=True, nullable=False)

    def __repr__(delf):
        return f"User(name = {self.username}, email = {self.email})"

# Validação dos dados recebidos nas requisições
user_args = reqparse.RequestParser()
user_args.add_argument('username', type=str, required=True, help="Username não pode estar em branco")
user_args.add_argument('email', type=str, required=True, help="Email não pode estar em branco")

# Especificação de como os dados do usuário devem ser serializados na resposta
userFields = {
    'id': fields.Integer,
    'username': fields.String,
    'email': fields.String
}

class Users(Resource):
    # Retorna a lista de todos os usuários cadastrados
    @marshal_with(userFields)
    def get(self):
        return UserModel.query.all()
    
    # Cria um novo usuário com os dados fornecidos e retorna todos os usuários
    @marshal_with(userFields)
    def post(self):
        args = user_args.parse_args()
        user = UserModel(username=args["username"], email=args["email"])    
        db.session.add(user)
        db.session.commit()
        return UserModel.query.all(), 201

class User(Resource):
    # Retorna os dados de um único usuário com base no ID
    @marshal_with(userFields)
    def get(self, id):
        user = UserModel.query.filter_by(id=id).first()
        if not user:
            abort(404, "Usuário não encontrado")
        return user

    # Atualiza os dados (username e email) de um usuário existente
    @marshal_with(userFields)
    def patch(self, id):
        args = user_args.parse_args()
        user = UserModel.query.filter_by(id=id).first()
        if not user:
            abort(404, "Usuário não encontrado")
        user.username = args["username"]
        user.email = args["email"]
        db.session.commit()
        return UserModel.query.all(), 204
    
    # Exclui um usuário com base no ID fornecido
    @marshal_with(userFields)
    def delete(self, id):
        user = UserModel.query.filter_by(id=id).first()
        if not user:
            abort(404, "Usuário não encontrado")
        db.session.delete(user)
        db.session.commit()
        return user


# Registro dos recursos na API com suas rotas
api.add_resource(Users, '/api/users/')
api.add_resource(User, '/api/users/<int:id>')

# Execução da aplicação Flask em modo debug
if __name__ == '__main__':
    app.run(debug=True)

```

#line(length: 100%, stroke: 1pt)

> `create_db.py`

```python
from api import app, db

with app.app_context():
    db.create_all()
```
O código acima (`create_db.py`) é usado para inicializar o banco de dados com as tabelas definidas nos modelos. Ao executar o comando `python create_db.py`, será criado o banco de dados no arquivo `instance/database.db`

Em seguida, ao executar `python api.py`, o Flask inicia o servidor web local disponibilizando os endpoints da API para requisições HTTP. A partir daí você deve usar a extensão Ply para testar sua API:

+ Crie usuários
+ Liste todos os usuários cadastrados
+ Retorne os dados de um único usuário
+ Atualize os dados de um usuário
+ Exclua um usuário














]

