PARTE 1: PESQUISA TEÓRICA
1-
Objeto unico
{
  "titulo": "Coringa",
  "classificacao": 16
}

Varios objetos
[
  {
    "titulo": "Coringa",
    "classificacao": 16
  },
  {
    "titulo": "Batman",
    "classificacao": 14
  }
]

2- O dart entende: List é uma lista de varios itens. Map representa um unico item.

3- For tradicional: usa incide i e é util quando precisamos do indice.
o For-in percorre diretamente os elementos da lista e é mais legivel e simples.

4- A lista aceita ambos porque Filme e Serie herdam de Conteudo. No polimorfismo, um objeto de uma subclasse pode ser tratado como se fosse do tipo da sua classe pai.

5-.map(): Serve para transformar cada item de uma lista em algo novo (ex: transformar dados em Widgets).
.toList(): É usado porque o .map() retorna um Iterable (um fluxo de dados "preguiçoso"), e o .toList() o converte de volta em uma Lista real para que possa ser usada em funções que exigem esse formato.



Parte 4 - Relatório Final
1-
Se algum item foi adicionado ou removido, o arquivo foi atualizado com essas mudanças.

2- Durante a leitura do json todos os itens são tratados como filmes. Por isso a serie não seria cadastrada corretamente, pois tem atributos diferentes que não existem em Filme, como: temporadas

3-
O primeiro benefício é deixar o código mais limpo e facilitando a reutilização do código. Além disso, cada classe sabe como se transformar em json.

4-
Sim, pois os valores de classificação passam por validação. Se fosse encontrado algum dado incorreto, o sistema lança um erroe mantem o encapsulamento.

5-
A etapa mais desafiadora foi trabalhar com a conversão entre JSON e objetos, entendendo como transformar os dados do arquivo em objetos e depois salvar novamente, garantindo validação e sem erros no arquivo.
