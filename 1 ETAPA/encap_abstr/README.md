# Atividade Prática — Framework

**Disciplina:** FRAMEWORK  
**Professor:** Igor Lucas  
**Atividade:** Encapsulamento, Abstração e Leitura de JSON

---

## Estrutura do Projeto

```
atividade_framework/
├── bin/
│   └── main.dart
├── lib/
│   └── conteudo.dart
├── dados.json
└── README.md
```

---

## Como Executar

```bash
dart run bin/main.dart
```

---

## PARTE 1 — Pesquisa Teórica

**1. Qual a função do modificador de acesso privado (o uso do underscore "_" antes do nome da variável) no Dart?**

No Dart, o underscore antes do nome de uma variável (ex: `_classificacao`) indica que aquela variável é **privada ao nível de biblioteca (arquivo)**. Isso significa que ela só pode ser acessada por código que esteja dentro do mesmo arquivo `.dart` onde foi declarada. Arquivos externos não conseguem acessá-la diretamente, protegendo o estado interno da classe.

---

**2. Explique com suas palavras a diferença prática entre acessar uma variável diretamente e acessá-la através de um Getter.**

Acessar uma variável **diretamente** significa ler ou modificar seu valor sem nenhum controle ou validação — qualquer código que tenha acesso ao objeto pode fazer isso livremente. Já acessar por meio de um **Getter** passa por um método intermediário, que pode conter lógica de controle, calcular um valor derivado, ou simplesmente expor de forma controlada um atributo privado. O Getter garante que o dado seja lido da forma que a classe deseja, sem expor sua implementação interna.

---

**3. Qual é a principal responsabilidade de um Setter dentro do conceito de Encapsulamento?**

O Setter é responsável por **controlar e validar** os dados antes de atribuí-los a um atributo privado. Em vez de deixar qualquer código modificar o atributo diretamente (sem restrições), o Setter atua como um "porteiro": verifica se o valor é válido e só então realiza a atribuição. Isso mantém a integridade dos dados e centraliza as regras de negócio dentro da própria classe.

---

**4. O que acontece no código se tentarmos acessar um atributo privado de uma classe estando em um arquivo diferente de onde ela foi declarada?**

O Dart lançará um **erro de compilação**, indicando que o membro não existe ou não é acessível naquele contexto. Como a privacidade no Dart é por biblioteca (arquivo), tentar acessar `objeto._classificacao` a partir de outro arquivo simplesmente não é permitido pelo compilador. A única forma de acessar esse valor externamente é por meio de um Getter público.

---

**5. Explique o motivo pelo qual o Dart não permite instanciar diretamente uma classe abstrata (ex: `var c = Conteudo();`).**

Uma classe abstrata é um **modelo incompleto** — ela pode declarar métodos sem implementação (métodos abstratos), que obrigatoriamente precisam ser implementados pelas classes filhas. Como a classe abstrata não possui implementação completa, não faz sentido criar um objeto dela diretamente: o programa não saberia o que executar ao chamar, por exemplo, `darPlay()`. O objetivo da classe abstrata é servir de contrato e base para subclasses, não ser usada diretamente.

---

**6. O que faz a anotação `@override` e em quais situações seu uso é obrigatório?**

A anotação `@override` informa ao compilador e ao programador que aquele método está **substituindo (sobrescrevendo) um método da classe pai**. Seu uso é obrigatório quando a classe pai declara um método abstrato — ou seja, sem corpo — pois a subclasse é forçada a fornecer a implementação. Além disso, é uma boa prática usá-la mesmo em sobrescritas opcionais, pois o compilador verifica se o método realmente existe na classe pai, evitando erros de digitação.

---

**7. Qual a utilidade da função `jsonDecode` da biblioteca `dart:convert` quando estamos lidando com leitura de arquivos?**

A função `jsonDecode` converte uma **String no formato JSON** em uma estrutura de dados Dart, como um `Map<String, dynamic>` ou uma `List`. Quando lemos um arquivo JSON com `File.readAsStringSync()`, obtemos apenas texto puro. O `jsonDecode` interpreta esse texto e o transforma em objetos manipuláveis pelo código Dart, permitindo acessar valores por chave (ex: `dados['titulo']`).

---

## PARTE 4 — Relatório Final

**1. O que foi impresso no console quando o seu programa tentou passar a classificação "-5" (vinda do JSON) para o objeto?**

O console exibiu a seguinte mensagem:

```
Erro: Exception: Classificação inválida
```

Isso ocorreu porque o valor `-5` é menor que `0`, ativando a condição de validação no Setter, que lançou uma `Exception`. O bloco `catch` capturou essa exceção e imprimiu o erro.

---

**2. Como o uso do Encapsulamento neste exercício garantiu a segurança e a integridade dos dados do seu sistema?**

O atributo `_classificacao` não pode ser alterado diretamente de fora da classe. Qualquer tentativa de atribuição passa obrigatoriamente pelo Setter `validarClassificacao`, que contém a regra de negócio (classificação entre 0 e 18). Dessa forma, mesmo que os dados externos (o JSON) contenham valores inválidos, o sistema detecta e rejeita o dado antes que ele corrompa o estado do objeto, garantindo a integridade da informação.

---

**3. Se o arquivo "dados.json" estivesse completamente em branco no momento da leitura, qual seria o comportamento da função `jsonDecode`?**

A função `jsonDecode` lançaria uma **`FormatException`**, pois receberia uma String vazia (ou nula), que não representa um JSON válido. O programa encerraria com erro, a não ser que esse caso também fosse tratado com um bloco `try-catch`.

---

**4. Qual a principal vantagem de definir o método `darPlay()` na classe pai de forma abstrata, em vez de criar métodos independentes apenas nas classes filhas?**

Definir `darPlay()` como abstrato na classe pai garante que **toda subclasse de `Conteudo` seja obrigada a implementar esse comportamento**, sem exceção. Isso cria um contrato claro: qualquer tipo de conteúdo (Filme, Série, Podcast, etc.) terá necessariamente um método `darPlay()`. Além disso, permite o uso de **polimorfismo** — é possível tratar objetos de tipos diferentes de forma uniforme, chamando `darPlay()` sem saber qual subclasse específica está sendo usada.

---

**5. Qual foi a maior dificuldade encontrada durante a realização desta atividade?**

A maior dificuldade foi compreender como o Dart trata a privacidade por **biblioteca (arquivo)** em vez de por classe, como acontece em linguagens como Java. Entender que o underscore restringe o acesso ao nível do arquivo `.dart` — e não apenas da classe — exigiu atenção, especialmente ao organizar o projeto em pastas separadas (`lib` e `bin`). Além disso, integrar a leitura de arquivo com a validação via Setter dentro de um bloco `try-catch` de forma coesa também demandou cuidado na estruturação do código.
