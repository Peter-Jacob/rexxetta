/*�*REXX program finds the first  A  Niven numbers;  it also finds first Niven number > B.*/
parse arg A B .                                  /*�*obtain optional arguments from the CL*/
if A=='' | A==','  then A=   20                  /*�*Not specified?  Then use the default.*/
if B=='' | B==','  then B= 1000                  /*�* "      "         "   "    "     "   */
tell= A>0;              A= abs(A)                /*�*flag for showing a Niven numbers list*/
A= abs(a)
numeric digits 1+max(8, length(A), length(B) )   /*�*enable the use of any sized numbers. */
newV2= 0;    newV3=                                      /*�*set Niven numbers count;  Niven list.*/
do j=1  until  newV2==A   /*�*◄───── let's go Niven number hunting.*/
if isNiven(j)  then do;   newV2= newV2+1;    newV1.newV2= j;    end
end   /*�*j*/           /*�* [↑]   bump count; append J ──► list.*/
w= length(newV1.w)                                   /*�*W:   is the width of largest Niven #.*/
if tell  then do
say 'first' A 'Niven numbers:';  do k=1  for newV2; say right(newV1.k, w); end /*�*k*/
end
else say 'last of the'      A      'Niven numbers: '           newV1.newV2
say
do t=B+1  until  isNiven(t) /*�*hunt for a Niven (or Harshad) number.*/
end
say  'first Niven number >'     B      " is: "      t
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
isNiven: parse arg x 1 sum 2 q                   /*�*use the first decimal digit for  SUM.*/
do  while  q\=='';    parse var q newV4 2 q;          sum= sum + newV4
end   /*�*while*/                 /*�*    ↑                                */
return x // sum == 0                    /*�*    └──────◄ is destructively parsed.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Harshad-or-Niven-series\harshad-or-niven-series-4.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
