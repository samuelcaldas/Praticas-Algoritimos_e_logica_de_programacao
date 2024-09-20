**Expansão do Enredo do RPG:**

Após superar os desafios iniciais na Floresta Sussurrante, você chega a uma clareira antiga onde se ergue um velho templo de pedra — o **Templo dos Ecos**. Diz a lenda que este templo guarda o tesouro supremo da floresta, mas apenas aqueles que provarem seu valor podem reivindicá-lo.

**Novo Nível: O Templo dos Ecos**

**Desafio: O Salão das Reflexões**

Ao entrar no templo, você se vê em um grande salão cercado por espelhos. Uma voz ecoa:

*"Para avançar, você deve responder:*

*Falo sem boca e ouço sem ouvidos. Não tenho corpo, mas ganho vida com o vento. O que sou eu?"*

*(Resposta: Um eco)*

- **Ação Correta:**
  - Se você responder corretamente, um caminho se abre à sua frente, levando-o ao próximo desafio.
  - **Recompensa:** Você recebe um artefato antigo que adiciona **150 pontos** à sua pontuação.

- **Ação Errada:**
  - Se você responder incorretamente, o salão começa a distorcer, e você perde o caminho, deduzindo **50 pontos** e retornando à entrada do templo.

**Evento Aleatório:**

Em qualquer momento deste nível, há uma chance aleatória de uma armadilha ser ativada, liberando um gás sonífero que faz você desmaiar. Você acorda novamente no início da floresta, com seus pontos intactos.

**Desafio Final: O Guardião do Templo**

No último recinto, você encontra o **Guardião do Templo**, uma entidade mística que lhe oferece um desafio final:

*"Prove seu valor escolhendo sabiamente. À sua frente estão dois cálices: um concede o tesouro que você busca, o outro o amaldiçoa a vagar pela floresta para sempre."*

Você deve escolher entre o **Cálice de Madeira** ou o **Cálice de Ouro**.

- **Ação Correta:**
  - Escolhendo o **Cálice de Madeira**, você obtém o tesouro e adiciona **200 pontos** à sua pontuação.
  - **Fim do Jogo:** Você venceu a aventura!

- **Ação Errada:**
  - Escolhendo o **Cálice de Ouro**, a maldição é desencadeada, deduzindo **100 pontos** e retornando você ao início do templo.

**Evento Aleatório:**

Novamente, há a chance de que, independentemente da sua escolha, o guardião decida testá-lo ainda mais, enviando-o de volta ao início da floresta.

---

**Explicação do Código:**

- **Estrutura Geral:**
  - O programa foi organizado em funções modulares para cada parte do jogo, com responsabilidade única, facilitando a leitura e manutenção.
  - Variáveis e funções possuem nomes significativos que refletem sua finalidade.
  - Comentários explicativos e docstrings foram adicionados para facilitar o entendimento.
  - Funções comuns, como `verificarEventoAleatorio`, foram reutilizadas.

- **Variáveis e Constantes:**
  - **Constantes** foram utilizadas para os valores de pontos, facilitando a manutenção e evitando números mágicos.
  - **Variável global `pontuacao`** mantém o controle da pontuação do jogador ao longo do jogo.

- **Fluxo Principal (`funcao inicio()`):**
  - Um loop `enquanto (verdadeiro)` mantém o jogo em execução até que o jogador vença ou perca.
  - O jogo verifica se a pontuação ficou negativa para encerrar o jogo em caso de derrota.

- **Eventos Aleatórios:**
  - A função `verificarEventoAleatorio()` utiliza a função `u.sorteia()` da biblioteca `Util` para gerar um número aleatório e determinar se o evento de desmaio ocorre.
  - Esse evento pode ocorrer em qualquer caminho ou nível.

- **Funções de Caminho:**
  - Cada caminho (`caminhoDasSombras`, `caminhoDaLuz`, `caminhoDasCriaturas`) possui sua própria lógica e decisões.
  - Ações corretas somam pontos e permitem avançar; ações erradas subtraem pontos e retornam o jogador à etapa anterior.

- **Desafios no Templo:**
  - Funções `desafioSalaoReflexoes` e `desafioGuardiaoTemplo` representam os desafios de um novo nível.
  - Seguem a mesma lógica de adicionar ou subtrair pontos com base nas decisões do jogador.

- **Prevenção de Erros:**
  - O programa utiliza estruturas de controle para lidar com entradas inválidas e manter o jogo funcionando.
  - Em casos de opções inválidas, o jogador é solicitado a tentar novamente.
  - O tipo de variável usada em `opcaoCaminho`, diferentemente do sugerido, é `cadeia`, evitando que o jogo quebre caso o usuário insira algo diferente de um número inteiro.

**Conclusão:**

Este jogo interativo proporciona uma experiência de aventura, permitindo que o jogador tome decisões que afetam diretamente o resultado.
