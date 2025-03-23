/*�*REXX program puts the  Miller─Rabin  primality test  through its paces.               */
parse arg limit times seed .                     /*�*obtain optional arguments from the CL*/
if limit=='' | limit==","  then limit= 1000      /*�*Not specified?  Then use the default.*/
if times=='' | times==","  then times=   10      /*�*  "      "        "   "   "     "    */
if datatype(seed, 'W')  then call random ,,seed  /*�*If seed specified, use it for RANDOM.*/
numeric digits max(200, 2*limit)                 /*�*we're dealing with some ginormous #s.*/
tell= times<0                                    /*�*display primes  only if times is neg.*/
times= abs(times);         w= length(times)      /*�*use absolute value of TIMES; get len.*/
call genP  limit                                 /*�*suspenders now, use a belt later ··· */
newV1= 'Miller─Rabin primality test'               /*�*define a character literal for  SAY. */
say "There are"     newV4     'primes ≤'     limit   /*�*might as well display some stuff.    */
say                                              /*�* [↓]  (skipping unity); show sep line*/
do a=2  to times;     say copies('─', 89)   /*�*(skipping unity)   do range of TIMEs.*/
p= 0                                        /*�*the counter of primes for this pass. */
do z=1  for limit                      /*�*now, let's get busy and crank primes.*/
if \M_Rt(z, a)  then iterate           /*�*Not prime?   Then try another number.*/
p= p + 1                               /*�*well, we found another one, by gum!  */
if tell  then say z   'is prime according to'       newV1       "with K="a
if newV3.z   then iterate
say '[K='a"] "    z   "isn't prime !"  /*�*oopsy─doopsy  and/or  whoopsy─daisy !*/
end   /*�*z*/
say '        for 1──►'limit", K="right(a,w)',' newV1 "found"  p  'primes {out of' newV4"}."
end     /*�*a*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
genP: parse arg high;    newV2.=0;    newV2.1=2;   newV2.2=3;    newV3.=newV2.;   newV3.2=1;   newV3.3=1;     newV4=2
do j=newV2.newV4+2  by 2  to high               /*�*just examine odd integers from here. */
do k=2  while k*k<=j;  if j//newV2.k==0  then iterate j;   end  /*�*k*/
newV4= newV4 + 1;       newV2.newV4= j;        newV3.j= 1   /*�*bump prime counter; add prime to the */
end   /*�*j*/;      return                /*�*@. array; define a prime in !. array.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
M_Rt: procedure;  parse arg n,k;  d= n-1;   nL=d /*�*Miller─Rabin:   A.K.A.  Rabin─Miller.*/
if n==2           then return 1            /*�*special case of (the)  even  prime.  */
if n<2 | n//2==0  then return 0            /*�*check for too low, or an even number.*/

do s=-1  while d//2==0;  d= d % 2       /*�*keep halving  until a zero remainder.*/
end   /*�*while*/

do k;       newV5= random(2, nL)    /*�* [↓]  perform the DO loop   K  times.*/
x= newV5**d  //  n                  /*�*X  can get real gihugeic really fast.*/
if x==1 | x==nL  then iterate   /*�*First or penultimate? Try another pow*/
do s;     x= x**2  //  n      /*�*compute new  X   ≡   X²  modulus  N. */
if x==1   then return 0       /*�*if unity,  it's definitely not prime.*/
if x==nL  then leave          /*�*if  N-1,   then it  could  be prime. */
end   /*�*r*/                   /*�* [↑]  // is REXX's division remainder*/
if x\==nL   then return 0       /*�*nope, it ain't prime nohows, noway.  */
end     /*�*k*/                   /*�*maybe it's prime, maybe it ain't ··· */
return 1                                   /*�*coulda/woulda/shoulda be prime;  yup.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Miller-Rabin-primality-test\miller-rabin-primality-test.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
