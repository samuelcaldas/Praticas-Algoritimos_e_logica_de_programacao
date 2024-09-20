/**
 * @mainpage Aventura na Floresta Sussurrante
 *
 * @brief Este programa é um jogo de aventura onde o jogador explora a Floresta Sussurrante em busca de tesouros e segredos.
 *
 * O jogador pode escolher entre diferentes caminhos, enfrentar desafios e acumular pontos até alcançar o Templo dos Ecos.
 */

programa
{
    /** @brief Biblioteca Util para funções de aleatoriedade. */
    inclua biblioteca Util --> u

    /** @brief Biblioteca Texto para manipulação de strings. */
    inclua biblioteca Texto --> tx

    // -------------------------------------------------------------------------
    // Constantes para os valores de pontos
    // -------------------------------------------------------------------------

    /** @brief Pontos ganhos ao escolher o Caminho das Sombras */
    const inteiro PONTOS_CAMINHO_SOMBRAS = 100

    /** @brief Pontos ganhos ao escolher o Caminho da Luz */
    const inteiro PONTOS_CAMINHO_LUZ = 50

    /** @brief Pontos ganhos ao escolher o Caminho das Criaturas */
    const inteiro PONTOS_CAMINHO_CRIATURAS = 75

    /** @brief Pontos ganhos ao completar o Salão das Reflexões */
    const inteiro PONTOS_SALAO_REFLEXO = 150

    /** @brief Pontos ganhos ao derrotar o Guardião do Tesouro */
    const inteiro PONTOS_GUARDIAO_TESOURO = 200

    /** @brief Penalidade de pontos ao falhar no Salão das Reflexões */
    const inteiro PENALIDADE_SALAO_REFLEXO = 50

    /** @brief Penalidade de pontos ao ser amaldiçoado pelo Guardião */
    const inteiro PENALIDADE_GUARDIAO_MALDICAO = 100

    // -------------------------------------------------------------------------
    // Variáveis globais para a pontuação e controle do jogo
    // -------------------------------------------------------------------------

    /** @brief Pontuação atual do jogador */
    inteiro pontuacao = 0

    /** @brief Indicador se o jogo está em execução */
    logico jogoEmExecucao = verdadeiro

    // -------------------------------------------------------------------------
    // Funções do Jogo
    // -------------------------------------------------------------------------

    /**
     * @brief Função principal que inicia o jogo.
     *
     * Executa o loop principal do jogo, iniciando o primeiro nível e avançando para o templo se a pontuação for positiva.
     */
    funcao inicio()
    {
        // Loop principal do jogo
        enquanto (jogoEmExecucao)
        {
            nivelUm()

            se (pontuacao > 0)
            {
                avancarParaTemplo()
            }
        }
    }

    /**
     * @brief Executa o primeiro nível do jogo.
     *
     * Exibe a introdução e permite que o jogador escolha um caminho.
     */
    funcao nivelUm()
    {
        exibirIntroducao()
        escolherCaminho()
    }

    /**
     * @brief Exibe a introdução do jogo.
     *
     * Mostra ao jogador a história inicial e as opções de caminhos disponíveis.
     */
    funcao exibirIntroducao()
    {
        escreva("\nVocê é um explorador corajoso que se aventura em uma misteriosa Floresta Sussurrante em busca de tesouros lendários e segredos perdidos.\n")
        escreva("Ao adentrar na floresta, você se depara com três caminhos diferentes:\n")
        escreva("1. O Caminho das Sombras\n")
        escreva("2. O Caminho da Luz\n")
        escreva("3. O Caminho das Criaturas\n")
    }

    /**
     * @brief Permite que o jogador escolha um caminho.
     *
     * Recebe a escolha do jogador e direciona para a função correspondente.
     */
    funcao escolherCaminho()
    {
        cadeia opcaoCaminho

        escreva("\nEscolha um caminho (1, 2, ou 3): ")
        leia(opcaoCaminho)

        // Evento aleatório de desmaio
        se (verificarEventoAleatorio())
        {
            escreva("\nVocê sentiu uma tontura repentina e desmaiou...\n")
            escreva("Você acorda novamente no início da floresta.\n")
            // Pontuação permanece inalterada
            retorne
        }

        escolha (opcaoCaminho)
        {
            caso '1':
                caminhoDasSombras()
                pare
            caso '2':
                caminhoDaLuz()
                pare
            caso '3':
                caminhoDasCriaturas()
                pare
            caso contrario:
                nivelUm()
                pare
        }
    }

    /**
     * @brief Gera um evento aleatório.
     *
     * @return @c verdadeiro se o evento ocorrer, @c falso caso contrário.
     *
     * @details Possui 10% de chance de retornar verdadeiro.
     */
    funcao logico verificarEventoAleatorio()
    {
        // Deve existir uma maneira melhor de fazer isso, mas estou cansado no momento.
        inteiro chance = u.sorteia(1, 10) // Gera um número entre 1 e 10
        se (chance == 1) // 10% de chance de ocorrer o evento
        {
            retorne verdadeiro
        }
        senao
        {
            retorne falso
        }
    }

    /**
     * @brief Verifica a pontuação do jogador.
     *
     * @return @c verdadeiro se a pontuação for negativa e o jogo deve terminar, @c falso caso contrário.
     *
     * @details Se a pontuação ficar negativa, o jogo é finalizado.
     */
    funcao logico verificarPontuacao()
    {
        se (pontuacao < 0)
        {
            escreva("\nSua pontuação ficou negativa. Você perdeu o jogo.\n")
            jogoEmExecucao = falso
            retorne verdadeiro // Indica que o jogo deve terminar
        }
        retorne falso // O jogo continua
    }

    /** @brief Executa o Caminho das Sombras. */
    funcao caminhoDasSombras()
    {
        escreva("\nVocê escolheu o Caminho das Sombras.\n")
        escreva("Este caminho é cercado por árvores antigas e sombrias, com raios de lua penetrando entre os galhos.\n")
        escreva("Uma criatura mágica guardiã do caminho aparece e diz:\n")
        escreva("\"Para prosseguir, responda ao meu enigma: 'Quem sou eu? Tenho olhos, mas não vejo. Tenho boca, mas não falo. O que sou?'\"\n")

        cadeia respostaEnigma
        escreva("Sua resposta: ")
        leia(respostaEnigma)
        respostaEnigma = tx.caixa_baixa(respostaEnigma)

        se (verificarEventoAleatorio())
        {
            escreva("\nDe repente, você é capturado e...\n")
            escreva("Acorda novamente no início da floresta.\n")
            retorne
        }

        se (respostaEnigma == "caveira")
        {
            escreva("\nA criatura sorri e permite que você passe.\n")
            escreva("Você encontra um baú escondido contendo uma gema preciosa!\n")
            pontuacao = pontuacao + PONTOS_CAMINHO_SOMBRAS
            escreva("Você ganhou ", PONTOS_CAMINHO_SOMBRAS, " pontos. Pontuação atual: ", pontuacao, "\n")
            se (verificarPontuacao())
            {
                retorne
            }
        }
        senao
        {
            escreva("\nA criatura se enfurece com a resposta errada e você é forçado a retornar ao início.\n")
            pontuacao = pontuacao - PONTOS_CAMINHO_SOMBRAS
            escreva("Você perdeu ", PONTOS_CAMINHO_SOMBRAS, " pontos. Pontuação atual: ", pontuacao, "\n")
            se (verificarPontuacao())
            {
                retorne
            }
            nivelUm()
        }
    }

    /** @brief Executa o Caminho da Luz. */
    funcao caminhoDaLuz()
    {
        escreva("\nVocê escolheu o Caminho da Luz.\n")
        escreva("Este caminho é iluminado por raios de sol que filtram entre as copas das árvores.\n")
        escreva("Você encontra uma ponte quebrada sobre um rio turbulento.\n")
        escreva("Digite 'atravessar' para tentar atravessar a ponte quebrada ou 'desvio' para procurar um caminho seguro: ")

        cadeia decisaoPonte
        leia(decisaoPonte)
        decisaoPonte = tx.caixa_baixa(decisaoPonte)

        se (verificarEventoAleatorio())
        {
            escreva("\nDe repente, você sente uma fraqueza e desmaia...\n")
            escreva("Você acorda novamente no início da floresta.\n")
            retorne
        }

        se (decisaoPonte == "atravessar")
        {
            escreva("\nVocê atravessa cuidadosamente a ponte quebrada e consegue chegar ao outro lado!\n")
            escreva("Você encontra uma fonte mágica que restaura sua saúde.\n")
            pontuacao = pontuacao + PONTOS_CAMINHO_LUZ
            escreva("Você ganhou ", PONTOS_CAMINHO_LUZ, " pontos. Pontuação atual: ", pontuacao, "\n")
            se (verificarPontuacao())
            {
                retorne
            }
        }
        senao se (decisaoPonte == "desvio")
        {
            escreva("\nVocê procura um desvio, mas acaba se perdendo e retorna ao início.\n")
            pontuacao = pontuacao - PONTOS_CAMINHO_LUZ
            escreva("Você perdeu ", PONTOS_CAMINHO_LUZ, " pontos. Pontuação atual: ", pontuacao, "\n")
            se (verificarPontuacao())
            {
                retorne
            }
            nivelUm()
        }
        senao
        {
            escreva("Opção inválida. Tente novamente.\n")
            caminhoDaLuz()
            retorne
        }
    }

    /** @brief Executa o Caminho das Criaturas. */
    funcao caminhoDasCriaturas()
    {
        escreva("\nVocê escolheu o Caminho das Criaturas.\n")
        escreva("Este caminho é repleto de sons estranhos e pegadas misteriosas no chão.\n")
        escreva("Você se depara com uma criatura mágica adormecida bloqueando o caminho.\n")
        escreva("Digite 'contornar' para tentar contornar a criatura ou 'acordar' para acordá-la: ")

        cadeia decisaoCriatura
        leia(decisaoCriatura)
        decisaoCriatura = tx.caixa_baixa(decisaoCriatura)

        se (verificarEventoAleatorio())
        {
            escreva("\nUm gás misterioso envolve você, e você desmaia...\n")
            escreva("Você acorda novamente no início da floresta.\n")
            retorne
        }

        se (decisaoCriatura == "contornar")
        {
            escreva("\nVocê contorna a criatura com sucesso!\n")
            escreva("Você encontra uma árvore encantada que lhe concede uma habilidade especial de camuflagem.\n")
            pontuacao = pontuacao + PONTOS_CAMINHO_CRIATURAS
            escreva("Você ganhou ", PONTOS_CAMINHO_CRIATURAS, " pontos. Pontuação atual: ", pontuacao, "\n")
            se (verificarPontuacao())
            {
                retorne
            }
        }
        senao se (decisaoCriatura == "acordar")
        {
            escreva("\nA criatura acorda irritada e o força a recuar.\n")
            pontuacao = pontuacao - PONTOS_CAMINHO_CRIATURAS
            escreva("Você perdeu ", PONTOS_CAMINHO_CRIATURAS, " pontos. Pontuação atual: ", pontuacao, "\n")
            se (verificarPontuacao())
            {
                retorne
            }
            nivelUm()
        }
        senao
        {
            escreva("Opção inválida. Tente novamente.\n")
            caminhoDasCriaturas()
            retorne
        }
    }

    /** @brief Avança para o Templo dos Ecos após superar os desafios iniciais e inicia o desafio no Salão das Reflexões dentro do templo. */
    funcao avancarParaTemplo()
    {
        escreva("\nApós superar os desafios iniciais, você chega ao Templo dos Ecos.\n\n")
        desafioSalaoReflexoes()
    }

    /** @brief Executao Desafio do Salão das Reflexões. */
    funcao desafioSalaoReflexoes()
    {
        escreva("\nDentro do templo, você entra no Salão das Reflexões.\n")
        escreva("Uma voz ecoa:\n")
        escreva("\"Falo sem boca e ouço sem ouvidos. Não tenho corpo, mas ganho vida com o vento. O que sou eu?\"\n")

        cadeia respostaSalao
        escreva("Sua resposta: ")
        leia(respostaSalao)
        respostaSalao = tx.caixa_baixa(respostaSalao)

        se (verificarEventoAleatorio())
        {
            escreva("\nUma armadilha é ativada, liberando um gás sonífero!\n")
            escreva("Você desmaia e acorda no início da floresta.\n")
            retorne
        }

        se (respostaSalao == "eco")
        {
            escreva("\nO caminho à sua frente se abre, levando-o ao desafio final.\n")
            pontuacao = pontuacao + PONTOS_SALAO_REFLEXO
            escreva("Você ganhou ", PONTOS_SALAO_REFLEXO, " pontos. Pontuação atual: ", pontuacao, "\n")
            se (verificarPontuacao())
            {
                retorne
            }
            desafioGuardiaoTemplo()
        }
        senao
        {
            escreva("\nAs paredes começam a se mover, e você é forçado a recuar ao início do templo.\n")
            pontuacao = pontuacao - PENALIDADE_SALAO_REFLEXO
            escreva("Você perdeu ", PENALIDADE_SALAO_REFLEXO, " pontos. Pontuação atual: ", pontuacao, "\n")
            se (verificarPontuacao())
            {
                retorne
            }
            desafioSalaoReflexoes()
        }
    }

    /**
     * @brief Desafia o jogador com o Guardião do Templo.
     *
     * O jogador deve escolher entre dois cálices, um correto e outro que resulta em penalidades.
     */
    funcao desafioGuardiaoTemplo()
    {
        escreva("\nVocê encontra o Guardião do Templo.\n")
        escreva("Ele diz:\n")
        escreva("\"Prove seu valor escolhendo sabiamente. À sua frente estão dois cálices: Um de madeira e um de ouro. Um concede o tesouro que você busca, o outro o amaldiçoa a vagar pela floresta para sempre.\"\n")

        cadeia escolhaCalice
        escreva("Escolha um cálice ('Madeira' ou 'Ouro'): ") // Entendedores entenderão
        leia(escolhaCalice)
        escolhaCalice = tx.caixa_baixa(escolhaCalice)

        se (verificarEventoAleatorio())
        {
            escreva("\nO guardião decide testá-lo ainda mais e o envia de volta ao início da floresta!\n")
            retorne
        }

        escolha (escolhaCalice)
        {
            caso "madeira":
                escreva("\nVocê escolheu o cálice correto! O tesouro é seu.\n")
                pontuacao = pontuacao + PONTOS_GUARDIAO_TESOURO
                escreva("Você ganhou ", PONTOS_GUARDIAO_TESOURO, " pontos. Pontuação final: ", pontuacao, "\n")
                escreva("Parabéns! Você venceu a aventura!\n")
                jogoEmExecucao = falso
                pare
            caso "ouro":
                escreva("\nUma maldição é desencadeada! Você é enviado de volta ao início do templo.\n")
                pontuacao = pontuacao - PENALIDADE_GUARDIAO_MALDICAO
                escreva("Você perdeu ", PENALIDADE_GUARDIAO_MALDICAO, " pontos. Pontuação atual: ", pontuacao, "\n")
                se (verificarPontuacao())
                {
                    retorne
                }
                desafioGuardiaoTemplo()
                pare
            caso contrario:
                escreva("Opção inválida. Tente novamente.\n")
                desafioGuardiaoTemplo()
                pare
        }
    }
}
