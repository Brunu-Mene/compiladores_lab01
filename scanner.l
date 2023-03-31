%{
    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>

    int lineCount = 1;
    void printToken(char* token);
    void printSymbol(char* symb, char* text);
    void printIdentifier(char* identifier);
    void printIntVal(char *intVal);

%}
%%
["{"]+ {}
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
[:][=] { printf("ASSIGN"); }
[=] { printSymbol(yytext,"EQ"); }
[<] { printSymbol(yytext,"LT"); }
[+] { printSymbol(yytext,"PLUS"); }
[-] { printSymbol(yytext,"MINUS"); }
[*] { printSymbol(yytext,"TIMES"); }
[/] { printSymbol(yytext,"SLASH"); }
[(] { printSymbol(yytext,"LPAR"); }
[)] { printSymbol(yytext,"RPAR"); }
[;] { printSymbol(yytext,"SEMI"); }
[A-Za-z]+ { printIdentifier(yytext); }
[0-9]+ { printIntVal(yytext); }
\n { lineCount++; }
. { }
%%

void printToken(char* token){
    char upToken[10];
    strcpy(upToken, token);

    for(int i = 0; i < strlen(upToken); i++)
        upToken[i] = token[i] -32 ;
    
    printf("%d: %s -> %s\n", lineCount,token, upToken);
}

void printSymbol(char* symb, char* text){
    printf("%d: %s -> %s\n", lineCount, symb, text);
}

void printIdentifier(char* identifier){
    printf("%d: %s -> %s\n", lineCount, identifier, "ID");
}

void printIntVal(char *intVal){
    printf("%d: %d -> %s\n", lineCount, atoi(intVal), "INT_VAL");
}