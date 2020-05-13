
%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token '{' '}' '[' ']' '"' ':' ',' FLT STR '\n'

%%
S: 
 L '\n' {printf( "VALIDO\n");}
 ;
 
L:
 '{' C '}' {}
 ;
 
C:
 A ':' A{}
 | C','C {}
 |
 ;

A:
 L {} 
 |FLT {}
 |'"' FLT '"' {}
 | '"' STR '"' {}
 | '[' A ',' A ']' {}
 | '['']'{}
 | '[' A ',' A ',' A ']' {}
 ;


%%

void yyerror(char *s) {
	printf("INVALIDO\n");
}

int main() {
  yyparse();
    return 0;

}
