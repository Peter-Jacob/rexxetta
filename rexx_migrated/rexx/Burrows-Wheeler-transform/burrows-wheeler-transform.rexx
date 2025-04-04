/*ͺ*REXX program performs a  BurrowsβWheeler transform  (BWT)  on a character string(s).  */
newV1.=                                              /*ͺ*the default text for (all) the inputs*/
parse arg newV1.1                                    /*ͺ*obtain optional arguments from the CL*/
if newV1.1=''  then do;  newV1.1= "banana"               /*ͺ*Not specified?  Then use the defaults*/
newV1.2= "BANANA"
newV1.3= "appellee"
newV1.4= "dogwood"
newV1.5= "TO BE OR NOT TO BE OR WANT TO BE OR NOT?"
newV1.6= "SIX.MIXED.PIXIES.SIFT.SIXTY.PIXIE.DUST.BOXES"
newV1.7= "^ABC|"
newV1.7= "badβbad thingy"'fd'x  /*ͺ* ββββ this string can't be processed.*/
end
/*ͺ* [β]  show blank line between outputs*/
do t=1  while newV1.t\='';  if t\==1 then say /*ͺ*process each of the inputs (or input)*/
out=  BWT(newV1.t)                            /*ͺ*invoke the  BWT  function, get result*/
ori= iBWT(out)                            /*ͺ*   "    "  iBWT      "      "     "  */
say '   input ββββΊ '   newV1.t                /*ͺ*display    input      string to term.*/
say '  output ββββΊ '   out                /*ͺ*   "       output        "    "   "  */
say 'original ββββΊ '   ori                /*ͺ*   "    reconstituted    "    "   "  */
end    /*ͺ*t*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
BWT:   procedure expose newV2.; parse arg y,,newV4       /*ͺ*obtain the input;  nullify $ string. */
newV2.1= 'fd'x;          newV2.2= "fc"x           /*ͺ*assign the  STX  and  ETX  strings.  */
do i=1  for 2                          /*ͺ* [β]  check for invalid input string.*/
newV5= verify(y, newV2.i, 'M');  if newV5==0  then iterate;        er= '***error***  BWT: '
say er "invalid input: "    y
say er 'The input string contains an invalid character at position' newV5"."; exit newV5
end   /*ͺ*i*/                            /*ͺ* [β]  if error,  perform a hard exit.*/
y= newV2.1 || y || newV2.2;      L= length(y)     /*ͺ*get the input & add a fence; gel len.*/
newV3.1= y;                  m= L - 1         /*ͺ*define the first element of the table*/
do j=2  for m;        newV5= j-1 /*ͺ*now, define the rest of the elements.*/
newV3.j= right(newV3.newV5,1)left(newV3.newV5,m) /*ͺ*construct a table from the  Y  input.*/
end   /*ͺ*j*/                  /*ͺ* [β]  each element: left & right part*/
call cSort L                              /*ͺ*invoke lexicographical sort for array*/
do k=1  for L                /*ͺ* [β]  construct the answer from array*/
newV4= newV4  ||  right(newV3.k, 1)      /*ͺ*build the answer from each of  Β·Β·Β·   */
end   /*ͺ*k*/                  /*ͺ* Β·Β·Β· the array's rightβmost character*/
return newV4                                  /*ͺ*return the constructed answer.       */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
iBWT:  procedure expose newV2.; parse arg y,,newV3.      /*ͺ*obtain the input;  nullify @. string.*/
L= length(y)                              /*ͺ*compute the length of the input str. */
do   j=1  for L               /*ͺ* [β]  step through each input letters*/
do k=1  for L               /*ͺ* [β]  step through each row of table.*/
newV3.k= substr(y, k, 1) || newV3.k /*ͺ*construct a row of the table of chars*/
end   /*ͺ*k*/                 /*ͺ* [β]  order of table row is inverted.*/
call cSort L                  /*ͺ*invoke lexicographical sort for array*/
end    /*ͺ*j*/                  /*ͺ* [β]  answer is the penultimate entry*/
do newV6=1
if right(newV3.newV6, 1)==newV2.2  then return substr(newV3.newV6, 2, L-2)  /*ͺ*return correct result*/
end   /*ͺ*#*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
cSort: procedure expose newV3.;  parse arg n;  m=n-1 /*ͺ*N: is the number of @ array elements.*/
do m=m  for m  by -1  until ok;  ok=1 /*ͺ*keep sorting the  @ array until done.*/
do j=1  for m;  k= j+1;   if newV3.j<<=newV3.k  then iterate   /*ͺ*elements in order?*/
newV5= newV3.j;  newV3.j= newV3.k;  newV3.k= newV5;   ok= 0 /*ͺ*swap two elements;  flag as not done.*/
end   /*ͺ*j*/
end     /*ͺ*m*/;       return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Burrows-Wheeler-transform\burrows-wheeler-transform.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
