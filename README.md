# Práticas: Algoritmos e Lógica de Programação

Este repositório contém diversos exercícios e projetos práticos de algoritmos e lógica de programação desenvolvidos em Portugol. Cada projeto visa aprimorar o entendimento dos conceitos fundamentais de programação e a aplicação de estruturas de controle de fluxo.

## Índice

- [Descrição](#descrição)
- [Estrutura do Repositório](#estrutura-do-repositório)
- [Pré-requisitos](#pré-requisitos)
- [Como Executar](#como-executar)
- [Projetos](#projetos)
  - [Jogo de Exploração no Labirinto](#jogo-de-exploração-no-labirinto)
  - [Aventura na Floresta Sussurrante](#aventura-na-floresta-sussurrante)
  - [Expansão do Enredo do RPG](#expansão-do-enredo-do-rpg)
- [Contribuição](#contribuição)
- [Licença](#licença)

## Descrição

Este repositório foi criado para armazenar práticas de algoritmos e lógica de programação utilizando a linguagem Portugol. Os projetos aqui presentes são didáticos e têm como objetivo auxiliar no aprendizado de estruturas de decisão, loops, manipulação de matrizes, e outras técnicas fundamentais de programação.

## Estrutura do Repositório

- `Q1.por`: Código fonte do projeto "Aventura na Floresta Sussurrante".
- `Q1_Enredo.md`: Descrição detalhada da história e dos caminhos do jogo "Aventura na Floresta Sussurrante".
- `Q1_RPG.md`: Expansão do enredo do jogo RPG, incluindo novos desafios e níveis.
- `Q2.por`: Código fonte do projeto "Jogo de Exploração no Labirinto".

## Pré-requisitos

Para executar os projetos deste repositório, você precisará do [Portugol Studio](http://lite.acad.univali.br/portugol/), uma ferramenta de desenvolvimento para a linguagem Portugol.

## Como Executar

1. Clone o repositório:
   ```bash
   git clone https://github.com/samuelcaldas/Praticas-Algoritimos_e_logica_de_programacao.git
   ```

2. Abra o Portugol Studio.

3. Importe o projeto desejado (por exemplo, `Q1.por` ou `Q2.por`).

4. Execute o código diretamente no Portugol Studio.

## Projetos

### Jogo de Exploração no Labirinto

- **Arquivo:** `Q2.por`
- **Descrição:** Um jogo onde o jogador guia um explorador através de um labirinto gerado aleatoriamente até encontrar o tesouro, evitando armadilhas e paredes.
- **Regras:** 
  - O labirinto é uma matriz 10x10.
  - Paredes ocupam no máximo 1/3 das células.
  - Armadilhas estão presentes em 1 a cada 5 células.
  - O tesouro é colocado em uma posição aleatória.
  - O explorador começa em uma posição aleatória e retorna ao início se cair em uma armadilha.

### Aventura na Floresta Sussurrante

- **Arquivo:** `Q1.por`
- **Descrição:** Um jogo de aventura onde o jogador explora a Floresta Sussurrante em busca de tesouros e segredos, enfrentando desafios e acumulando pontos.
- **Caminhos:**
  - Caminho das Sombras
  - Caminho da Luz
  - Caminho das Criaturas

### Expansão do Enredo do RPG

- **Arquivo:** `Q1_RPG.md`
- **Descrição:** Expansão do jogo "Aventura na Floresta Sussurrante" com novos desafios no Templo dos Ecos, incluindo enigmas e o desafio final com o Guardião do Templo.
- **Níveis Adicionais:**
  - Salão das Reflexões
  - Guardião do Templo

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir uma issue ou enviar um pull request com melhorias e correções.

1. Faça um fork do projeto.
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`).
3. Faça commit das suas alterações (`git commit -m 'Adiciona nova feature'`).
4. Envie para o branch (`git push origin feature/nova-feature`).
5. Abra um pull request.

## Licença

Este projeto está licenciado sob a [Licença MIT](LICENSE).
