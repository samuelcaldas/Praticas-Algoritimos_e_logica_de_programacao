programa {
/*
 * Jogo de Exploração no Labirinto
 * 
 * Objetivo:
 *   Guiar o explorador através de um labirinto gerado aleatoriamente até encontrar o tesouro,
 *   evitando armadilhas e paredes.
 * 
 * Regras:
 *   - O labirinto é uma matriz 10x10.
 *   - Paredes (1) ocupam no máximo 1/3 das células.
 *   - Armadilhas (3) estão presentes em 1 a cada 5 células.
 *   - O tesouro (2) é colocado em uma posição aleatória.
 *   - O explorador começa em uma posição aleatória.
 *   - Se o explorador cair em uma armadilha, retorna ao início.
 * 
 * Controles:
 *   - W: Mover para cima
 *   - S: Mover para baixo
 *   - A: Mover para a esquerda
 *   - D: Mover para a direita
 *   - I: Iniciar o jogo
 *   - S: Sair do jogo
 * 
 * Autor: Samuel Caldas
 * Data: 20/09/2024
 */

inclua biblioteca Util --> u
inclua biblioteca Texto --> tx

const inteiro TAMANHO = 10
const inteiro PAREDES = 5
const inteiro ARMADILHAS = 10
const inteiro PAREDE = 1
const inteiro TESOURO = 2
const inteiro CAMINHO_LIVRE = 0
const inteiro ARMADILHA = 3

// Variáveis Globais
inteiro labirinto[TAMANHO][TAMANHO]
inteiro posX, posY
inteiro posInicioX, posInicioY
inteiro tesouroX, tesouroY
logico debug = falso

// Função Principal
funcao inicio()
{
    inicializarLabirinto()
    gerarLabirinto()
    
    se (nao debug)
    {
        se(exibirTelaInicial())
        {
            retorne
        }
        exibirTextoInicial()
    }
    
    faca
    {
        limpa()
        exibirLabirinto()
        se (debug)
        {
            escreva("Explorador está na posição: (", posX, ", ", posY, ")\n")
        }
        
        se (labirinto[posX][posY] == TESOURO)
        {
            limpa()
            escreva("Parabéns! Você encontrou o tesouro!\n")
            escreva("Tesouro encontrado na posição: (", posX, ", ", posY, ")\n")
            retorne
        }
        senao se (labirinto[posX][posY] == ARMADILHA)
        {
            limpa()
            escreva("Você caiu em uma armadilha! Voltando ao início...\n")
            u.aguarde(1000)
            limpa()
            posX = posInicioX
            posY = posInicioY
            exibirLabirinto()
        }
        
        escolherDirecao()
    } enquanto (verdadeiro)
}

// Função para Inicializar o Labirinto com Caminhos Livres
funcao inicializarLabirinto()
{
    inteiro i, j
    para (i = 0; i < TAMANHO; i++)
    {
        para (j = 0; j < TAMANHO; j++)
        {
            labirinto[i][j] = CAMINHO_LIVRE
        }
    }
}

// Função para Gerar Aleatoriamente o Labirinto
funcao gerarLabirinto()
{
    inteiro totalCelulas = TAMANHO * TAMANHO
    inteiro maxParedes = totalCelulas / PAREDES
    inteiro totalArmadi = totalCelulas / ARMADILHAS
    inteiro i, j
    
    // Colocar Paredes
    para (i = 0; i < maxParedes; i++)
    {
        j = u.sorteia(0, TAMANHO - 1)
        inteiro k = u.sorteia(0, TAMANHO - 1)
        se (labirinto[j][k] == CAMINHO_LIVRE)
        {
            labirinto[j][k] = PAREDE
        }
        senao
        {
            i-- // Tentar novamente se a célula já não está livre
        }
    }
    
    // Colocar Armadilhas
    para (i = 0; i < totalArmadi; i++)
    {
        j = u.sorteia(0, TAMANHO - 1)
        inteiro k = u.sorteia(0, TAMANHO - 1)
        se (labirinto[j][k] == CAMINHO_LIVRE)
        {
            labirinto[j][k] = ARMADILHA
        }
        senao
        {
            i-- // Tentar novamente se a célula já não está livre
        }
    }
    
    // Colocar Tesouro
    tesouroX = u.sorteia(0, TAMANHO - 1)
    tesouroY = u.sorteia(0, TAMANHO - 1)
    labirinto[tesouroX][tesouroY] = TESOURO
    
    // Definir Posição Inicial do Explorador
    posX = u.sorteia(0, TAMANHO - 1)
    posY = u.sorteia(0, TAMANHO - 1)
    enquanto (labirinto[posX][posY] != CAMINHO_LIVRE)
    {
        posX = u.sorteia(0, TAMANHO - 1)
        posY = u.sorteia(0, TAMANHO - 1)
    }
    
    posInicioX = posX
    posInicioY = posY
    
    // Verificar se existe um caminho até o tesouro
    se (nao existeCaminho(posInicioX, posInicioY, tesouroX, tesouroY))
    {
        inicializarLabirinto()
        gerarLabirinto()
    }
}

// Função para Exibir a Tela Inicial
funcao logico exibirTelaInicial()
{
    limpa()
    escreva("******************************************\n")
    escreva("*    Bem-vindo ao Labirinto do Tesouro!  *\n")
    escreva("******************************************\n\n")
    escreva("Instruções:\n")
    escreva(" - Use W (cima), S (baixo), A (esquerda), D (direita) para mover.\n")
    escreva(" - Encontre o tesouro [T] evitando paredes [#] e armadilhas [~].\n")
    escreva(" - Pressione 'I' para iniciar ou 'S' para sair.\n\n")
    
    cadeia escolhaUsuario
    leia(escolhaUsuario)
    
    enquanto (tx.caixa_baixa(escolhaUsuario) != "i" e tx.caixa_baixa(escolhaUsuario) != "s")
    {
        escreva("Opção inválida! Pressione 'I' para iniciar ou 'S' para sair.\n")
        leia(escolhaUsuario)
    }
    
    se (tx.caixa_baixa(escolhaUsuario) == "s")
    {
        escreva("Saindo do jogo. Até a próxima!\n")
        retorne verdadeiro
    }
    retorne falso
}

funcao exibirTextoInicial()
{
    limpa()
    escreva("************************************************************************************\n")
    escreva("Você acorda no meio de um labirinto sinistro, onde os corredores são estreitos, os caminhos são confusos e as armadilhas... bom, as armadilhas são maldosas.\n\n")
    escreva("Sua missão, se você for corajoso o suficiente para aceitá-la, é simples: encontrar o tesouro escondido antes que o labirinto encontre você.\n\n")
    escreva("Mas cuidado! Nem todos os caminhos levam à glória – alguns são becos sem saída e outros podem levá-lo direto de volta ao início.\n")
    escreva("Ah, e só para deixar as coisas mais interessantes... o tesouro nunca está no mesmo lugar duas vezes. Porque, sabe como é, facilidades não são o nosso forte!\n\n")
    escreva("Prepare-se, aventureiro! O labirinto aguarda. Boa sorte, você vai precisar...\n\n")
    escreva("************************************************************************************\n")
    u.aguarde(2000)
    limpa()
}

// Função para Exibir o Labirinto
funcao exibirLabirinto()
{
    escreva("\n")
    inteiro i, j
    para (i = 0; i < TAMANHO; i++)
    {
        para (j = 0; j < TAMANHO; j++)
        {
            se (i == posX e j == posY)
            {
                escreva("[E]") // Representa o Explorador
            }
            senao se (labirinto[i][j] == PAREDE)
            {
                escreva("[#]")
            }
            senao se (labirinto[i][j] == TESOURO)
            {
                escreva("[T]")
            }
            senao se (labirinto[i][j] == ARMADILHA)
            {
                escreva("[~]")
            }
            senao
            {
                escreva("[ ]")
            }
        }
        escreva("\n")
    }
    
    // Legenda
    escreva("\nLegenda: [E] - Explorador | [#] - Parede | [T] - Tesouro | [~] - Armadilha | [ ] - Caminho Livre\n")
}

// Função para Escolher Direção
funcao escolherDirecao()
{
    cadeia direcao
    escreva("\nEscolha a direção (W/A/S/D): ")
    leia(direcao)
    direcao = tx.caixa_baixa(direcao)
    
    escolha (direcao)
    {
        caso "w":
            moverCima()
            pare
        caso "s":
            moverBaixo()
            pare
        caso "a":
            moverEsquerda()
            pare
        caso "d":
            moverDireita()
            pare
        caso "s":
            pare
        caso contrario:
            escreva("Direção inválida! Use W, A, S ou D.\n")
            pare
    }
}

// Função para Mover para Cima
funcao moverCima()
{
    se (posX > 0)
    {
        se (labirinto[posX - 1][posY] != PAREDE)
        {
            posX = posX - 1
        }
    }
}

// Função para Mover para Baixo
funcao moverBaixo()
{
    se (posX < TAMANHO - 1)
    {
        se (labirinto[posX + 1][posY] != PAREDE)
        {
            posX = posX + 1
        }
    }
}

// Função para Mover para Esquerda
funcao moverEsquerda()
{
    se (posY > 0)
    {
        se (labirinto[posX][posY - 1] != PAREDE)
        {
            posY = posY - 1
        }
    }
}

// Função para Mover para Direita
funcao moverDireita()
{
    se (posY < TAMANHO - 1)
    {
        se (labirinto[posX][posY + 1] != PAREDE)
        {
            posY = posY + 1
        }
    }
}

// Função para Verificar se Existe um Caminho Livre até o Tesouro (BFS)
funcao logico existeCaminho(inteiro inicioX, inteiro inicioY, inteiro destinoX, inteiro destinoY)
{
    inteiro linhas = u.numero_linhas(labirinto)
    inteiro colunas = u.numero_colunas(labirinto)

    // Verifica se os pontos estão dentro dos limites do labirinto
    se (inicioX < 0 ou inicioX >= linhas ou inicioY < 0 ou inicioY >= colunas)
    {
        retorne falso
    }

    se (destinoX < 0 ou destinoX >= linhas ou destinoY < 0 ou destinoY >= colunas)
    {
        retorne falso
    }

    // Verifica se os pontos inicial e destino não são paredes ou armadilhas
    se (labirinto[inicioX][inicioY] == PAREDE ou labirinto[inicioX][inicioY] == ARMADILHA)
    {
        retorne falso
    }

    se (labirinto[destinoX][destinoY] == PAREDE ou labirinto[destinoX][destinoY] == ARMADILHA)
    {
        retorne falso
    }

    // Inicializa a matriz de visitados
    logico visitado[linhas][colunas]

    para (inteiro i = 0; i < linhas; i++)
    {
        para (inteiro j = 0; j < colunas; j++)
        {
            visitado[i][j] = falso
        }
    }

    // Fila para BFS
    inteiro tamanhoFila = linhas * colunas
    inteiro filaX[tamanhoFila]
    inteiro filaY[tamanhoFila]

    inteiro frente = 0
    inteiro tras = 0

    // Enfileira a posição inicial
    filaX[tras] = inicioX
    filaY[tras] = inicioY
    tras = tras + 1

    visitado[inicioX][inicioY] = verdadeiro

    // Vetores de movimento para as quatro direções
    inteiro dx[4]
    inteiro dy[4]

    dx[0] = -1  
    dy[0] = 0    // cima
    dx[1] = 1  
    dy[1] = 0    // baixo
    dx[2] = 0  
    dy[2] = -1   // esquerda
    dx[3] = 0  
    dy[3] = 1    // direita

    // Implementação do BFS
    enquanto (frente < tras)
    {
        inteiro x = filaX[frente]
        inteiro y = filaY[frente]
        frente = frente + 1

        se (x == destinoX e y == destinoY)
        {
            retorne verdadeiro  // Caminho encontrado
        }

        para (inteiro i = 0; i < 4; i++)
        {
            inteiro novoX = x + dx[i]
            inteiro novoY = y + dy[i]

            // Verifica se a nova posição está dentro dos limites
            se (novoX >= 0 e novoX < linhas e novoY >= 0 e novoY < colunas)
            {
                // Verifica se a posição é caminhável e não foi visitada
                se (labirinto[novoX][novoY] != PAREDE e labirinto[novoX][novoY] != ARMADILHA e nao visitado[novoX][novoY])
                {
                    visitado[novoX][novoY] = verdadeiro
                    filaX[tras] = novoX
                    filaY[tras] = novoY
                    tras = tras + 1
                }
            }
        }
    }

    retorne falso  // Caminho não encontrado
}

}
