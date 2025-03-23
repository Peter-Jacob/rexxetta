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
do n=1  for words(newV1);     newV2=word(newV1, n)  /*�*look for integers that are in range. */
if newV2<x | newV2>y  then iterate              /*�*if not self-describing, try again.   */
say  right(newV2, w)       'is a self-describing number.'
end   /*�*n*/                             /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Self-describing-numbers\self-describing-numbers-3.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
