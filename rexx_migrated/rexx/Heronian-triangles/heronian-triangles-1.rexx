/*ª*REXX program generates & displays primitive Heronian triangles by side length and area*/
parse arg  N  first  area  .                     /*ª*obtain optional arguments from the CL*/
if     N==''  |     N==","  then     N= 200      /*ª*Not specified?  Then use the default.*/
if first==''  | first==","  then first=  10      /*ª* "      "         "   "   "     "    */
if  area==''  |  area==","  then  area= 210      /*ª* "      "         "   "   "     "    */
numeric digits 99                                /*ª*ensure 'nuff dec. digs to calc. N**5.*/
numeric digits max(9, 1 + length(N**5) )         /*ª*minimize decimal digits for REXX pgm.*/
call Heron;       HT= 'Heronian triangles'       /*ª*invoke the  Heron  subroutine.       */
say  newV6          ' primitive'  HT  "found with sides up to "   N  ' (inclusive).'
call show     , 'Listing of the first '      first      ' primitive'      HT":"
call show area, 'Listing of the (above) found primitive'   HT   "with an area of "    area
exit                                             /*ª*stick a fork in it,  we're all done. */
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
Heron: newV2.= 0;  minP= 9e9;  maxP= 0;  maxA= 0;  minA= 9e9;  Ln= length(N)    /*ª*        __*/
newV6= 0;  newV1.= 0;  newV1.2= 1;  newV1.3= 1;  newV1.7= 1;  newV1.8= 1       /*ª*digits Â¬good â  */
do a=3  to N                                   /*ª*start at a minimum side length of 3. */
Aeven= a//2==0                        /*ª*if  A  is even,  B and C must be odd.*/
do b=a+Aeven  to N  by 1+Aeven;   ab= a + b  /*ª*AB: a shortcut for the sum of A & B. */
if b//2==0  then                bump= 1      /*ª*Is  B  even?       Then  C  is odd.  */
else if Aeven  then bump= 0      /*ª*Is  A  even?         "   "   "  "    */
else bump= 1      /*ª*A and B  are both odd,  biz as usual.*/
do c=b+bump  to N  by 2;   s= (ab + c) % 2 /*ª*calculate triangle's perimeter:   S. */
newV7= s*(s-a)*(s-b)*(s-c); if newV7<=0   then iterate /*ª*is  _  not positive?      Skip it*/
parse var newV7 '' -1 z   ; if newV1.z    then iterate /*ª*Last digit not square?    Skip it*/
ar= hIsqrt(newV7);       if ar*ar\==newV7 then iterate /*ª*Is area not an integer?   Skip it*/
if hGCD(a, b, c) \== 1            then iterate /*ª*GCD of sides not equal 1? Skip it*/
newV6= newV6 + 1;                p= ab + c             /*ª*primitive Heronian triangle.     */
minP= min( p, minP);     maxP= max( p, maxP);        Lp= length(maxP)
minA= min(ar, minA);     maxA= max(ar, maxA);        La= length(maxA)
newV7=newV2.ar.p.0 + 1                                 /*ª*bump Heronian triangle counter.  */
newV2.ar.p.0= newV7;  newV2.ar.p.newV7= right(a, Ln)   right(b, Ln)   right(c, Ln)       /*ª*unique.*/
end   /*ª*c*/                                    /*ª* [â]  keep each unique perimeter#*/
end     /*ª*b*/
end       /*ª*a*/;             return newV6              /*ª*return # of Heronian triangles.  */
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
hGCD: x=a;   do j=2  for 2;    y= arg(j);       do until y==0; parse value x//y y with y x
end   /*ª*until*/
end   /*ª*j*/;      return x
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
hIsqrt: procedure; parse arg x;  q= 1;  r= 0;                  do  while q<=x;    q= q * 4
end   /*ª*while q<=x*/
do  while q>1; q=q%4; newV7= x-r-q; r= r%2; if newV7>=0  then parse value newV7 r+q with x r
end   /*ª*while q>1*/;          return r
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
show: m=0;  say;  say;   parse arg ae;     say arg(2);         if ae\==''  then first= 9e9
say;  newV8=left('',9);   newV3= newV8"area:";  newV4= newV8'perimeter:';  newV5= newV8"sides:"  /*ª*literals*/
do   i=minA  to maxA;  if ae\=='' & i\==ae  then iterate          /*ª*= area? */
do j=minP  to maxP  until m>=first      /*ª*only display the  FIRST entries.*/
do k=1  for newV2.i.j.0;    m= m + 1      /*ª*display each  perimeter  entry. */
say right(m, 9)   newV3    right(i, La)    newV4   right(j, Lp)    newV5    newV2.i.j.k
end   /*ª*k*/
end     /*ª*j*/                           /*ª* [â]  use the known perimeters. */
end       /*ª*i*/;            return        /*ª* [â]  show any found triangles. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Heronian-triangles\heronian-triangles-1.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
