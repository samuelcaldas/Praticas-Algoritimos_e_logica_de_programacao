programa
{
    // Inclui a biblioteca Util para uso de funções de aleatoriedade
    inclua biblioteca Util --> u

    // Inclui a biblioteca Texto para manipular strings
    inclua biblioteca Texto --> tx

    // Constantes para os valores de pontos
    const inteiro PONTOS_CAMINHO_SOMBRAS = 100
    const inteiro PONTOS_CAMINHO_LUZ = 50
    const inteiro PONTOS_CAMINHO_CRIATURAS = 75
    const inteiro PONTOS_SALAO_REFLEXO = 150
    const inteiro PONTOS_GUARDIAO_TESOURO = 200
    const inteiro PENALIDADE_SALAO_REFLEXO = 50
    const inteiro PENALIDADE_GUARDIAO_MALDICAO = 100

    // Variáveis globais para a pontuação e controle do jogo
    inteiro pontuacao = 0
    logico jogoEmExecucao = verdadeiro

    funcao inicio()
    {
        // Loop principal do jogo
        enquanto (jogoEmExecucao)
        {
            exibirIntroducao()
            escolherCaminho()

            se (pontuacao > 0)
            {
                avancarParaTemplo()
            }
            se (pontuacao < 0)
            {
                escreva("\nSua pontuação ficou negativa. Você perdeu o jogo.\n")
                jogoEmExecucao = falso
            }
        }
    }

    // Função para exibir a introdução do jogo
    funcao exibirIntroducao()
    {
        escreva("Você é um explorador corajoso que se aventura em uma misteriosa Floresta Sussurrante em busca de tesouros lendários e segredos perdidos.\n")
        escreva("Ao adentrar na floresta, você se depara com três caminhos diferentes:\n")
        escreva("1. O Caminho das Sombras\n")
        escreva("2. O Caminho da Luz\n")
        escreva("3. O Caminho das Criaturas\n")
    }

    // Função para o jogador escolher um caminho
    funcao escolherCaminho()
    {
        inteiro opcaoCaminho

        escreva("\nEscolha um caminho (1, 2, ou 3): ")
        leia(opcaoCaminho)

        // Evento aleatório de desmaio
        se (verificarEventoAleatorio())
        {
            limpa()
            escreva("\nVocê sentiu uma tontura repentina e desmaiou...\n")
            escreva("Você acorda novamente no início da floresta.\n")
            // Pontuação permanece inalterada
            retorne
        }

        escolha (opcaoCaminho)
        {
            caso 1:
                caminhoDasSombras()
                pare
            caso 2:
                limpa()
                caminhoDaLuz()
                pare
            caso 3:
                limpa()
                caminhoDasCriaturas()
                pare
            caso contrario:
                limpa()
                escreva("Escolha inválida. Por favor, selecione um caminho válido.\n")
                escolherCaminho()
                pare
        }
    }

    // Função para gerar um evento aleatório
    funcao logico verificarEventoAleatorio()
    {
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

    // Função para verificar a pontuação e finalizar o jogo se necessário
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

    // Função para o Caminho das Sombras
    funcao caminhoDasSombras()
    {
        limpa()
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
            limpa()
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
            escolherCaminho()
        }
    }

    // Função para o Caminho da Luz
    funcao caminhoDaLuz()
    {
        limpa()
        escreva("\nVocê escolheu o Caminho da Luz.\n")
        escreva("Este caminho é iluminado por raios de sol que filtram entre as copas das árvores.\n")
        escreva("Você encontra uma ponte quebrada sobre um rio turbulento.\n")
        escreva("Digite 'atravessar' para tentar atravessar a ponte quebrada ou 'desvio' para procurar um caminho seguro: ")

        cadeia decisaoPonte
        leia(decisaoPonte)
        decisaoPonte = tx.caixa_baixa(decisaoPonte)

        se (verificarEventoAleatorio())
        {
            limpa()
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
            escolherCaminho()
        }
        senao
        {
            escreva("Opção inválida. Tente novamente.\n")
            caminhoDaLuz()
            retorne
        }
    }

    // Função para o Caminho das Criaturas
    funcao caminhoDasCriaturas()
    {
        limpa()
        escreva("\nVocê escolheu o Caminho das Criaturas.\n")
        escreva("Este caminho é repleto de sons estranhos e pegadas misteriosas no chão.\n")
        escreva("Você se depara com uma criatura mágica adormecida bloqueando o caminho.\n")
        escreva("Digite 'contornar' para tentar contornar a criatura ou 'acordar' para acordá-la: ")

        cadeia decisaoCriatura
        leia(decisaoCriatura)
        decisaoCriatura = tx.caixa_baixa(decisaoCriatura)

        se (verificarEventoAleatorio())
        {
            limpa()
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
            escolherCaminho()
        }
        senao
        {
            escreva("Opção inválida. Tente novamente.\n")
            caminhoDasCriaturas()
            retorne
        }
    }

    // Função para avançar para o Templo dos Ecos
    funcao avancarParaTemplo()
    {
        limpa()
        escreva("\nApós superar os desafios iniciais, você chega ao Templo dos Ecos.\n\n")
        desafioSalaoReflexoes()
    }

    // Função para o Desafio do Salão das Reflexões
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

    // Função para o Desafio do Guardião do Templo
    funcao desafioGuardiaoTemplo()
    {
        escreva("\nVocê encontra o Guardião do Templo.\n")
        escreva("Ele diz:\n")
        escreva("\"Prove seu valor escolhendo sabiamente. À sua frente estão dois cálices: 'A' e 'B'. Um concede o tesouro que você busca, o outro o amaldiçoa a vagar pela floresta para sempre.\"\n")

        cadeia escolhaCalice
        escreva("Escolha um cálice ('A' ou 'B'): ")
        leia(escolhaCalice)
        escolhaCalice = tx.caixa_baixa(escolhaCalice)


        se (verificarEventoAleatorio())
        {
            escreva("\nO guardião decide testá-lo ainda mais e o envia de volta ao início da floresta!\n")
            retorne
        }

        escolha (escolhaCalice)
        {
            caso "A":
                escreva("\nVocê escolheu o cálice correto! O tesouro é seu.\n")
                pontuacao = pontuacao + PONTOS_GUARDIAO_TESOURO
                escreva("Você ganhou ", PONTOS_GUARDIAO_TESOURO, " pontos. Pontuação final: ", pontuacao, "\n")
                escreva("Parabéns! Você venceu a aventura!\n")
                jogoEmExecucao = falso
                pare
            caso "B":
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

    // Função para gerar um número aleatório dentro de um intervalo usando a biblioteca Util
    funcao inteiro sorteia(inteiro minimo, inteiro maximo)
    {
        inteiro numeroAleatorio = u.sorteia(minimo, maximo)
        retorne numeroAleatorio
    }
}
