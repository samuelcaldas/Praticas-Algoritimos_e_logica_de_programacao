/*
 * Programa de Aprova��o de Emprestimo
 * Este programa analisa as informa��es financeiras fornecidas pelos clientes e determina
 * se um emprestimo pode ser aprovado com base em criterios pre-definidos.
 *
 * Autor: [Seu Nome]
 * Data: [Data Atual]
 */

#include <stdio.h>
#include <stdlib.h> // para system("cls");
#include <string.h>
#include <ctype.h>

#define HISTORICO_CREDITO_BOM 'B'
#define HISTORICO_CREDITO_RUIM 'R'
#define ESTABILIDADE_EMPREGADO_ESTAVEL 'E'
#define ESTABILIDADE_EMPREGADO_INSTAVEL 'I'
#define TAMANHO_MAXIMO_MOTIVO 512

 // Prototipos das fun��es
int verificarValorEmprestimo(float valorEmprestimo, float valorMaximoEmprestimo, char* motivosRejeicao);
int verificarHistoricoCredito(char historicoCredito, char* motivosRejeicao);
int verificarEstabilidadeEmprego(char estabilidadeEmprego, char* motivosRejeicao);
int verificarValorEntrada(float valorEmprestimo, float valorEntrada, char* motivosRejeicao);

int main() {
    // Declarar variaveis
    float rendaMensal = 0.0f;
    float valorEmprestimo = 0.0f;
    char historicoCredito = '\0';
    char estabilidadeEmprego = '\0';
    float valorEntrada = 0.0f;
    float valorMaximoEmprestimo = 0.0f;

    // Limpar a tela
    system("cls");
    printf("  **  Emprestimo Financeiro  **  \n");

    // Ler as informa��es necessarias
    printf("Digite sua renda mensal......................................: ");
    scanf("%f", &rendaMensal);
    printf("Digite o valor do emprestimo.................................: ");
    scanf("%f", &valorEmprestimo);

    // Limpar o buffer de entrada antes de ler os caracteres
    while ((getchar()) != '\n'); // Limpar o buffer de entrada

    printf("Digite seu historico de credito (B=Bom, R=Ruim)..............: ");
    scanf(" %c", &historicoCredito);
    historicoCredito = toupper(historicoCredito);

    printf("Digite sua estabilidade no emprego (E=Estavel, I=Instavel)...: ");
    scanf(" %c", &estabilidadeEmprego);
    estabilidadeEmprego = toupper(estabilidadeEmprego);

    printf("Digite o valor da entrada....................................: ");
    scanf("%f", &valorEntrada);

    // Calcular o valor maximo do emprestimo (30% da renda mensal)
    valorMaximoEmprestimo = rendaMensal * 0.30f;

    // Determinar a aprova��o do emprestimo
    int emprestimoAprovado = 1; // Assume que o emprestimo e aprovado inicialmente
    char motivosRejeicao[TAMANHO_MAXIMO_MOTIVO] = "";

    // Realizar verifica��es
    if (!verificarValorEmprestimo(valorEmprestimo, valorMaximoEmprestimo, motivosRejeicao)) {
        emprestimoAprovado = 0;
    }
    if (!verificarHistoricoCredito(historicoCredito, motivosRejeicao)) {
        emprestimoAprovado = 0;
    }
    if (!verificarEstabilidadeEmprego(estabilidadeEmprego, motivosRejeicao)) {
        emprestimoAprovado = 0;
    }
    if (!verificarValorEntrada(valorEmprestimo, valorEntrada, motivosRejeicao)) {
        emprestimoAprovado = 0;
    }

    // Exibir o resultado
    if (emprestimoAprovado) {
        printf("Parabens! Seu emprestimo foi aprovado.\n");
    }
    else {
        printf("Desculpe, seu emprestimo foi rejeitado.\n");
        printf("Motivo(s):\n%s", motivosRejeicao);
    }

    printf("Fim do Programa!\n");

    return 0;
}

/**
 * @brief Verifica se o valor do emprestimo n�o excede 30% da renda mensal.
 *
 * @param valorEmprestimo O valor solicitado do emprestimo.
 * @param valorMaximoEmprestimo O valor maximo permitido com base na renda mensal.
 * @param motivosRejeicao A string para armazenar os motivos da rejei��o, se houver.
 * @return int Retorna 1 se o valor do emprestimo for aceitavel, 0 caso contrario.
 */
int verificarValorEmprestimo(float valorEmprestimo, float valorMaximoEmprestimo, char* motivosRejeicao) {
    if (valorEmprestimo > valorMaximoEmprestimo) {
        strcat(motivosRejeicao, "O valor do emprestimo excede 30% da sua renda mensal.\n");
        return 0;
    }
    return 1;
}

/**
 * @brief Verifica se o historico de credito do cliente e aceitavel.
 *
 * @param historicoCredito O historico de credito do cliente ('B' para bom, 'R' para ruim).
 * @param motivosRejeicao A string para armazenar os motivos da rejei��o, se houver.
 * @return int Retorna 1 se o historico de credito for aceitavel, 0 caso contrario.
 */
int verificarHistoricoCredito(char historicoCredito, char* motivosRejeicao) {
    if (historicoCredito == HISTORICO_CREDITO_RUIM) {
        strcat(motivosRejeicao, "Historico de credito ruim.\n");
        return 0;
    }
    return 1;
}

/**
 * @brief Verifica se a estabilidade no emprego do cliente e aceitavel.
 *
 * @param estabilidadeEmprego A estabilidade no emprego do cliente ('E' para estavel, 'I' para instavel).
 * @param motivosRejeicao A string para armazenar os motivos da rejei��o, se houver.
 * @return int Retorna 1 se a estabilidade no emprego for aceitavel, 0 caso contrario.
 */
int verificarEstabilidadeEmprego(char estabilidadeEmprego, char* motivosRejeicao) {
    if (estabilidadeEmprego == ESTABILIDADE_EMPREGADO_INSTAVEL) {
        strcat(motivosRejeicao, "Estabilidade no emprego instavel.\n");
        return 0;
    }
    return 1;
}

/**
 * @brief Verifica se o valor da entrada e suficiente para o emprestimo.
 *
 * @param valorEmprestimo O valor solicitado do emprestimo.
 * @param valorEntrada O valor da entrada fornecida pelo cliente.
 * @param motivosRejeicao A string para armazenar os motivos da rejei��o, se houver.
 * @return int Retorna 1 se o valor da entrada for suficiente, 0 caso contrario.
 */
int verificarValorEntrada(float valorEmprestimo, float valorEntrada, char* motivosRejeicao) {
    float valorMinimoEntrada = valorEmprestimo * 0.20f;
    if (valorEntrada < valorMinimoEntrada) {
        strcat(motivosRejeicao, "O valor da entrada e insuficiente (m�nimo de 20% do valor do emprestimo).\n");
        return 0;
    }
    return 1;
}