/*ª*********************************************************************
* 27.03.2014 Walter Pachl
*********************************************************************/
Parse Arg run
first.=1
nn=0
ol=''
lb='00'x
If run='' Then run=1
call cprimes 20,20,'A'
main_loop:
Do ip=1 To 1000000                    /*ª* loop over all primes       */
p=primes.ip                         /*ª* candidate                  */
If p=0 Then
call cprimes 20,hp+1,'B'
p=primes.ip                        /*ª* candidate                  */
r=reverse(p)                       /*ª* reversed candidate         */
If p<>r Then Do                    /*ª* not a palindromic prime    */
If is_prime(r) Then Do           /*ª* reversed p is a prime      */
nn=nn+1                        /*ª* increment number of hits   */
Select
When run<='1' Then Do
If nn<21 Then Call show 1,'the first 20 emirps:',4
If nn=20 Then
Leave
End
When(run='2') Then Do
If hp<8000 Then
Call cprimes 1,8000,'C'
If 7700<p & p<8000 Then Call show 2,'emirps between 7700 and 8000:',5
If p>8000 Then
Leave
End
When(run='3') Then Do
If nn=10000 Then Do
Call show 3,'the 10.000th emirp:',6
Leave
End
End
When(run='4') Then Do
Call cprimes 1,999999    /*ª* dirty trick to speed thins up */
If nn=10000 Then Do
Call show 4,'the 10.000th emirp (alternate version):',6
Leave
End
End
Otherwise Do
Say 'Invoke as ptx 1/2/3'
Exit
End
End
End
End
End
Call oo
Say 'largest prime:' hp
Exit

show:
Parse Arg task,header,nl
If first.task Then Do
Call o header||lb
first.task=0
End
Call o right(p,nl)
If nn=10 Then
Call o lb
Return

cprimes: Procedure Expose primes. psquare. is_prime. nprimes hp
/*ª*********************************************************************
* adapted for my needs from REXX's Extensible prime generation
* Fill the array primes with prime numbers
* so that it contains at least num primes and all primes<=mp
*********************************************************************/
Parse Arg num,mp
If symbol('primes.0')=='LIT' Then Do  /*ª* 1st time here? Initialize */
primes.=0                           /*ª* prime numbers             */
is_prime.=0                         /*ª* is_prime.x -> x is prime  */
psquare.=0                          /*ª* psquare.x = square of     */
plist='2 3 5 7 11 13 17 19 23'      /*ª* knows low primes.         */
Do i=1 For words(plist)
p=word(plist,i)
primes.i=p
is_prime.p=1
End
nprimes=i-1
primes.0=nprimes+1
psquare.nprimes=primes.nprimes**2   /*ª* square of this prime      */
End                             /*ª* [?]  done with building low Ps */
Do j=primes.nprimes+2 By 2 While nprimes<num | primes.nprimes<mp
If j//3==0 Then       Iterate
If right(j,1)==5 Then Iterate
If j//7==0 Then       Iterate
If j//11==0 Then      Iterate
If j//13==0 Then      Iterate
If j//17==0 Then      Iterate
If j//19==0 Then      Iterate
If j//23==0 Then      Iterate
Do k=primes.0-1 While psquare.k<=j  /*ª* check for other known primes */
If j//primes.k==0 Then      /*ª* J is divisible by k-th prime    */
Iterate j                 /*ª* j is not prime                  */
End
nprimes=nprimes+1             /*ª* bump number of primes found.    */
primes.nprimes=j
psquare.nprimes=j*j
is_prime.j=1
hp=j
End
Return

is_prime: Procedure Expose primes. psquare. is_prime. nprimes hp
/*ª*********************************************************************
* check if x is a prime number
*********************************************************************/
Parse Arg x
If x>hp Then
Call cprimes 1,x
Return is_prime.x

o: ol=ol||arg(1)
Return
oo: Do While ol<>''
Parse Var ol l newV1 ol
Say l
End
Return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Emirp-primes\emirp-primes-2.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
