PARTE 1
1. 
Future é tipo um valor que ainda vai chegar. Ele é usado quando algo demora, como uma requisição na internet. A função retorna um Future porque o resultado não vem na hora.

2. 
O await faz o código esperar a resposta antes de continuar. Sem ele, o programa não espera e pode dar problema.

3. 
"200" → deu tudo certo
"401" → não autorizado
"403" → acesso proibido
"404" → não encontrado

4. 
Porque estamos usando await dentro da main. Pra isso funcionar, ela precisa ser async. E como não retorna nada, fica Future<void>.

5. 
Serve pra transformar o JSON da API em dados que o Dart consegue usar.


PARTE 5
1. 
Depois de usar o "jsonDecode", eu percebi que os livros não estavam direto na raiz. Então eu acessei a chave "data", que é onde está a lista. Aí eu retornei só "corpoDecodificado['data']".

2. 
A parte dos vilões vinha como uma lista de objetos. Então eu fiz um for pra percorrer essa lista e, dentro dele, peguei só o campo "name" de cada vilão e adicionei em uma lista de String.

3. 
Se eu rodar sem internet, dá erro na requisição. Mas o programa não quebra porque eu usei um "try-catch". O try tenta executar tudo, e se der erro, o catch pega e mostra uma mensagem no terminal ao invés de fechar com erro.
