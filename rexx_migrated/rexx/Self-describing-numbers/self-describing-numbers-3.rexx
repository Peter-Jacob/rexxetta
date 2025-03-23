/*ª*REXX program  determines  if a  number  (in base 10)   is  a  self-describing  number.*/
parse arg x y .                                  /*ª*obtain optional arguments from the CL*/
if x=='' | x==","  then exit                     /*ª*Not specified?  Then get out of Dodge*/
if y=='' | y==","  then y=x                      /*ª*Not specified?  Then use the X value.*/
w=length(y)                                      /*ª*use  Y's  width for aligned output.  */
numeric digits max(9, w)                         /*ª*handle the possibility of larger #'s.*/
newV1= '1210 2020 21200 3211000 42101000 521001000 6210001000'        /*ª*the list of numbers.*/
/*ª*test for a  single  integer.         */
if x==y  then do                                 /*ª*handle the case of a single number.  */
say word("isn't is",  wordpos(x, newV1) + 1)     'a self-describing number.'
exit
end
/*ª* [â†“]  test for a  range  of integers.*/
do n=1  for words(newV1);     newV2=word(newV1, n)  /*ª*look for integers that are in range. */
if newV2<x | newV2>y  then iterate              /*ª*if not self-describing, try again.   */
say  right(newV2, w)       'is a self-describing number.'
end   /*ª*n*/                             /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Self-describing-numbers\self-describing-numbers-3.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
