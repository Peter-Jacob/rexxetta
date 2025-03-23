/*�*REXX program  determines  if a  number  (in base 10)   is  a  self-describing  number.*/
parse arg x y .                                  /*�*obtain optional arguments from the CL*/
if x=='' | x==","  then exit                     /*�*Not specified?  Then get out of Dodge*/
if y=='' | y==","  then y=x                      /*�*Not specified?  Then use the X value.*/
w=length(y)                                      /*�*use  Y's  width for aligned output.  */
numeric digits max(9, w)                         /*�*handle the possibility of larger #'s.*/
newV1= '1210 2020 21200 3211000 42101000 521001000 6210001000'        /*�*the list of numbers.*/
/*�*test for a  single  integer.         */
if x==y  then do                                 /*�*handle the case of a single number.  */
say word("isn't is",  wordpos(x, newV1) + 1)     'a self-describing number.'
exit
end
/*�* [↓]  test for a  range  of integers.*/
do n=x  to y;  parse var  n  ''  -1  newV2  /*�*obtain the last decimal digit of  N. */
if newV2\==0              then iterate
if wordpos(n, newV1)==0   then iterate
say  right(n,w)  'is a self-describing number.'
end   /*�*n*/
/*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Self-describing-numbers\self-describing-numbers-2.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
