#import "funcs.typ"

#let python = [

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

]