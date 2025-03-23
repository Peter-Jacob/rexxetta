/*�*REXX program generates & displays primitive Heronian triangles by side length and area*/
parse arg  N  first  area  .                     /*�*obtain optional arguments from the CL*/
if     N==''  |     N==","  then     N= 200      /*�*Not specified?  Then use the default.*/
if first==''  | first==","  then first=  10      /*�* "      "         "   "   "     "    */
if  area==''  |  area==","  then  area= 210      /*�* "      "         "   "   "     "    */
numeric digits 99                                /*�*ensure 'nuff dec. digs to calc. N**5.*/
numeric digits max(9, 1 + length(N**5) )         /*�*minimize decimal digits for REXX pgm.*/
call Heron;       HT= 'Heronian triangles'       /*�*invoke the  Heron  subroutine.       */
say  newV6          ' primitive'  HT  "found with sides up to "   N  ' (inclusive).'
call show     , 'Listing of the first '      first      ' primitive'      HT":"
call show area, 'Listing of the (above) found primitive'   HT   "with an area of "    area
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Heron: newV2.= 0;  minP= 9e9;  maxP= 0;  maxA= 0;  minA= 9e9;  Ln= length(N)    /*�*        __*/
newV6= 0;  newV1.= 0;  newV1.2= 1;  newV1.3= 1;  newV1.7= 1;  newV1.8= 1       /*�*digits ¬good √  */
do a=3  to N                                   /*�*start at a minimum side length of 3. */
Aeven= a//2==0                        /*�*if  A  is even,  B and C must be odd.*/
do b=a+Aeven  to N  by 1+Aeven;   ab= a + b  /*�*AB: a shortcut for the sum of A & B. */
if b//2==0  then                bump= 1      /*�*Is  B  even?       Then  C  is odd.  */
else if Aeven  then bump= 0      /*�*Is  A  even?         "   "   "  "    */
else bump= 1      /*�*A and B  are both odd,  biz as usual.*/
do c=b+bump  to N  by 2;   s= (ab + c) % 2 /*�*calculate triangle's perimeter:   S. */
newV7= s*(s-a)*(s-b)*(s-c); if newV7<=0   then iterate /*�*is  _  not positive?      Skip it*/
parse var newV7 '' -1 z   ; if newV1.z    then iterate /*�*Last digit not square?    Skip it*/
ar= hIsqrt(newV7);       if ar*ar\==newV7 then iterate /*�*Is area not an integer?   Skip it*/
if hGCD(a, b, c) \== 1            then iterate /*�*GCD of sides not equal 1? Skip it*/
newV6= newV6 + 1;                p= ab + c             /*�*primitive Heronian triangle.     */
minP= min( p, minP);     maxP= max( p, maxP);        Lp= length(maxP)
minA= min(ar, minA);     maxA= max(ar, maxA);        La= length(maxA)
newV7=newV2.ar.p.0 + 1                                 /*�*bump Heronian triangle counter.  */
newV2.ar.p.0= newV7;  newV2.ar.p.newV7= right(a, Ln)   right(b, Ln)   right(c, Ln)       /*�*unique.*/
end   /*�*c*/                                    /*�* [↑]  keep each unique perimeter#*/
end     /*�*b*/
end       /*�*a*/;             return newV6              /*�*return # of Heronian triangles.  */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
hGCD: x=a;   do j=2  for 2;    y= arg(j);       do until y==0; parse value x//y y with y x
end   /*�*until*/
end   /*�*j*/;      return x
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
hIsqrt: procedure; parse arg x;  q= 1;  r= 0;                  do  while q<=x;    q= q * 4
end   /*�*while q<=x*/
do  while q>1; q=q%4; newV7= x-r-q; r= r%2; if newV7>=0  then parse value newV7 r+q with x r
end   /*�*while q>1*/;          return r
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show: m=0;  say;  say;   parse arg ae;     say arg(2);         if ae\==''  then first= 9e9
say;  newV8=left('',9);   newV3= newV8"area:";  newV4= newV8'perimeter:';  newV5= newV8"sides:"  /*�*literals*/
do   i=minA  to maxA;  if ae\=='' & i\==ae  then iterate          /*�*= area? */
do j=minP  to maxP  until m>=first      /*�*only display the  FIRST entries.*/
do k=1  for newV2.i.j.0;    m= m + 1      /*�*display each  perimeter  entry. */
say right(m, 9)   newV3    right(i, La)    newV4   right(j, Lp)    newV5    newV2.i.j.k
end   /*�*k*/
end     /*�*j*/                           /*�* [↑]  use the known perimeters. */
end       /*�*i*/;            return        /*�* [↑]  show any found triangles. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Heronian-triangles\heronian-triangles-1.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
