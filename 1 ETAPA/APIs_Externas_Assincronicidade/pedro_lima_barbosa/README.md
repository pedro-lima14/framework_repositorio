1- Qual API você escolheu? Cole aqui o link direto para a documentação dela.

Eu usei a API de competições de futebol:
https://www.football-data.org/documentation/quickstart


2- Explicando o JSON:

Os dados não vieram direto em lista. Eles vieram dentro de uma chave chamada "competitions".
Então acessei essa chave pra pegar a lista.


3- Quando você usa a opção "Deletar", o que o código faz?

Primeiro ele lê o arquivo json e transforma em lista. Depois pede o ID pro usuário. Usa removeWhere pra remover o item da lista. Depois salva tudo de novo no arquivo, substituindo o antigo.


4- Se você fechar o programa e abrir de novo, o item ainda vai estar lá? Explique.

Não vai estar, porque quando eu deleto, salva o arquivo atualizado. Então quando o programa abre de novo e lê o JSON, o item já foi removido.
