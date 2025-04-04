/*ͺ*REXX program  encodes and displays a string  by using a  runβlength  encoding scheme. */
parse arg input .                                /*ͺ*normally, input would be in a file.  */
default= 'WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWBWWWWWWWWWWWWWW'
if input=='' | input==","  then input=   default /*ͺ*Not specified?  Then use the default.*/
encode= RLE(input) ;     say '  input='  input   /*ͺ*encode input string;  display input. */
say 'encoded='  encode  /*ͺ*                      display runβlen*/
decode= RLD(encode);     say 'decoded='  decode  /*ͺ*decode the runβlen;   display decode.*/
if decode==input  then say 'OK'; else say "Β¬ OK" /*ͺ*display yay or nay (success/failure).*/
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
err: say;    say "***error***  input data isn't alphabetic:"   c;       say;     exit 13
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
RLE: procedure;  parse arg x;     newV1=             /*ͺ*$:  is the output string  (so far).  */
Lx= length(x)            /*ͺ*get length of the plain text string. */
do j=1  by 0  to Lx;  c= substr(x, j, 1)  /*ͺ*obtain a character from plain text.  */
if \datatype(c, 'M')  then call err       /*ͺ*Character not a letter?  Issue error.*/
r= 0                                      /*ͺ*R:  is NOT the number of characters. */
do k=j+1  to Lx  while substr(x, k, 1)==c   /*ͺ*while characters β‘ C */
r= r + 1                    /*ͺ*bump the replication count for a char*/
end   /*ͺ*k*/
j= j + r + 1                              /*ͺ*increment (add to) the DO loop index.*/
if r==0  then newV1= newV1 ||      c              /*ͺ*don't use  R  if it is equal to zero.*/
else newV1= newV1 || r || c              /*ͺ*add character to the encoded string. */
end   /*ͺ*j*/;                   return newV1   /*ͺ*return the encoded string to caller. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
RLD: procedure;  parse arg x;     newV1=             /*ͺ*$:  is the output string  (so far).  */
Lx= length(x)            /*ͺ*get the length of the encoded string.*/
do j=1  by 0  to Lx;  c= substr(x, j, 1)  /*ͺ*obtain a character from run encoding.*/
if \datatype(c, 'W')  then do;   newV1= newV1 || c;     j= j + 1;     iterate /*ͺ*j*/
end            /*ͺ* [β]  a loner char, add it to output.*/
newV2= 1                                      /*ͺ*          [β]  W:  use a Whole number*/
do k=j+1  to Lx  while datatype(substr(x,k,1), 'w') /*ͺ*while numeric*/
newV2= newV2 + 1                           /*ͺ*bump the count of the numeric chars. */
end   /*ͺ*k*/
n= substr(x, j, newV2) + 1                    /*ͺ*#:  the length of encoded character. */
newV1= newV1  ||  copies( substr(x, k, 1), n)     /*ͺ*N:  is now the number of characters. */
j= j + newV2 + 1                              /*ͺ*increment the DO loop index by D+1.  */
end   /*ͺ*j*/;                   return newV1   /*ͺ*return the decoded string to caller. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Run-length-encoding\run-length-encoding-1.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
