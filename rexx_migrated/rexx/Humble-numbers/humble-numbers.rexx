/*�*REXX program computes and displays humble numbers,  also will display counts of sizes.*/
parse arg n m .                                  /*�*obtain optional arguments from the CL*/
if n=='' | n==","  then n= 50                    /*�*Not specified?  Then use the default.*/
if m=='' | m==","  then m= 60                    /*�* "      "         "   "   "     "    */
numeric digits 1 + max(20, m)                    /*�*be able to handle some big numbers.  */
newV1.= 0                                            /*�*a count array for  X  digit humble #s*/
call humble n;                    list=          /*�*call HUMBLE sub; initialize the list.*/
do j=1  for n;  list= list newV6.j /*�*append a  humble  number to the list.*/
end   /*�*j*/

if list\=''  then do;    say "A list of the first "    n    ' humble numbers are:'
say strip(list)         /*�*elide the leading blank in the list. */
end
say
call humble -m                                   /*�*invoke subroutine for counting nums. */
if newV1.1==0  then exit                             /*�*if no counts, then we're all finished*/
total= 0                                         /*�*initialize count of humble numbers.  */
newV1.1= newV1.1 + 1                                     /*�*adjust count for absent 1st humble #.*/
say '                    The digit counts of humble numbers:'
say '                 ═════════════════════════════════════════'
do c=1  while newV1.c>0;  s= left('s', length(newV1.c)>1)   /*�*count needs pluralization?*/
say right( commas(newV1.c), 30)         ' have '         right(c, 2)         " digit"s
total= total + newV1.c                       /*�* ◄─────────────────────────────────┐ */
end   /*�*k*/                              /*�*bump humble number count (so far)──┘ */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: procedure; arg newV7;  do i=length(newV7)-3 to 1 by -3; newV7=insert(',', newV7, i); end; return newV7
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
humble: procedure expose newV6. newV1.;   parse arg x;         if x==0  then return
y= abs(x);   a= y;        noCount= x>0;        if x<0   then y= 999999999
newV2= 1;    newV3= 1;    newV4= 1;     newV5= 1     /*�*define the initial humble constants. */
newV1.= 0;    newV6.= 0;    newV6.1= 1     /*�*initialize counts and humble numbers.*/
do h=2  for y-1
newV6.h= min(2*newV6.newV2,3*newV6.newV3,5*newV6.newV4,7*newV6.newV5)  /*�*pick the minimum of 4 humble numbers.*/
m= newV6.h                                 /*�*M:    "     "     " "    "      "    */
if 2*newV6.newV2 == m   then newV2 = newV2 + 1      /*�*Is number already defined? Use next #*/
if 3*newV6.newV3 == m   then newV3 = newV3 + 1      /*�* "    "      "       "      "    "  "*/
if 5*newV6.newV4 == m   then newV4 = newV4 + 1      /*�* "    "      "       "      "    "  "*/
if 7*newV6.newV5 == m   then newV5 = newV5 + 1      /*�* "    "      "       "      "    "  "*/
if noCount       then iterate          /*�*Not counting digits?   Then iterate. */
L= length(m);    if L>a  then leave    /*�*Are we done with counting?  Then quit*/
newV1.L= newV1.L + 1                           /*�*bump the digit count for this number.*/
end   /*�*h*/                            /*�*the humble numbers are in the @ array*/
return                                   /*�* "  count  results  "   "  "  $   "  */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Humble-numbers\humble-numbers.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
