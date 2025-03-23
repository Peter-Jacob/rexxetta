/*�*REXX pgm  finds and displays  N  numbers that have an equal number of rises and falls,*/
parse arg n .                                    /*�*obtain optional argument from the CL.*/
if n=='' | n==","  then n= 200                   /*�*Not specified?  Then use the default.*/
append= n>0                                      /*�*a flag that is used to append numbers*/
n= abs(n)                                        /*�*use the absolute value of  N.        */
call init                                        /*�*initialize the  rise/fall  database. */
do j=1  until newV2==n                     /*�*test integers until we have N of them*/
s= 0                                   /*�*initialize the sum of  rises/falls.  */
do k=1  for length(j)-1  /*�*obtain a set of two digs from number.*/
t= substr(j, k, 2)       /*�*obtain a set of two digs from number.*/
s= s + newV1.t               /*�*sum the rises and falls in the number*/
end   /*�*k*/
if s\==0  then iterate                 /*�*Equal # of rises & falls? Then add it*/
newV2= newV2 + 1                               /*�*bump the count of numbers found.     */
if append  then newV3= newV3 j                 /*�*append to the list of numbers found. */
end   /*�*j*/

if append  then call show                        /*�*display a list of  N  numbers──►term.*/
else say  'the '  commas(n)th(n)  " number is: "   commas(j)    /*�*show Nth #.*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas:  parse arg newV4;  do c=length(newV4)-3  to 1  by -3; newV4=insert(',', newV4, c); end;   return newV4
th:      parse arg th;  return word('th st nd rd',1+(th//10)*(th//100%10\==1)*(th//10<4))
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
init: newV1.= 0;   do i=1  for 9;    newV4= i' ';     newV1.newV4= 1;    newV4= '0'i;   newV1.newV4= +1;   end  /*�*i*/
do i=10  to 99;   parse var i  a 2 b;     if a>b  then              newV1.i= -1
else if a<b  then newV1.i= +1
end   /*�*i*/;      newV2= 0;        newV3=;        return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show: say 'the first '   commas(newV2)   " numbers are:";   say;       w= length( word(newV3, newV2) )
newV4=;    do o=1  for n;     newV4= newV4 right( word(newV3, o), w);    if o//20\==0  then iterate
say substr(newV4, 2);  newV4=               /*�*display a line;  nullify a new line. */
end   /*�*o*/                         /*�* [↑]  display  20  numbers to a line.*/

if newV4\==''  then say substr(newV4, 2);   return /*�*handle any residual numbers in list. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Numbers-with-equal-rises-and-falls\numbers-with-equal-rises-and-falls.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
