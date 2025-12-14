%{
#include <stdio.h>
int word_count = 0;   
int total_size = 0;  // total characters across all words
%}

WORD   [a-zA-Z]+    //match one or more alphabetic characters

%%
{WORD}   { 
    word_count++;      
    total_size += yyleng;     //ADD WORD LENGTH TO TOTAL
    printf("Word %d: '%s' (length: %d)\n", 
           word_count, yytext, yyleng);
}
.|\n     { /* Ignore non-words: space, numbers, symbols */ }
%%

int main() {
    printf("=== Word Counter ===\n");
    yylex();                            //START LEXICAL ANALYSIS WITH LEX
    printf("\n=== Summary ===\n");
    printf("Total words: %d\n", word_count);
    printf("Total size (characters): %d\n", total_size);
   
    return 0;
}


//call yywrap() when flex reaches EOI
int yywrap() {
    return 1;  //stop processing after EOF
}
