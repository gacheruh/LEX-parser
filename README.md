# Compiler Construction Programs

## Contents:
1. `wordcount.l` - Counts words and characters
2. `abc_replace.l` - Replaces "abc" with "ABC"

## How to Compile and Run:

```bash
# For each .l file:
flex filename.l
gcc lex.yy.c -o program_name
./program_name < input.txt
