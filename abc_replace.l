%{
#include <stdio.h>
%}

%%
abc    { printf("ABC"); }   //match literal "abc" and print "ABC" in place of it
.      { printf("%s", yytext); } //Match ANY single character (except newline)
\n     { printf("\n"); } //match newline character
%%

int main() {
    yylex();     //start lexical analyzer
    return 0;
}


//yywrap() called when flex reaches EOI
int yywrap() {
    return 1; //process from one imput file
}
