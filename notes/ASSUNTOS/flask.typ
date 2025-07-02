#import "funcs.typ"

#let flask = [

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

]