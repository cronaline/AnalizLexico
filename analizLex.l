%{
  #include <stdio.h>
  #include <stdlib.h>
%}
palRes     _si|_sino|_finsi|_mientras|_finmientras|_haz|_desde|_hasta|_incremento
ident      ^[a-zA-Z]{1,16}
opAsig     :=
opRel      >=?|<=?|><|=
opArit     [\+\-*\/]
simbEsp    [\.,\(\)\[\]]
consCad    \".*\"
consEnt    (\+?|\-?)[0-9]+
sufijo     E{consEnt}
consReal   (({consEnt}?(.[0-9]+){sufijo}?)|(({consEnt}\.){sufijo}?))
comentario ¡.*!
espacio    [ \n\t]+
error      [^{palRes}{ident}{opAsig}{opRel}{signo}{opArit}{simbEsp}{consCad}{consEnt}{sufijo}{consReal}{comentario}{espacio}]
%%
{palRes}      printf("Soy palRes %s\n", yytext);
{ident}       printf("Soy ident %s\n", yytext);
{opAsig}      printf("Soy opAsig %s\n", yytext);
{opRel}       printf("Soy opRel %s\n", yytext);
{opArit}      printf("Soy opArit %s\n", yytext);
{consCad}     printf("Soy consCad %s\n", yytext);
{consEnt}     printf("Soy constEnt %s\n", yytext);
{sufijo}      printf("Soy sufijo %s\n", yytext);
{consReal}    printf("Soy consReal %s\n", yytext);
{comentario}  printf("Soy comentario %s\n", yytext);
{espacio}       printf("\n");
{simbEsp}     printf("Soy simbEsp %s\n", yytext);
%%
main(int argc, char *argv[]){
  yyin = fopen(argv[1], "r");
  yylex();
  fclose(yyin);
}
