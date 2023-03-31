%option yylineno
%{
    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>

    void printToken(char* token);
    void printSymbol(char* symb, char* text);
    void printIdentifier(char* identifier);
    void printIntVal(char *intVal);
    void printString(char *string);
    void printFloatVal(char *floatVal);
    void lexicalError(char *unkSimbol);

%}
%%
\{[^\{\}]*\} { }
begin   { printToken(yytext); }
bool   { printToken(yytext); }
else   { printToken(yytext); }
end   { printToken(yytext); }
false   { printToken(yytext); }
if   { printToken(yytext); }
int   { printToken(yytext); }
program   { printToken(yytext); }
read   { printToken(yytext); }
real   { printToken(yytext); }
repeat   { printToken(yytext); }
string   { printToken(yytext); } 
then   { printToken(yytext); }
true   { printToken(yytext); }
until   { printToken(yytext); }
var   { printToken(yytext); }
write { printToken(yytext); }
[:][=] { printSymbol(yytext,"ASSIGN"); }
[=] { printSymbol(yytext,"EQ"); }
[<] { printSymbol(yytext,"LT"); }
[+] { printSymbol(yytext,"PLUS"); }
[-] { printSymbol(yytext,"MINUS"); }
[*] { printSymbol(yytext,"TIMES"); }
[/] { printSymbol(yytext,"OVER"); }
[(] { printSymbol(yytext,"LPAR"); }
[)] { printSymbol(yytext,"RPAR"); }
[;] { printSymbol(yytext,"SEMI"); }
[A-Za-z]+ { printIdentifier(yytext); }
[0-9]+\.[0-9]+ { printFloatVal(yytext); }
[0-9]+ { printIntVal(yytext); }
\"[^\"\"]*\" { printString(yytext); }
[ \t\n] {}
. {lexicalError(yytext);}
%%

void printToken(char* token){
    char upToken[10];
    strcpy(upToken, token);

    for(int i = 0; i < strlen(upToken); i++)
        upToken[i] = token[i] -32 ;
    
    printf("%d: %s -> %s\n", yylineno,token, upToken);
}

void printSymbol(char* symb, char* text){
    printf("%d: %s -> %s\n", yylineno, symb, text);
}

void printIdentifier(char* identifier){
    printf("%d: %s -> ID\n", yylineno, identifier);
}

void printFloatVal(char *floatVal){
    printf("%d: %s -> REAL_VAL\n", yylineno, floatVal);
}

void printIntVal(char *intVal){
    printf("%d: %s -> INT_VAL\n", yylineno, intVal);
}

void printString(char *string){
    printf("%d: %s -> STR_VAL\n", yylineno, string);
}

void lexicalError(char *unkSimbol){
    printf("LEXICAL ERROR (%d): Unknown symbol %s\n", yylineno, unkSimbol);
    exit(1);
}