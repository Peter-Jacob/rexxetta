/*ͺ*REXX program computes and displays the value of  piΓ·4  using the Monte Carlo algorithm*/
numeric digits 20                                /*ͺ*use 20 decimal digits to handle args.*/
parse arg times chunk digs r? .                  /*ͺ*does user want a specific number?    */
if times=='' | times==","  then times=   5e12    /*ͺ*five trillion should do it, hopefully*/
if chunk=='' | chunk==","  then chunk= 100000    /*ͺ*perform Monte Carlo in  100k  chunks.*/
if digs =='' |  digs==","  then  digs=     99    /*ͺ*indicates to use length of  PI - 1.  */
if datatype(r?, 'W')       then call random ,,r? /*ͺ*Is there a random seed?  Then use it.*/
/*ͺ* [β]  pi meant to lineβup with a SAY.*/
pi= 3.141592653589793238462643383279502884197169399375105820974944592307816406
pi= strip( left(pi, digs + length(.) ) )         /*ͺ*obtain length of pi to what's wanted.*/
numeric digits length(pi) - 1                    /*ͺ*define decimal digits as length PI -1*/
say '                    1         2         3         4         5         6         7   '
say 'scale:    1Β·234567890123456789012345678901234567890123456789012345678901234567890123'
say                                              /*ͺ* [β]  a twoβline scale for showing pi*/
say 'true pi= '       pi"+"                      /*ͺ*we might as well brag about true  pi.*/
say                                              /*ͺ*display a blank line for separation. */
limit   = 10000 - 1                              /*ͺ*REXX random generates only integers. */
limitSq = limit **2                              /*ͺ*Β·Β·Β· so, instead of one, use limit**2.*/
accuracy= 0                                      /*ͺ*accuracy of Monte Carlo pi  (so far).*/
newV1= 'repetitions:  Monte Carlo  pi  is'       /*ͺ*a handyβdandy short literal for a SAY*/
newV2= 0                                             /*ͺ*!:  is the accuracy of pi  (so far). */
do j=1  for times % chunk
do chunk                    /*ͺ*do Monte Carlo, one chunk atβaβtime. */
if random(, limit)**2 + random(, limit)**2 <= limitSq   then newV2= newV2 + 1
end   /*ͺ*chunk*/
reps= chunk * j                           /*ͺ*calculate the number of repetitions. */
newV3= compare(4*newV2 / reps, pi)                /*ͺ*compare apples and  Β·Β·Β·  crabapples. */
if newV3<=accuracy  then iterate              /*ͺ*Not better accuracy?  Keep truckin'. */
say right(commas(reps), 20) newV1  'accurate to'  newV3-1  "places."  /*ͺ*β1βξεχΦ²dec. point*/
accuracy= newV3                               /*ͺ*use this accuracy for next baseline. */
end   /*ͺ*j*/
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas: procedure; arg newV3; do k=length(newV3)-3  to 1  by -3; newV3=insert(',',newV3,k); end;  return newV3
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Monte-Carlo-methods\monte-carlo-methods.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
