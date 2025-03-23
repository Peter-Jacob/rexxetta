/*�*REXX program performs a  Burrows─Wheeler transform  (BWT)  on a character string(s).  */
newV1.=                                              /*�*the default text for (all) the inputs*/
parse arg newV1.1                                    /*�*obtain optional arguments from the CL*/
if newV1.1=''  then do;  newV1.1= "banana"               /*�*Not specified?  Then use the defaults*/
newV1.2= "BANANA"
newV1.3= "appellee"
newV1.4= "dogwood"
newV1.5= "TO BE OR NOT TO BE OR WANT TO BE OR NOT?"
newV1.6= "SIX.MIXED.PIXIES.SIFT.SIXTY.PIXIE.DUST.BOXES"
newV1.7= "^ABC|"
newV1.7= "bad─bad thingy"'fd'x  /*�* ◄─── this string can't be processed.*/
end
/*�* [↑]  show blank line between outputs*/
do t=1  while newV1.t\='';  if t\==1 then say /*�*process each of the inputs (or input)*/
out=  BWT(newV1.t)                            /*�*invoke the  BWT  function, get result*/
ori= iBWT(out)                            /*�*   "    "  iBWT      "      "     "  */
say '   input ───► '   newV1.t                /*�*display    input      string to term.*/
say '  output ───► '   out                /*�*   "       output        "    "   "  */
say 'original ───► '   ori                /*�*   "    reconstituted    "    "   "  */
end    /*�*t*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
BWT:   procedure expose newV2.; parse arg y,,newV4       /*�*obtain the input;  nullify $ string. */
newV2.1= 'fd'x;          newV2.2= "fc"x           /*�*assign the  STX  and  ETX  strings.  */
do i=1  for 2                          /*�* [↓]  check for invalid input string.*/
newV5= verify(y, newV2.i, 'M');  if newV5==0  then iterate;        er= '***error***  BWT: '
say er "invalid input: "    y
say er 'The input string contains an invalid character at position' newV5"."; exit newV5
end   /*�*i*/                            /*�* [↑]  if error,  perform a hard exit.*/
y= newV2.1 || y || newV2.2;      L= length(y)     /*�*get the input & add a fence; gel len.*/
newV3.1= y;                  m= L - 1         /*�*define the first element of the table*/
do j=2  for m;        newV5= j-1 /*�*now, define the rest of the elements.*/
newV3.j= right(newV3.newV5,1)left(newV3.newV5,m) /*�*construct a table from the  Y  input.*/
end   /*�*j*/                  /*�* [↑]  each element: left & right part*/
call cSort L                              /*�*invoke lexicographical sort for array*/
do k=1  for L                /*�* [↓]  construct the answer from array*/
newV4= newV4  ||  right(newV3.k, 1)      /*�*build the answer from each of  ···   */
end   /*�*k*/                  /*�* ··· the array's right─most character*/
return newV4                                  /*�*return the constructed answer.       */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
iBWT:  procedure expose newV2.; parse arg y,,newV3.      /*�*obtain the input;  nullify @. string.*/
L= length(y)                              /*�*compute the length of the input str. */
do   j=1  for L               /*�* [↓]  step through each input letters*/
do k=1  for L               /*�* [↓]  step through each row of table.*/
newV3.k= substr(y, k, 1) || newV3.k /*�*construct a row of the table of chars*/
end   /*�*k*/                 /*�* [↑]  order of table row is inverted.*/
call cSort L                  /*�*invoke lexicographical sort for array*/
end    /*�*j*/                  /*�* [↑]  answer is the penultimate entry*/
do newV6=1
if right(newV3.newV6, 1)==newV2.2  then return substr(newV3.newV6, 2, L-2)  /*�*return correct result*/
end   /*�*#*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
cSort: procedure expose newV3.;  parse arg n;  m=n-1 /*�*N: is the number of @ array elements.*/
do m=m  for m  by -1  until ok;  ok=1 /*�*keep sorting the  @ array until done.*/
do j=1  for m;  k= j+1;   if newV3.j<<=newV3.k  then iterate   /*�*elements in order?*/
newV5= newV3.j;  newV3.j= newV3.k;  newV3.k= newV5;   ok= 0 /*�*swap two elements;  flag as not done.*/
end   /*�*j*/
end     /*�*m*/;       return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Burrows-Wheeler-transform\burrows-wheeler-transform.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
