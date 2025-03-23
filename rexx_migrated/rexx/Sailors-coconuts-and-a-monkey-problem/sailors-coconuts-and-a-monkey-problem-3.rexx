/*�*REXX program  solves a  riddle  of 5 sailors, a pile of coconuts, and a monkey.       */
parse arg L H .;        if L==''  then L= 2      /*�*L  not specified?   Then use default.*/
if H==''  then H= 9      /*�*H   "      "          "   "     "    */
do n=L  to H                              /*�*traipse through the number of sailors*/
do newV1=1  until t\==0;   t= total(n, newV1) /*�*perform while number coconuts not 0. */
end   /*�*$*/
say 'sailors='n           "  coconuts="t               '  share='newV1
end       /*�*n*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
total: procedure;  parse arg n,nuts              /*�*obtain the number sailors & coconuts.*/
nuts= nuts * n                            /*�*multiple # nuts by number of sailors.*/
nn= n - 1                                 /*�*NN  is used as calculation shortcut. */
do k=0  for n                  /*�*step through the possibilities.      */
if nuts//nn\==0  then return 0 /*�*Not one coconut left?   No solution. */
nuts= nuts  +  1  +  nuts % nn /*�*bump the number coconuts to the pile.*/
end   /*�*k*/
return nuts                               /*�*see if number coconuts>0 & remainder.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sailors-coconuts-and-a-monkey-problem\sailors-coconuts-and-a-monkey-problem-3.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
