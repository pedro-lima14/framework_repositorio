1
Fornece a estrutura visual basica e o esqueleto de layout para uma tela, implementando o padrao de design visual do Material Design.

2
Exibe a barra superior da tela, usada para mostrar o titulo do aplicativo, botoes de acao e o botao automatico de voltar.

3
O StatelessWidget cria uma tela ou componente estatico que nao muda de aparencia sozinho apos ser desenhado. O StatefulWidget possui um estado interno dinamico e pode se redesenhar em tempo de execucao para reagir a interacoes do usuario.
4
Notifica o Flutter que o estado interno do widget mudou, forcando o framework a reconstruir e atualizar a interface com os novos dados.

5
Adiciona uma nova rota (tela) no topo da pilha de navegacao, fazendo com que a nova tela seja exibida para o usuario.

6
Remove a tela atual do topo da pilha de navegacao, destruindo-a e fazendo o usuario voltar para a tela anterior.
7

Permite controlar, ler e modificar o texto digitado pelo usuario dentro de um campo de entrada de dados (TextField).

8
Garante a integridade das informacoes do sistema, evitando o envio de dados inconsistentes, incompletos ou vazios ao banco de dados.

9
Mostra uma mensagem rapida e informativa na parte inferior da tela, que desaparece sozinha apos alguns segundos.

10
Abre um painel deslizante que surge da parte de baixo da tela, bloqueando o restante da interface ate que o usuario interaja ou feche o modal.

11
Cria transicoes visuais suaves (animacoes) de forma automatica sempre que propriedades como tamanho, cor, borda ou margem forem alteradas.

12
Torna o conteudo rolavel, evitando o erro de estouro de tela (overflow) quando o teclado e aberto ou quando o conteudo ultrapassa os limites fisicos do display.

13
Permite a reutilizacao de codigo, permitindo usar o mesmo design varias vezes mudando apenas os dados passados por parametro.

14
A Column renderiza todos os filhos de uma vez e nao possui rolagem propria (pode estourar a tela). A ListView possui rolagem nativa inclusa e pode otimizar a performance destruindo itens fora da area de visao.

15
Melhora a organizacao, legibilidade e manutencao do projeto, dividindo telas complexas em blocos pequenos, independentes e mais faceis de testar.
