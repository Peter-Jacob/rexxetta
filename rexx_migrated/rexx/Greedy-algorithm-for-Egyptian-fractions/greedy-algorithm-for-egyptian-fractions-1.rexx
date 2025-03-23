/*�*REXX program converts a fraction (can be improper) to an Egyptian fraction. */
parse arg fract '' -1 t;  z=newV1egyptF(fract)  /*�*compute the Egyptian fraction.  */
if t\==.  then say  fract   ' ───► '   z    /*�*show Egyptian fraction from C.L.*/
return z                                    /*�*stick a fork in it,  we're done.*/
/*�*────────────────────────────────$EGYPTF subroutine──────────────────────────*/
newV1egyptF: parse arg z 1 zn '/' zd,,newV1;   if zd==''  then zd=1   /*�*whole number ?*/
if z=''               then call erx  "no fraction was specified."
if zd==0              then call erx  "denominator can't be zero:"       zd
if zn==0              then call erx  "numerator can't be zero:"         zn
if zd<0 | zn<0        then call erx  "fraction can't be negative"       z
if \datatype(zn,'W')  then call erx  "numerator must be an integer:"    zn
if \datatype(zd,'W')  then call erx  "denominator must be an integer:"  zd
newV2=zn%zd                                /*�*check if it's an improper fraction.  */
if newV2>=1  then do                       /*�*if improper fraction, then append it.*/
newV1='['newV2"]"                /*�*append the whole # part of fraction. */
zn=zn-newV2*zd               /*�*now, just use the proper fraction.   */
if zn==0  then return newV1  /*�*Is there no fraction? Then we're done*/
end
if zd//zn==0  then do;  zd=zd%zn;  zn=1;  end
do  forever
if zn==1 & datatype(zd,'W')  then return newV1 "1/"zd   /*�*append Egyptian fract.*/
nd=zd%zn+1;      newV1=newV1 '1/'nd          /*�*add unity to integer fraction, append*/
z=newV1fractSub(zn'/'zd,  "-",  1'/'nd)  /*�*go and subtract the two fractions.   */
parse var z zn '/' zd                /*�*extract the numerator and denominator*/
L=2*max(length(zn),length(zd))       /*�*calculate if need more decimal digits*/
if L>=digits()  then numeric digits L+L  /*�*yes, then bump the decimal digits*/
end   /*�*forever*/                    /*�* [↑]  the DO forever ends when zn==1.*/
/*�*────────────────────────────────$FRACTSUB subroutine────────────────────────*/
newV1fractSub: procedure;  parse arg z.1,,z.2 1 zz.2;  arg ,op
do j=1  for 2;    z.j=translate(z.j,'/',"_");   end
if z.1==''  then z.1=(op\=="+" & op\=='-')     /*�*unary +,-     first fraction.*/
if z.2==''  then z.2=(op\=="+" & op\=='-')     /*�*unary +.-    second fraction.*/
do j=1  for 2                                /*�*process both of the fractions*/
if pos('/',z.j)==0     then z.j=z.j"/1";     parse var  z.j  n.j  '/'  d.j
if \datatype(n.j,'N')  then call erx  "numerator isn't an integer:"    n.j
if \datatype(d.j,'N')  then call erx  "denominator isn't an integer:"  d.j
n.j=n.j/1;   d.j=d.j/1                    /*�*normalize numerator/denominator.*/

do  while \datatype(n.j,'W');  n.j=n.j*10/1;  d.j=d.j*10/1;  end /*�*while*/
/*�* [↑]  normalize both numbers.   */
if d.j=0  then call erx  "denominator can't be zero:"   z.j
g=gcd(n.j,d.j);   if g=0  then iterate;     n.j=n.j/g;         d.j=d.j/g
end    /*�*j*/
l=lcm(d.1 d.2);             do j=1  for 2;  n.j=l*n.j/d.j;  d.j=l;  end  /*�*j*/
if op=='-'  then n.2=-n.2
t=n.1+n.2;       u=l;                  if t==0  then return 0
g=gcd(t,u);      t=t/g;     u=u/g;     if u==1  then return t
return t'/'u
/*�*─────────────────────────────general 1─line subs────────────────────────────*/
erx:  say;  say '***error!***' arg(1);       say;          exit 13
gcd:procedure;newV1=;do i=1 for arg();newV1=newV1 arg(i);end;parse var newV1 x z .;if x=0 then x=z;x=abs(x);do j=2 to words(newV1);y=abs(word(newV1,j));if y=0 then iterate;do until newV2==0;newV2=x//y;x=y;y=newV2;end;end;return x
lcm:procedure;y=;do j=1 for arg();y=y arg(j);end;x=word(y,1);do k=2 to words(y);newV3=abs(word(y,k));if newV3=0 then return 0;x=x*newV3/gcd(x,newV3);end;return x
p:  return word(arg(1),1)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Greedy-algorithm-for-Egyptian-fractions\greedy-algorithm-for-egyptian-fractions-1.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
