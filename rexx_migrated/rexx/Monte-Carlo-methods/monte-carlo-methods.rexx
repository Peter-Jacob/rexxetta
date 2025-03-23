/*�*REXX program computes and displays the value of  pi÷4  using the Monte Carlo algorithm*/
numeric digits 20                                /*�*use 20 decimal digits to handle args.*/
parse arg times chunk digs r? .                  /*�*does user want a specific number?    */
if times=='' | times==","  then times=   5e12    /*�*five trillion should do it, hopefully*/
if chunk=='' | chunk==","  then chunk= 100000    /*�*perform Monte Carlo in  100k  chunks.*/
if digs =='' |  digs==","  then  digs=     99    /*�*indicates to use length of  PI - 1.  */
if datatype(r?, 'W')       then call random ,,r? /*�*Is there a random seed?  Then use it.*/
/*�* [↓]  pi meant to line─up with a SAY.*/
pi= 3.141592653589793238462643383279502884197169399375105820974944592307816406
pi= strip( left(pi, digs + length(.) ) )         /*�*obtain length of pi to what's wanted.*/
numeric digits length(pi) - 1                    /*�*define decimal digits as length PI -1*/
say '                    1         2         3         4         5         6         7   '
say 'scale:    1·234567890123456789012345678901234567890123456789012345678901234567890123'
say                                              /*�* [↑]  a two─line scale for showing pi*/
say 'true pi= '       pi"+"                      /*�*we might as well brag about true  pi.*/
say                                              /*�*display a blank line for separation. */
limit   = 10000 - 1                              /*�*REXX random generates only integers. */
limitSq = limit **2                              /*�*··· so, instead of one, use limit**2.*/
accuracy= 0                                      /*�*accuracy of Monte Carlo pi  (so far).*/
newV1= 'repetitions:  Monte Carlo  pi  is'       /*�*a handy─dandy short literal for a SAY*/
newV2= 0                                             /*�*!:  is the accuracy of pi  (so far). */
do j=1  for times % chunk
do chunk                    /*�*do Monte Carlo, one chunk at─a─time. */
if random(, limit)**2 + random(, limit)**2 <= limitSq   then newV2= newV2 + 1
end   /*�*chunk*/
reps= chunk * j                           /*�*calculate the number of repetitions. */
newV3= compare(4*newV2 / reps, pi)                /*�*compare apples and  ···  crabapples. */
if newV3<=accuracy  then iterate              /*�*Not better accuracy?  Keep truckin'. */
say right(commas(reps), 20) newV1  'accurate to'  newV3-1  "places."  /*�*─1����ֲdec. point*/
accuracy= newV3                               /*�*use this accuracy for next baseline. */
end   /*�*j*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: procedure; arg newV3; do k=length(newV3)-3  to 1  by -3; newV3=insert(',',newV3,k); end;  return newV3
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Monte-Carlo-methods\monte-carlo-methods.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
