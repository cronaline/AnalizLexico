%{
  #include <stdio.h>
  #include <stdlib.h>
%}
palRes     _si|_sino|_finsi|_mientras|_finmientras|_haz|_desde|_hasta|_incremento
ident      [a-zA-Z]{1,16}
opAsig     :=
opRel      >=?|<=?|><|=
opArit     [+\-*\/]
simbEsp    [\.,\(\)\[\]]
consCad    \".*\"
signo      [\+\-]
consEnt    {signo}?[0-9]+
sufijo     E{consEnt}
constReal  {consEnt}?(.[0-9]){sufijo}?
comentario ¡.*!
espacio    [ \n\t]
%%
{palRes}      printf("Soy palRes %s\n", yytext);
{ident}       printf("Soy ident %s\n", yytext);
{opAsig}      printf("Soy opAsig %s\n", yytext);
{opRel}       printf("Soy opRel %s\n", yytext);
{opArit}      printf("Soy opArit %s\n", yytext);
{simbEsp}     printf("Soy simbEsp %s\n", yytext);
{signo}       printf("Soy signo %s\n", yytext);
{consCad}     printf("Soy consCad %s\n", yytext);
{consEnt}     printf("Soy constEnt %s\n", yytext);
{sufijo}      printf("Soy sufijo %s\n", yytext);
{constReal}   printf("Soy constReal %s\n", yytext);
{comentario}  printf("Soy comentario %s\n", yytext);
%%
main(int argc, char *argv[]){
  yyin = fopen(argv[1], "r");
  yylex();
  fclose(yyin);
}
