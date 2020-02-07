%{ 

#include "tokens.h"
# undef yywrap
# define yywrap() 1



#undef YY_DECL
#define YY_DECL int yylex()
YY_DECL;


// Code run each time a pattern is matched.
#undef  YY_USER_ACTION  
# define YY_USER_ACTION  {}



%}

%option yylineno
%option noyywrap 

DIGIT [0-9] 
ALPHA [a-zA-Z]
UOP ^[_][_0-9]*[a-zA-Z]+[_a-zA-Z0-9]*
OP ^[a-zA-Z][_a-zA-Z0-9]+

%%





\/\/.*$   
[ \t]+						
[\n]+							



";"		{ 
			return ';'; 
                }

"="		{ 
			return '='; 
                }

"main"		{ 
			return K_MAIN; 
                }

{DIGIT}+	{ 
			return L_INTEGER;
		}

{UOP}	 	{ 
			return T_ID;
		}

{OP}		{
			return T_ID;
		}

"+"		{
			return OP_ADD;
		}

"-"		{
			return OP_SUB;
		}

"*"		{
			return OP_MUL;
		}

"/"		{
			return OP_DIV;
		}

"<="		{
			return OP_LEQ;
		}

">="		{
			return OP_GEQ;
		}

"=="		{
			return OP_EQ;
		}

"!="		{
			return OP_INEQ;
		}

"<"		{
			return OP_LT;
		}

">"		{
			return OP_GT;
		}

<<EOF>>		{ return T_EOF ; }
.		{ printf ("Unexpected character\n"); exit (1); }





%%
