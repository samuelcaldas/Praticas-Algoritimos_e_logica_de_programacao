/**
 * @file student_classification.c
 * @brief Program to classify students based on their average grades.
 *        It collects students' data, calculates averages, sorts them,
 *        assigns rankings, and writes data to a file.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_NOME 100    /**< Maximum length of the student's name */
#define MAX_ALUNOS 50   /**< Maximum number of students */

 /**
  * @struct Aluno
  * @brief Represents a student with name, subject averages, overall average, and classification.
  */
typedef struct {
    char nome[MAX_NOME];          /**< Student's name */
    float media_disciplina1;      /**< Average grade for subject 1 */
    float media_disciplina2;      /**< Average grade for subject 2 */
    float media_geral;            /**< Overall average grade */
    int classificacao;            /**< Student's rank in class */
} Aluno;

/**
 * @brief Calculates the overall average of a student based on the averages of two subjects.
 *
 * @param media_disciplina1 Average of the first subject.
 * @param media_disciplina2 Average of the second subject.
 * @return The overall average.
 */
float calcularMediaGeral(float media_disciplina1, float media_disciplina2) {
    return (media_disciplina1 + media_disciplina2) / 2.0;
}

/**
 * @brief Comparison function for qsort to sort students in descending order of overall average.
 *
 * @param a Pointer to the first student.
 * @param b Pointer to the second student.
 * @return Negative value if b's average is greater than a's, positive if a's is greater, zero if equal.
 */
int compararMedias(const void* a, const void* b)
{
    const Aluno* alunoA = (const Aluno*)a;
    const Aluno* alunoB = (const Aluno*)b;
    if (alunoA->media_geral < alunoB->media_geral) {
        return 1;  // Swap positions
    }
    else if (alunoA->media_geral > alunoB->media_geral) {
        return -1;
    }
    else {
        return 0;
    }
}

/**
 * @brief Writes the student data to a file.
 *
 * @param alunos Array of students.
 * @param num_alunos Number of students.
 * @param nome_arquivo Name of the output file.
 * @param media_geral_turma Overall average of the class.
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
        fprintf(arquivo, "Ordem: %d\n\n", alunos[i].classificacao);
    }
    fprintf(arquivo, "Media geral da turma: %.2f\n", media_geral_turma);

    fclose(arquivo);
}

/**
 * @brief Main function that orchestrates the program execution.
 *
 * @return Exit status of the program.
 */
int main()
{
    int num_alunos;                 /**< Number of students to be registered */
    Aluno alunos[MAX_ALUNOS];       /**< Array to store student data */
    float soma_medias = 0.0;        /**< Sum of all students' averages */
    float media_geral_turma = 0.0;  /**< Overall average of the class */

    // Ask the user for the number of students
    printf("Quantos alunos deseja registrar? (maximo %d): ", MAX_ALUNOS);
    scanf("%d", &num_alunos);

    // Validate the number of students
    if (num_alunos < 1 || num_alunos > MAX_ALUNOS) {
        printf("Numero invalido de alunos.\n");
        return 1;
    }

    // Clear input buffer
    getchar();

    // Input data for each student
    for (int i = 0; i < num_alunos; i++) {
        printf("Aluno %d:\n", i + 1);

        // Get student's name
        printf("Nome: ");
        fgets(alunos[i].nome, MAX_NOME, stdin);
        // Remove newline character if present
        size_t len = strlen(alunos[i].nome);
        if (len > 0 && alunos[i].nome[len - 1] == '\n') {
            alunos[i].nome[len - 1] = '\0';
        }

        // Get average grade for subject 1
        printf("Media disciplina 1: ");
        scanf("%f", &alunos[i].media_disciplina1);

        // Get average grade for subject 2
        printf("Media disciplina 2: ");
        scanf("%f", &alunos[i].media_disciplina2);

        // Calculate overall average
        alunos[i].media_geral = calcularMediaGeral(alunos[i].media_disciplina1, alunos[i].media_disciplina2);
        soma_medias += alunos[i].media_geral;

        // Clear input buffer
        getchar();

        printf("\n");
    }

    // Sort students by overall average in descending order
    qsort(alunos, num_alunos, sizeof(Aluno), compararMedias);

    // Assign classifications based on sorted order
    for (int i = 0; i < num_alunos; i++) {
        alunos[i].classificacao = i + 1;
    }

    // Calculate class overall average
    media_geral_turma = soma_medias / num_alunos;

    // Display sorted students' data
    for (int i = 0; i < num_alunos; i++) {
        printf("Aluno %d:\n", i + 1);
        printf("Nome: %s\n", alunos[i].nome);
        printf("Media disciplina 1: %.2f\n", alunos[i].media_disciplina1);
        printf("Media disciplina 2: %.2f\n", alunos[i].media_disciplina2);
        printf("Media Geral: %.2f\n", alunos[i].media_geral);
        printf("Ordem: %d\n\n", alunos[i].classificacao);
    }

    // Write data to file
    escreverDadosNoArquivo(alunos, num_alunos, "notas_alunos.txt", media_geral_turma);

    printf("Dados salvos no arquivo 'notas_alunos.txt'.\n");

    return 0;
}