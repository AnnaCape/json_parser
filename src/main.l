
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
MESCLA {PALAVRA}[[:space:]]?{INTEIRO}?

%%
\{ { return '{'; }
\} { return '}'; }
\] { return ']'; }
\[ { return '['; }

\" { return '"'; }
[:] { return ':'; }
[,] { return ','; }

{FLOAT}[\n]? {return FLT;}
{FRASE} { return STR ;}
{MESCLA} { return STR ;}
[\n]+ {return '\n'; }
[[:space:]];
. ;

%%

int yywrap() {
  return 1;
}
