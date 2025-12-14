%{
/*
 * C DECLARATIONS SECTION
 * Code here is copied directly to generated C file
 */
#include <stdio.h>  // For printf() function
%}

%%
/*
 * RULES SECTION - Pattern-Action pairs
 * When input matches pattern, execute corresponding C code
 */

/*
 * Rule 1: Match exact string "abc" (case-sensitive)
 * Action: Print "ABC" in uppercase
 * Example: "abc" → "ABC", "abcdef" → "ABCdef" (only first 3 chars replaced)
 */
abc    { printf("ABC"); }

/*
 * Rule 2: Match ANY single character (except newline)
 * Action: Print the character exactly as found
 * The dot '.' is a regex wildcard for "any character"
 * yytext contains the matched character
 */
.      { printf("%s", yytext); }

/*
 * Rule 3: Match newline character
 * Action: Print newline (preserve line breaks)
 * Without this rule, newlines would be eaten by rule 2
 */
\n     { printf("\n"); }
%%

/*
 * ADDITIONAL C CODE SECTION
 * This becomes part of the final executable
 */

/*
 * MAIN FUNCTION - Program entry point
 * yylex() starts the lexical analyzer
 * It reads input (from stdin or file) and applies the rules
 */
int main() {
    yylex();     // Start lexical analyzer - this is where scanning happens
    return 0;    // Exit program
}

/*
 * YYWRAP FUNCTION - Called when flex reaches end of input
 * Return 1: Signal EOF (End of File), stop processing
 * Return 0: Continue with another input file
 */
int yywrap() {
    return 1;    // We're only processing one input source
}
