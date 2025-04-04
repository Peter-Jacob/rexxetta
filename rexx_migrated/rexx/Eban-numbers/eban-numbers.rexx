/*ª*REXX program to display eban numbers (those that don't have an "e" their English name)*/
numeric digits 20                                /*ª*support some gihugic numbers for pgm.*/
parse arg newV1                                      /*ª*obtain optional arguments from the cL*/
if newV1=''  then newV1= '1 1000   1000 4000   1 -10000   1 -100000   1 -1000000   1 -10000000'

do k=1  by 2  to words(newV1)                  /*ª*step through the list of numbers.    */
call banE  word(newV1, k),  word(newV1, k+1)       /*ª*process the numbers, from lowâââºhigh.*/
end   /*ª*k*/
exit                                             /*ª*stick a fork in it,  we're all done. */
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
banE: procedure; parse arg x,y,newV2;  z= reverse(x) /*ª*obtain the number to be examined.    */
tell= y>=0                                 /*ª*Is HI non-negative?  Display eban #s.*/
newV3= 0                                       /*ª*the count of  eban  numbers (so far).*/
do j=x  to abs(y)                     /*ª*probably process a range of numbers. */
if hasE(j)  then iterate              /*ª*determine if the number has an  "e". */
newV3= newV3 + 1                              /*ª*bump the counter of  eban  numbers.  */
if tell  then newV2= newV2  j                 /*ª*maybe add to a list of eban numbers. */
end   /*ª*j*/
if newV2\==''  then say strip(newV2)               /*ª*display the list  (if there is one). */
say;     say newV3   ' eban numbers found for: '   x   " "   y;     say copies('â', 105)
return
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
hasE: procedure; parse arg x;  z= reverse(x)     /*ª*obtain the number to be examined.    */
do k=1  by 3                             /*ª*while there're dec. digit to examine.*/
newV4= reverse( substr(z, k, 3) )            /*ª*obtain 3 dec. digs (a period) from Z.*/
if newV4=='   '           then return 0      /*ª*we have reached the "end" of the num.*/
uni= right(newV4, 1)                         /*ª*get units dec. digit of this period. */
if uni//2==1          then return 1      /*ª*if an odd digit, then not an eban #. */
if uni==8             then return 1      /*ª*if an  eight,      "   "   "   "  "  */
tens=substr(newV4, 2, 1)                     /*ª*get tens  dec. digit of this period. */
if tens==1            then return 1      /*ª*if teens,        then not an eban #. */
if tens==2            then return 1      /*ª*if twenties,       "   "   "   "  "  */
if tens>6             then return 1      /*ª*if 70s, 80s, 90s,  "   "   "   "  "  */
hun= left(newV4, 1)                          /*ª*get hundreds dec. dig of this period.*/
if hun==0             then iterate       /*ª*if zero, then there is more of number*/
if hun\==' '          then return 1      /*ª*any hundrEd (not zero) has an  "e".  */
end   /*ª*k*/                              /*ª*A "period" is a group of 3 dec. digs */
return 0                                    /*ª*in the number, grouped from the right*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Eban-numbers\eban-numbers.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
