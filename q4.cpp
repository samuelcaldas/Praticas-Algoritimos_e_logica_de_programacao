/**
 * Classificacao de alunos
 * Programa para classificar alunos com base em suas medias.
 * Ele coleta os dados dos alunos, calcula as medias, classifica-os,
 * atribui rankings e grava os dados em um arquivo.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_NOME 100    /* Comprimento maximo do nome do aluno */
#define MAX_ALUNOS 50   /* N�mero maximo de alunos */

 /**
  * @struct Aluno
  * @brief Representa um aluno com nome, medias das disciplinas, media geral e classifica��o.
  */
typedef struct {
    char nome[MAX_NOME];          /* Nome do aluno */
    float media_disciplina1;      /* Media da disciplina 1 */
    float media_disciplina2;      /* Media da disciplina 2 */
    float media_geral;            /* Media geral */
    int classificacao;            /* Classifica��o do aluno na turma */
} Aluno;

/**
 * @brief Calcula a media geral de um aluno com base nas medias de duas disciplinas.
 *
 * @param media_disciplina1 Media da primeira disciplina.
 * @param media_disciplina2 Media da segunda disciplina.
 * @return A media geral.
 */
float calcularMediaGeral(float media_disciplina1, float media_disciplina2) {
    return (media_disciplina1 + media_disciplina2) / 2.0;
}

/**
 * @brief Fun��o de compara��o para qsort para ordenar alunos em ordem decrescente de media geral.
 *
 * @param a Ponteiro para o primeiro aluno.
 * @param b Ponteiro para o segundo aluno.
 * @return Valor negativo se a media de b for maior que a de a, positivo se a de a for maior, zero se iguais.
 */
int compararMedias(const void* a, const void* b)
{
    const Aluno* alunoA = (const Aluno*)a;
    const Aluno* alunoB = (const Aluno*)b;
    if (alunoA->media_geral < alunoB->media_geral) {
        return 1;  // Trocar posi��es
    }
    else if (alunoA->media_geral > alunoB->media_geral) {
        return -1;
    }
    else {
        return 0;
    }
}

/**
 * @brief Escreve os dados dos alunos em um arquivo.
 *
 * @param alunos Array de alunos.
 * @param num_alunos N�mero de alunos.
 * @param nome_arquivo Nome do arquivo de sa�da.
 * @param media_geral_turma Media geral da turma.
 */
void escreverDadosNoArquivo(Aluno* alunos, int num_alunos, const char* nome_arquivo, float media_geral_turma)
{
    FILE* arquivo = fopen(nome_arquivo, "w");
    if (arquivo == NULL) {
        printf("Erro ao abrir o arquivo %s para escrita.\n", nome_arquivo);
        exit(1);
    }

    for (int i = 0; i < num_alunos; i++) {
        fprintf(arquivo, "Nome: %s\n", alunos[i].nome);
        fprintf(arquivo, "Media disciplina 1: %.2f\n", alunos[i].media_disciplina1);
        fprintf(arquivo, "Media disciplina 2: %.2f\n", alunos[i].media_disciplina2);
        fprintf(arquivo, "Media Geral: %.2f\n", alunos[i].media_geral);
        fprintf(arquivo, "Classifica��o: %d\n\n", alunos[i].classificacao);
    }
    fprintf(arquivo, "Media geral da turma: %.2f\n", media_geral_turma);

    fclose(arquivo);
}

/**
 * @brief Fun��o principal que coordena a execu��o do programa.
 *
 * @return Status de sa�da do programa.
 */
int main()
{
    int num_alunos;                 /* N�mero de alunos a serem registrados */
    Aluno alunos[MAX_ALUNOS];       /* Array para armazenar os dados dos alunos */
    float soma_medias = 0.0;        /* Soma das medias de todos os alunos */
    float media_geral_turma = 0.0;  /* Media geral da turma */

    // Pergunta ao usuario o n�mero de alunos
    printf("Quantos alunos deseja registrar? (maximo %d): ", MAX_ALUNOS);
    scanf("%d", &num_alunos);

    // Valida o n�mero de alunos
    if (num_alunos < 1 || num_alunos > MAX_ALUNOS) {
        printf("N�mero invalido de alunos.\n");
        return 1;
    }

    // Limpa o buffer de entrada
    getchar();

    // Entrada de dados para cada aluno
    for (int i = 0; i < num_alunos; i++) {
        printf("Aluno %d:\n", i + 1);

        // Obtem o nome do aluno
        printf("Nome: ");
        fgets(alunos[i].nome, MAX_NOME, stdin);
        // Remove o caractere de nova linha, se presente
        size_t len = strlen(alunos[i].nome);
        if (len > 0 && alunos[i].nome[len - 1] == '\n') {
            alunos[i].nome[len - 1] = '\0';
        }

        // Obtem a media da disciplina 1
        printf("Media disciplina 1: ");
        scanf("%f", &alunos[i].media_disciplina1);

        // Obtem a media da disciplina 2
        printf("Media disciplina 2: ");
        scanf("%f", &alunos[i].media_disciplina2);

        // Calcula a media geral
        alunos[i].media_geral = calcularMediaGeral(alunos[i].media_disciplina1, alunos[i].media_disciplina2);
        soma_medias += alunos[i].media_geral;

        // Limpa o buffer de entrada
        getchar();

        printf("\n");
    }

    // Ordena os alunos por media geral em ordem decrescente
    qsort(alunos, num_alunos, sizeof(Aluno), compararMedias);

    // Atribui classifica��es com base na ordem ordenada
    for (int i = 0; i < num_alunos; i++) {
        alunos[i].classificacao = i + 1;
    }

    // Calcula a media geral da turma
    media_geral_turma = soma_medias / num_alunos;

    // Exibe os dados dos alunos ordenados
    for (int i = 0; i < num_alunos; i++) {
        printf("Aluno %d:\n", i + 1);
        printf("Nome: %s\n", alunos[i].nome);
        printf("Media disciplina 1: %.2f\n", alunos[i].media_disciplina1);
        printf("Media disciplina 2: %.2f\n", alunos[i].media_disciplina2);
        printf("Media Geral: %.2f\n", alunos[i].media_geral);
        printf("Classifica��o: %d\n\n", alunos[i].classificacao);
    }

    // Grava os dados no arquivo
    escreverDadosNoArquivo(alunos, num_alunos, "notas_alunos.txt", media_geral_turma);

    printf("Dados salvos no arquivo 'notas_alunos.txt'.\n");

    return 0;
}
