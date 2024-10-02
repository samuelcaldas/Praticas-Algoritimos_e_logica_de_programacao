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
    // Limpar a tela
    system("cls");
    printf("  **  Emprestimo Financeiro  **  \n");

    // Declarar vari�veis
    float rendaMensal = 0.0f;
    float valorEmprestimo = 0.0f;
    char historicoCredito = '\0';
    char estabilidadeEmprego = '\0';
    float valorEntrada = 0.0f;
    float valorMaximoEmprestimo = 0.0f;

    // Ler as informa��es necess�rias
    printf("Digite sua renda mensal......................................: ");
    scanf("%f", &rendaMensal);
    printf("Digite o valor do emprestimo.................................: ");
    scanf("%f", &valorEmprestimo);

    // Limpar o buffer de entrada antes de ler os caracteres
    while ((getchar()) != '\n'); // Limpar o buffer de entrada

    printf("Digite seu historico de credito (B=Bom, R=Ruim)..............: ");
    scanf(" %c", &historicoCredito);
    historicoCredito = toupper(historicoCredito);

    printf("Digite sua estabilidade no emprego (E=Est�vel, I=Inst�vel)...: ");
    scanf(" %c", &estabilidadeEmprego);
    estabilidadeEmprego = toupper(estabilidadeEmprego);

    printf("Digite o valor da entrada....................................: ");
    scanf("%f", &valorEntrada);

    // Calcular o valor m�ximo do emprestimo (30% da renda mensal)
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

/*
 * Fun��o: verificarValorEmprestimo
 * --------------------------------
 * Verifica se o valor do emprestimo n�o excede 30% da renda mensal.
 *
 * valorEmprestimo: O valor solicitado do emprestimo.
 * valorMaximoEmprestimo: O valor m�ximo permitido com base na renda.
 * motivosRejeicao: A string para anexar os motivos da rejei��o.
 *
 * retorna: 1 se o valor do emprestimo for aceit�vel, 0 caso contr�rio.
 */
int verificarValorEmprestimo(float valorEmprestimo, float valorMaximoEmprestimo, char* motivosRejeicao) {
    if (valorEmprestimo > valorMaximoEmprestimo) {
        strcat(motivosRejeicao, "O valor do emprestimo excede 30% da sua renda mensal.\n");
        return 0;
    }
    return 1;
}

/*
 * Fun��o: verificarHistoricoCredito
 * ---------------------------------
 * Verifica se o historico de credito e aceit�vel.
 *
 * historicoCredito: O historico de credito do cliente ('B' para bom, 'R' para ruim).
 * motivosRejeicao: A string para anexar os motivos da rejei��o.
 *
 * retorna: 1 se o historico de credito for aceit�vel, 0 caso contr�rio.
 */
int verificarHistoricoCredito(char historicoCredito, char* motivosRejeicao) {
    if (historicoCredito == HISTORICO_CREDITO_RUIM) {
        strcat(motivosRejeicao, "Historico de credito ruim.\n");
        return 0;
    }
    return 1;
}

/*
 * Fun��o: verificarEstabilidadeEmprego
 * ------------------------------------
 * Verifica se a estabilidade no emprego do cliente e aceit�vel.
 *
 * estabilidadeEmprego: A estabilidade no emprego do cliente ('E' para est�vel, 'I' para inst�vel).
 * motivosRejeicao: A string para anexar os motivos da rejei��o.
 *
 * retorna: 1 se a estabilidade no emprego for aceit�vel, 0 caso contr�rio.
 */
int verificarEstabilidadeEmprego(char estabilidadeEmprego, char* motivosRejeicao) {
    if (estabilidadeEmprego == ESTABILIDADE_EMPREGADO_INSTAVEL) {
        strcat(motivosRejeicao, "Estabilidade no emprego inst�vel.\n");
        return 0;
    }
    return 1;
}

/*
 * Fun��o: verificarValorEntrada
 * -----------------------------
 * Verifica se o valor da entrada e suficiente.
 *
 * valorEmprestimo: O valor solicitado do emprestimo.
 * valorEntrada: O valor da entrada fornecida.
 * motivosRejeicao: A string para anexar os motivos da rejei��o.
 *
 * retorna: 1 se o valor da entrada for suficiente, 0 caso contr�rio.
 */
int verificarValorEntrada(float valorEmprestimo, float valorEntrada, char* motivosRejeicao) {
    float valorMinimoEntrada = valorEmprestimo * 0.20f;
    if (valorEntrada < valorMinimoEntrada) {
        strcat(motivosRejeicao, "O valor da entrada e insuficiente (m�nimo de 20% do valor do emprestimo).\n");
        return 0;
    }
    return 1;
}