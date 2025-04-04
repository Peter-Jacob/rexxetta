/*ͺ*REXX program verifies if a   horizontal ray   from   point P   intersects  a polygon. */
call points 5 5,       5 8,       -10  5,       0  5,       10  5,       8  5,       10 10
A= 2.5;     B= 7.5                      /*ͺ* ββββββ used for shorter arguments (below).*/
call poly 0 0, 10 0,  10 10,  0 10                             ;   call test 'square'
call poly 0 0, 10 0,  10 10,  0 10,  A  A,   B  A,   B  B, A B ;   call test 'square hole'
call poly 0 0,  A A,   0 10,  A  B,  B  B,  10 10,  10  0      ;   call test 'irregular'
call poly 3 0,  7 0,  10  5,  7 10,  3 10,   0  5              ;   call test 'hexagon'
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
in$out: procedure expose point. poly.;     parse arg p;              newV1= 0
do side=1  to poly.0  by 2;  newV1= newV1 +intersect(p, side);   end /*ͺ*side*/
return newV1 // 2                            /*ͺ*ODD  is inside.     EVEN  is outside.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
intersect: procedure expose point. poly.;         parse arg newV2,s;                 sp= s + 1
epsilon= '1e'  ||  (-digits() % 2)
Px= point.newV2.x;     Ax= poly.s.x;       Bx= poly.sp.x
Py= point.newV2.y;     Ay= poly.s.y;       By= poly.sp.y  /*ͺ* [β]  do vertex swap.*/
if Ay>By           then parse  value   Ax Ay Bx By    with    Bx By Ax Ay
if Py=Ay | Py=By   then Py= Py + epsilon
if Py<Ay | Py>By | Px>max(Ax, Bx)  then  return 0
if                 Px<min(Ax, Bx)  then  return 1
if Ax\=Bx          then red = (By-Ay) / (Bx-Ax)
else red = i"1e"  ||  (digits() *2)      /*ͺ* ββββ infinity.*/
if Ax\=Px          then return  (Py-Ay) / (Px-Ax)  >=  red
else return  1
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
points: wx= 0;  wy= 0;   do j=1  for arg();         parse value  arg(j)    with   xx  yy
wx= max(wx, length(xx) );  call  value  'POINT.'j".X",   xx
wy= max(wy, length(yy) );  call  value  'POINT.'j".Y",       yy
end   /*ͺ*j*/
call value point.0,  j-1                         /*ͺ*define the number of points. */
return                                           /*ͺ* [β]  adjust J  (for DO loop)*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
poly:   @= 'POLY.';      parse arg Fx Fy                 /*ͺ* [β]  process the X,Y points.*/
n= 0
do j=1  for arg();      n= n + 1;  parse value arg(j)   with   xx yy
call value @ || n'.X',  xx ;       call value  @ || n".Y", yy
if n//2  then iterate;  n= n + 1        /*ͺ*Inside? Then skip this point.*/
call value @ || n'.X',  xx ;       call value  @ || n".Y", yy
end   /*ͺ*j*/
n= n + 1                                         /*ͺ*POLY.0  is # segments(sides).*/
call value @ || n'.X', Fx;       call value @ || n".Y", Fy;     call value @'0', n
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
test:   say;     do k=1  for point.0;    w= wx + wy + 2  /*ͺ*W, WX, WY β‘are various widths*/
say right('  ['arg(1)"]  point:",  30),
right( right(point.k.x, wx)', 'right(point.k.y, wy), w)     "  is  ",
right( word('outside inside',  in$out(k) + 1),  7)
end   /*ͺ*k*/
return                                           /*ͺ* [β] format the output nicely*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Ray-casting-algorithm\ray-casting-algorithm.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
