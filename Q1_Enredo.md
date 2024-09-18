# Unidade: U2 _ELEMENTOS DE ALGORITMOS
# Aula: A2_ EXECUÇÃO SEQUENCIAL E ESTRUTURAS DE DECISÃO
## OBJETIVOS 
Definição dos objetivos da aula prática:
Interpretação dos requisitos e desenvolvimento correto do algoritmo abrangendo todas as possibilidades distintas na execução do programa. Aplicar uma estrutura de decisão: ("SE" ou ""ESCOLHA CASO") no desenvolvimento de algoritmos computacionais com a pseudolinguagem Portugol.

## PROCEDIMENTOS PRÁTICOS 
Procedimento/Atividade nº 1 Atividade proposta: 
Você é um explorador corajoso que se aventura em uma misteriosa Floresta Sussurrante em busca de tesouros lendários e segredos perdidos. Ao adentrar na floresta, você se depara com três caminhos diferentes, cada um levando a uma parte desconhecida e perigosa da floresta. Sua missão é escolher sabiamente o caminho a seguir, enfrentando desafios e tomando decisões que impactarão sua jornada e sua pontuação final. Prepare-se para esta aventura cheia de mistérios! 

**Caminho 1:** O Caminho das Sombras Descrição: 
Este caminho é cercado por árvores antigas e sombrias, com raios de lua penetrando entre os galhos. Parece ser o caminho mais misterioso e perigoso da floresta.
- Obstáculo: O jogador encontra uma criatura mágica guardiã do caminho, que exige um enigma para deixá- lo passar. O enigma é: "Quem sou eu? Tenho olhos, mas não vejo. Tenho boca, mas não falo. O que sou?" (Resposta: uma caveira). 
- Premiação: Se o jogador responder corretamente ao enigma, ele encontra um baú escondido contendo uma gema preciosa que vale 100 pontos. 

**Caminho 2:** O Caminho da Luz Descrição:
Este caminho é iluminado por raios de sol que filtram entre as copas das árvores. Parece ser o caminho mais seguro e reconfortante da floresta.
- Obstáculo: O jogador encontra uma ponte quebrada sobre um rio turbulento. Ele deve decidir se tentará atravessar a ponte quebrada ou procurará um desvio seguro.
- Premiação: Se o jogador decidir atravessar a ponte quebrada com sucesso, ele encontra uma fonte mágica que restaura sua saúde e adiciona 50 pontos à sua pontuação.

**Caminho 3:** O Caminho das Criaturas Descrição: 
Este caminho é repleto de sons estranhos e pegadas misteriosas no chão. Parece ser o caminho mais imprevisível e enigmático da floresta.
- Obstáculo: O jogador se depara com uma criatura mágica adormecida bloqueando o caminho. Ele deve decidir se tentará contornar a criatura com cuidado ou acordá-la para passar.
- Premiação: Se o jogador decidir contornar a criatura com sucesso, ele encontra uma árvore encantada que concede a ele uma habilidade especial de camuflagem, adicionando 75 pontos à sua pontuação. 

Com esses três caminhos, o jogador terá que tomar decisões estratégicas para superar os obstáculos e acumular o máximo de pontos possível em sua aventura pela Floresta Sussurrante.

## Procedimentos para a realização da atividade: 
Aplicação dos fundamentos da lógica de programação e algoritmos por meio de instruções de entrada e saída, criação de variáveis e constantes, sobretudo a utilização da estrutura de decisão ("SE" ou "ESCOLHA CASO") em Portugol para resolução da atividade. 

## Desenvolvimento do Programa: 
Utilizar a linguagem Portugol no Portugol Web Studio. O estudante deverá utilizar a linguagem de programação "Portugol" Implementar os três desvios condicionais: simples, composto e ou encadeado, criando um menu de opções para o jogador, por exemplo: 

```portugol
funcao inicio() {
   inteiro opcao
    escreva("Você é um explorador corajoso que se aventura em uma misteriosa Floresta Sussurrante em busca de tesouros lendários e segredos perdidos.\n")
    escreva("Ao adentrar na floresta, você se depara com três caminhos diferentes:\n")
    escreva("1. O Caminho das Sombras\n")
    escreva("2. O Caminho da Luz\n")
    escreva("3. O Caminho das Criaturas\n")
    escreva("Escolha um caminho (1, 2, ou 3):\n")
    leia(opcao) } 
```

Observe que deverá ser criado um menu que aparece no momento da execução do programa para capturar a opção escolhida pelo usuário: 1, 2 ou 3.

De acordo com a opção escolhida, o programa deve desviar a execução do código para o trecho que irá realizar as instruções de acordo com os caminhos do cenário: "floresta sussurrante". Observe a seguir: 

```portugol
escolha(caminho) {
   caso 1:
    caminho_das_sombras()
    pare
   caso 2:
   … 
} 
```

O estudante pode utilizar a estrutura de seleção "ESCOLHA CASO" e executar as instruções para o "caminho das sombras" caso o usuário escolha a opção 1. Dessa forma, o algoritmo tem que executar todas as instruções que estão no "Caminho 1: O Caminho das Sombras". Isso inclui: a apresentação da descrição, obstáculo e premiação, sendo esta de acordo com a resposta do usuário. O mesmo princípio deve ser seguido quando o usuário escolher as opções "2" ou "3". Ainda se o usuário escolher uma opção diferente, o algoritmo deve exibir uma mensagem: 

```portugol
caso contrario:
   escreva("Escolha inválida. Por favor, selecione um caminho válido.\n")
   leia(caminho)
   escolher_caminho(caminho) 
```

Criar uma narrativa envolvente que guie o usuário ao longo da aventura. 

```portugol
funcao caminho_das_criaturas() {
   escreva("Você escolheu o Caminho das Criaturas.\n")
   escreva("Este caminho é repleto de sons estranhos e pegadas misteriosas no chão, parece ser o caminho mais imprevisível e enigmático da floresta.\n")
   escreva("Você se depara com a criatura mágica adormecida bloqueando o caminho. Você deve decidir se tentará contornar a criatura com cuidado ou acordá-la para passar.\n")
   escreva("Digite 'contornar' para tentar contornar a criatura, ou 'acordar' para acordá-la: \n")
   cadeia decisao
   leia(decisao)
   se (decisao == "contornar") 
   …
} 
```

Utilizar o próprio texto fornecido na "atividade proposta" ficando a critério do estudante a customização e a implementação de melhorias no texto, pensando em envolver o usuário nesta aventura. Observar que poderão ser utilizadas as duas estruturas de seleção durante o desenvolvimento. Nesta imagem tem um exemplo da estrutura "SE" sendo implementada e para execução do menu de opções está sendo utilizado a estrutura "ESCOLHA CASO". 

## Testes e Correções: 
Após toda a construção do programa, é hora de executar os testes. Testar o programa para garantir que todas as opções de escolha funcionem corretamente. Executando o código, de início deverá aparecer um texto explicando o programa e em seguida o menu de opções. 

```bash 
Você é um explorador corajoso que se aventura em uma misteriosa Floresta Sussurrante em busca de tesouros lendários e segredos perdidos. Ao adentrar na floresta, você se depara com três caminhos diferentes: 1. O Caminho das Sombras 2. O Caminho da Luz 3. O Caminho das Criaturas Escolha um caminho (1, 2, ou 3): 
```

Neste ponto o usuário vai entrar com a opção escolhida e em seguida o algoritmo deve executar as instruções de acordo com a opção escolhida. Verificar se o mesmo está acontecendo para as três opções do programa, inclusive quando o usuário escolhe incorretamente, ou seja, um número diferente de: 1, 2 ou 3. 

```portugol
caso contrario:
   escreva("Escolha inválida. Por favor, selecione um caminho válido.\n")
   leia(caminho)
   escolher_caminho(caminho) 
```

## Documentação e Comentários: 
Documentar o código fonte, explicando a lógica por trás de cada parte do programa. Optar sempre por documentar o código fonte, principalmente quando não se está habituado com o comando, exemplo: 

```portugol
escolha(caminho) {
   // Quando a variavel caminho for 1, o programa executa a função: caminho_das_somras()
   caso 1:
    caminho_das_sombras()
    pare
   // Quando…
   caso 2: 
   …
} 
```

Colocando "//" antes da linha o programa ignora a execução da linha. Portanto, as anotações poderão ser realizadas em todo o código-fonte. Apresentação e Avaliação: Apresentar o programa em sala de aula, demonstrando como funciona a aventura na Floresta Encantada. 

```bash 
Você é um explorador corajoso que se aventura em uma misteriosa Floresta Sussurrante em busca de tesouros lendários e segredos perdidos. Ao adentrar na floresta, você se depara com três caminhos diferentes: 1. O Caminho das Sombras 2. O Caminho da Luz 3. O Caminho das Criaturas Escolha um caminho (1, 2, ou 3): 2 
```

Após a construção do programa, testes e correções, o programa deverá ser executado passando por todas as opções sem que apresente erros ou falhas. A pontuação dos algoritmos será com base nas escolhas feitas durante a construção do algoritmo, como estratégias para maximizar a performance no desenvolvimento de soluções como a proposta por esta atividade. 

## Checklist:
[ ] Analisar o cenário para criação do código-fonte do programa;
[ ] Fazer a estruturação dos 3 caminhos, seus obstáculos e premiações previstas no percurso;
[ ] Desenvolver o algoritmo em "Portugol" na ferramenta "Portugol WebStudio";
[ ] Executar testes e possíveis correções;
[ ] Apresentar o programa e verificar seu correto funcionamento.