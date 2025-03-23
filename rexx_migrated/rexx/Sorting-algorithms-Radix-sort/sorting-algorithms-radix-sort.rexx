/*�*REXX program performs a radix sort on an integer array (can be negative/zero/positive)*/
call gen                                         /*�*call subroutine to generate numbers. */
call radSort  n, w                               /*�*invoke the  radix sort  subroutine.  */
call show                                        /*�*display the elements in the  @  array*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
gen: ILF=  0  2  3  4  5  5  7. 6  6  7 11  7 13  9  8  8 17  8 19  9 10 13 23  9 10 15 ,
9 11 29 10 31 10 14 19 12 10 37 21 16 11 41 12 43 15 11 25 47 11 14 12 20 17 ,
53 11 16 13 22 31 59 12 61 33 13 12 18 16 67 21 26 14 71 12 73 39 13 23 18 18 ,
79 13 12 43 83 14 22 45 32 17 89 13 20 27 34 49 24 13 97 16 17 14  101        ,
'22 103 19 15 55 107 13 109 18 40 15 113  -42'
/*�*excluding -42, abbreviated above list is called the integer log function*/
n= words(ILF)                                            /*�*    I────── L── F───────*/
w= 0;         do m=1  for n;   newV5= word(ILF,m) +0;    newV3.m= newV5;    w= max(w, length(newV5) )
end   /*�*m*/;        return    /*�*W:  is the maximum width ↑ of numbers*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
radSort: procedure expose newV3.;  parse arg size,w;   mote= c2d(' ');    newV6= 1;   newV4.newV6.newV5n= size
newV4.newV6.newV5b= 1;                     if w==''  then w= 8
newV4.newV6.newV5i= 1;  do i=1  for size;  y=newV3.i;  newV3.i= right(abs(y), w, 0);  if y<0  then newV3.i= '-'newV3.i
end  /*�*i*/                                            /*�* [↑]  negative case.*/

do  while newV6\==0;  ctr.= 0;  L= 'ffff'x;   low= newV4.newV6.newV5b;   n= newV4.newV6.newV5n;   newV7= newV4.newV6.newV5i;   H=
newV6= newV6-1                                                      /*�* [↑]   is the radix. */
do j=low  for n;      parse var  newV3.j  newV1  newV5  +1;    ctr.newV5= ctr.newV5 + 1
if ctr.newV5==1 & newV5\==''  then do;  if newV5<<L  then L=newV5;    if newV5>>H  then H=newV5
end  /*�*  ↑↑                                       */
end   /*�*j*/                     /*�*  └┴─────◄───  <<   is a strict comparison.*/
newV5=                                    /*�*      ┌──◄───  >>    " "    "        "     */
if L>>H  then iterate                 /*�*◄─────┘                                    */
if L==H & ctr.newV5==0  then do; newV6= newV6+1;  newV4.newV6.newV5b= low;  newV4.newV6.newV5n= n;  newV4.newV6.newV5i= newV7+1;  iterate
end
L= c2d(L);   H= c2d(H);      newV8= ctr.newV5 + low;        top.newV5= newV8;          ts= mote
max= L
do k=L  to H;   newV5= d2c(k, 1);   c= ctr.newV5  /*�* [↓]  swap 2 item radices.*/
if c>ts  then parse value  c k  with  ts max;     newV8= newV8+c;       top.newV5= newV8
end   /*�*k*/
piv= low                                    /*�*set PIVot to the low part of the sort*/
do  while piv<low+n
it= newV3.piv
do forever;     parse var it  newV1  newV5  +1;         c= top.newV5 -1
if piv>=c  then leave;   top.newV5= c;    newV8= newV3.c;    newV3.c= it;    it= newV8
end   /*�*forever*/
top.newV5= piv;                         newV3.piv= it;        piv= piv + ctr.newV5
end   /*�*while piv<low+n */
i= max
do  until i==max;  newV5= d2c(i, 1);     i= i+1;     if i>H  then i= L;     d= ctr.newV5
if d<=mote  then do;         if d<2  then iterate;          b= top.newV5
do k=b+1  for d-1;                       q= newV3.k
do j=k-1  by -1  to b  while q<<newV3.j;  jp= j+1;   newV3.jp= newV3.j
end   /*�*j*/
jp= j+1;   newV3.jp= q
end     /*�*k*/
iterate
end
newV6= newV6+1;       newV4.newV6.newV5b= top.newV5;       newV4.newV6.newV5n= d;        newV4.newV6.newV5i= newV7 + 1
end   /*�*until i==max*/
end        /*�*while #\==0 */
newV6= 0                                             /*�* [↓↓↓]  handle neg. and pos. arrays. */
do i=size  by -1  for size;    if newV3.i>=0  then iterate;     newV6= newV6+1;      newV2.newV6= newV3.i
end   /*�*i*/
do j=1  for size;   if newV3.j>=0  then do;  newV6= newV6+1;   newV2.newV6= newV3.j;  end;    newV3.j= newV2.j+0
end   /*�*j*/                              /*�* [↑↑↑]  combine 2 lists into 1 list. */
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show:  do j=1  for n;   say 'item'   right(j, w)   "after the radix sort:"   right(newV3.j, w)
end   /*�*j*/;     return                   /*�* [↑]  display sorted items ───► term.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Radix-sort\sorting-algorithms-radix-sort.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
