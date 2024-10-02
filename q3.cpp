/*
 * Loan Approval Program
 * This program analyzes the financial information provided by clients and determines
 * if a loan can be approved based on predefined criteria.
 *
 * Author: [Your Name]
 * Date: [Current Date]
 */

#include <stdio.h>
#include <stdlib.h> // for system("cls");
#include <string.h>
#include <ctype.h>

#define CREDIT_HISTORY_GOOD 'B'
#define CREDIT_HISTORY_BAD 'R'
#define JOB_STABILITY_STABLE 'E'
#define JOB_STABILITY_UNSTABLE 'I'
#define MAX_REASON_LENGTH 512

 // Function prototypes
int checkLoanAmount(float loanAmount, float maxLoanAmount, char* rejectionReasons);
int checkCreditHistory(char creditHistory, char* rejectionReasons);
int checkJobStability(char jobStability, char* rejectionReasons);
int checkDownPayment(float loanAmount, float downPayment, char* rejectionReasons);

int main() {
	// Clear the screen
	system("cls");
	printf("  **  Emprestimo Financeiro  **  \n");

	// Declare variables
	float monthlyIncome = 0.0f;
	float loanAmount = 0.0f;
	char creditHistory = '\0';
	char jobStability = '\0';
	float downPayment = 0.0f;
	float maxLoanAmount = 0.0f;

	// Read the necessary information
	printf("Digite sua renda mensal......................................: ");
	scanf("%f", &monthlyIncome);
	printf("Digite o valor do emprestimo.................................: ");
	scanf("%f", &loanAmount);

	// Clear input buffer before reading characters
	while ((getchar()) != '\n'); // Clear the input buffer

	printf("Digite seu historico de credito (B=Bom, R=Ruim)..............: ");
	scanf(" %c", &creditHistory);
	creditHistory = toupper(creditHistory);

	printf("Digite sua estabilidade no emprego (E=Estavel, I=Instavel)...: ");
	scanf(" %c", &jobStability);
	jobStability = toupper(jobStability);

	printf("Digite o Valor da entrada....................................: ");
	scanf("%f", &downPayment);

	// Calculate maximum loan amount (30% of monthly income)
	maxLoanAmount = monthlyIncome * 0.30f;

	// Determine loan approval
	int loanApproved = 1; // Assume loan is approved initially
	char rejectionReasons[MAX_REASON_LENGTH] = "";

	// Perform checks
	if (!checkLoanAmount(loanAmount, maxLoanAmount, rejectionReasons)) {
		loanApproved = 0;
	}
	if (!checkCreditHistory(creditHistory, rejectionReasons)) {
		loanApproved = 0;
	}
	if (!checkJobStability(jobStability, rejectionReasons)) {
		loanApproved = 0;
	}
	if (!checkDownPayment(loanAmount, downPayment, rejectionReasons)) {
		loanApproved = 0;
	}

	// Display result
	if (loanApproved) {
		printf("Parabens! seu emprestimo foi aprovado.\n");
	}
	else {
		printf("Desculpe, seu emprestimo foi rejeitado.\n");
		printf("Motivo(s):\n%s", rejectionReasons);
	}

	printf("Fim do Programa!\n");

	return 0;
}

/*
 * Function: checkLoanAmount
 * -------------------------
 * Checks if the loan amount does not exceed 30% of the monthly income.
 *
 * loanAmount: The requested loan amount.
 * maxLoanAmount: The maximum allowable loan amount based on income.
 * rejectionReasons: The string to append rejection reasons.
 *
 * returns: 1 if the loan amount is acceptable, 0 otherwise.
 */
int checkLoanAmount(float loanAmount, float maxLoanAmount, char* rejectionReasons) {
	if (loanAmount > maxLoanAmount) {
		strcat(rejectionReasons, "O valor do emprestimo excede 30% da sua renda mensal.\n");
		return 0;
	}
	return 1;
}

/*
 * Function: checkCreditHistory
 * ----------------------------
 * Checks if the credit history is acceptable.
 *
 * creditHistory: The client's credit history ('B' for good, 'R' for bad).
 * rejectionReasons: The string to append rejection reasons.
 *
 * returns: 1 if the credit history is acceptable, 0 otherwise.
 */
int checkCreditHistory(char creditHistory, char* rejectionReasons) {
	if (creditHistory == CREDIT_HISTORY_BAD) {
		strcat(rejectionReasons, "Historico de credito ruim.\n");
		return 0;
	}
	return 1;
}

/*
 * Function: checkJobStability
 * ---------------------------
 * Checks if the client's job stability is acceptable.
 *
 * jobStability: The client's job stability ('E' for stable, 'I' for unstable).
 * rejectionReasons: The string to append rejection reasons.
 *
 * returns: 1 if the job stability is acceptable, 0 otherwise.
 */
int checkJobStability(char jobStability, char* rejectionReasons) {
	if (jobStability == JOB_STABILITY_UNSTABLE) {
		strcat(rejectionReasons, "Estabilidade no emprego instável.\n");
		return 0;
	}
	return 1;
}

/*
 * Function: checkDownPayment
 * --------------------------
 * Checks if the down payment is sufficient.
 *
 * loanAmount: The requested loan amount.
 * downPayment: The amount of down payment provided.
 * rejectionReasons: The string to append rejection reasons.
 *
 * returns: 1 if the down payment is sufficient, 0 otherwise.
 */
int checkDownPayment(float loanAmount, float downPayment, char* rejectionReasons) {
	float minDownPayment = loanAmount * 0.20f;
	if (downPayment < minDownPayment) {
		strcat(rejectionReasons, "O valor da entrada e insuficiente (mínimo de 20% do valor do emprestimo).\n");
		return 0;
	}
	return 1;
}