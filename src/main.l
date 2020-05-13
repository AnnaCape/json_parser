
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}
LETRA   [a-zA-Z]
DIGITO  [0-9]
PALAVRA  {LETRA}+
INTEIRO  {DIGITO}+

FLOAT {INTEIRO}([.]{INTEIRO})?
FRASE {PALAVRA}([[:space:]]+{PALAVRA})*
%%
\{ { return '{'; }
\} { return '}'; }
\] { return ']'; }
\[ { return '['; }

\" { return '"'; }
[:] { return ':'; }
[,][\n]? { return ','; }

{FLOAT}[\n]? {return FLT;}
{FRASE} { return STR ;}
[\n] {return '\n'; }

. ;

%%

int yywrap() {
  return 1;
}
