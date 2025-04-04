/*ͺ*REXX program puts the  MillerβRabin  primality test  through its paces.               */
parse arg limit times seed .                     /*ͺ*obtain optional arguments from the CL*/
if limit=='' | limit==","  then limit= 1000      /*ͺ*Not specified?  Then use the default.*/
if times=='' | times==","  then times=   10      /*ͺ*  "      "        "   "   "     "    */
if datatype(seed, 'W')  then call random ,,seed  /*ͺ*If seed specified, use it for RANDOM.*/
numeric digits max(200, 2*limit)                 /*ͺ*we're dealing with some ginormous #s.*/
tell= times<0                                    /*ͺ*display primes  only if times is neg.*/
times= abs(times);         w= length(times)      /*ͺ*use absolute value of TIMES; get len.*/
call genP  limit                                 /*ͺ*suspenders now, use a belt later Β·Β·Β· */
newV1= 'MillerβRabin primality test'               /*ͺ*define a character literal for  SAY. */
say "There are"     newV4     'primes β€'     limit   /*ͺ*might as well display some stuff.    */
say                                              /*ͺ* [β]  (skipping unity); show sep line*/
do a=2  to times;     say copies('β', 89)   /*ͺ*(skipping unity)   do range of TIMEs.*/
p= 0                                        /*ͺ*the counter of primes for this pass. */
do z=1  for limit                      /*ͺ*now, let's get busy and crank primes.*/
if \M_Rt(z, a)  then iterate           /*ͺ*Not prime?   Then try another number.*/
p= p + 1                               /*ͺ*well, we found another one, by gum!  */
if tell  then say z   'is prime according to'       newV1       "with K="a
if newV3.z   then iterate
say '[K='a"] "    z   "isn't prime !"  /*ͺ*oopsyβdoopsy  and/or  whoopsyβdaisy !*/
end   /*ͺ*z*/
say '        for 1βββΊ'limit", K="right(a,w)',' newV1 "found"  p  'primes {out of' newV4"}."
end     /*ͺ*a*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
genP: parse arg high;    newV2.=0;    newV2.1=2;   newV2.2=3;    newV3.=newV2.;   newV3.2=1;   newV3.3=1;     newV4=2
do j=newV2.newV4+2  by 2  to high               /*ͺ*just examine odd integers from here. */
do k=2  while k*k<=j;  if j//newV2.k==0  then iterate j;   end  /*ͺ*k*/
newV4= newV4 + 1;       newV2.newV4= j;        newV3.j= 1   /*ͺ*bump prime counter; add prime to the */
end   /*ͺ*j*/;      return                /*ͺ*@. array; define a prime in !. array.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
M_Rt: procedure;  parse arg n,k;  d= n-1;   nL=d /*ͺ*MillerβRabin:   A.K.A.  RabinβMiller.*/
if n==2           then return 1            /*ͺ*special case of (the)  even  prime.  */
if n<2 | n//2==0  then return 0            /*ͺ*check for too low, or an even number.*/

do s=-1  while d//2==0;  d= d % 2       /*ͺ*keep halving  until a zero remainder.*/
end   /*ͺ*while*/

do k;       newV5= random(2, nL)    /*ͺ* [β]  perform the DO loop   K  times.*/
x= newV5**d  //  n                  /*ͺ*X  can get real gihugeic really fast.*/
if x==1 | x==nL  then iterate   /*ͺ*First or penultimate? Try another pow*/
do s;     x= x**2  //  n      /*ͺ*compute new  X   β‘   XΒ²  modulus  N. */
if x==1   then return 0       /*ͺ*if unity,  it's definitely not prime.*/
if x==nL  then leave          /*ͺ*if  N-1,   then it  could  be prime. */
end   /*ͺ*r*/                   /*ͺ* [β]  // is REXX's division remainder*/
if x\==nL   then return 0       /*ͺ*nope, it ain't prime nohows, noway.  */
end     /*ͺ*k*/                   /*ͺ*maybe it's prime, maybe it ain't Β·Β·Β· */
return 1                                   /*ͺ*coulda/woulda/shoulda be prime;  yup.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Miller-Rabin-primality-test\miller-rabin-primality-test.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
