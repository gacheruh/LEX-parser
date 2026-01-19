%{
#include <stdio.h>
int verb_count = 0;
%}

%%
(is|am|are|were|was|be|being|been)    {
    printf("BE verb found: '%s'\n", yytext);
    verb_count++;
}
(do|does|did|will|would|should|can|could) {
    printf("Modal/Auxiliary verb found: '%s'\n", yytext);
    verb_count++;
}
(has|have|had)    {
    printf("HAVE verb found: '%s'\n", yytext);
    verb_count++;
}
go                {
    printf("GO verb found: '%s'\n", yytext);
    verb_count++;
}
[ \t\n.,!?;:'’"—]+         /* Ignore whitespace and punctuation */
.                     /* Ignore other characters */
%%

int main() {
    printf("=== Verb Recognizer ===\n");
    printf("Looking for verbs: is, am, are, were, was, be, being, been,\n");
    printf("do, does, did, will, would, should, can, could,\n");
    printf("has, have, had, go\n\n");

    yylex();

    printf("\n=== Summary ===\n");
    printf("Total verbs found: %d\n", verb_count);
    return 0;
}

int yywrap() {
    return 1;
}
