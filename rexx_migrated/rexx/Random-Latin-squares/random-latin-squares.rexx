/*�*REXX program generates and displays a randomized Latin square.                        */
parse arg N seed .                               /*�*obtain the optional argument from CL.*/
if N=='' | N==","  then N= 5                     /*�*Not specified?  Then use the default.*/
if datatype(seed, 'W')  then call random ,,seed  /*�*Seed numeric?   Then use it for seed.*/
w= length(N - 1)                                 /*�*get the length of the largest number.*/
newV1=                                               /*�*initialize  $  string to null.       */
do i=0  for N;    newV1= newV1 right(i, w, '_') /*�*build a string of numbers (from zero)*/
end   /*�*i*/                             /*�* [↑]  $ string is (so far)  in order.*/
z=                                               /*�*Z:  will be the 1st row of the square*/
do N;             newV2= random(1,words(newV1)) /*�*gen a random number from the $ string*/
z= z word(newV1, newV2);  newV1= delword(newV1, newV2, 1)   /*�*add the number to string; del from $.*/
end   /*�*r*/
zz= z||z                                         /*�*build a double-length string of  Z.  */
do j=1  for N                           /*�* [↓]  display rows of random Latin sq*/
say translate(subword(zz, j, N), , '_') /*�*translate leading underbar to blank. */
end   /*�*j*/                             /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Random-Latin-squares\random-latin-squares.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
