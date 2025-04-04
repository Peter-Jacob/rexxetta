/*ͺ*REXX pgm normalizes an angle (in a scale), or converts angles from a scale to another.*/
numeric digits length( pi() )   -   length(.)    /*ͺ*use the "length" of pi for precision.*/
parse arg x                                      /*ͺ*obtain optional arguments from the CL*/
if x='' | x=","  then x= '-2 -1 0 1 2 6.2831853 16 57.2957795 359 399 6399 1000000'
w= 20;                                 w7= w+7   /*ͺ*W:  # dec digits past the dec. point.*/
newV1 = 'degrees';       newV2= "gradians";        newV3 = 'mils';           newV4 = "radians"
newV10 = words(x)
call hdr newV1 newV2 newV3 newV4
do j=1  for newV10;            y= word(x,j)
say shw(y)        fmt(d2d(y))              fmt(d2g(y))    fmt(d2m(y))    fmt(d2r(y))
end   /*ͺ*j*/

call hdr newV2 newV1 newV3 newV4
do j=1  for newV10;            y= word(x,j)
say shw(y)        fmt(g2g(y))              fmt(g2d(y))    fmt(g2m(y))    fmt(g2r(y))
end   /*ͺ*j*/

call hdr newV3 newV1 newV2 newV4
do j=1  for newV10;            y= word(x,j)
say shw(y)        fmt(m2m(y))              fmt(m2d(y))    fmt(m2g(y))    fmt(m2r(y))
end   /*ͺ*j*/

call hdr newV4 newV1 newV2 newV3
do j=1  for newV10;            y= word(x,j)
say shw(y)        fmt(r2r(y))              fmt(r2d(y))    fmt(r2g(y))    fmt(r2m(y))
end   /*ͺ*j*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
fmt: newV11= format(arg(1), 6,w);  L= length(newV11);  return left(format(newV11/1, 6),L)   /*ͺ*align a #*/
shw: newV11= format(arg(1),12,9);  L= length(newV11);  return left(format(newV11/1,12),L)   /*ͺ*  "   " "*/
pi:  pi= 3.1415926535897932384626433832795028841971693993751058209749445923078;  return pi
d2g: return d2d(arg(1)) *   10  /    9           /*ͺ*convert degrees   ββββΊ gradians.     */
d2m: return d2d(arg(1)) *  160  /    9           /*ͺ*convert degrees   ββββΊ mils.         */
d2r: return d2d(arg(1)) * pi()  /  180           /*ͺ*convert degrees   ββββΊ radians.      */
g2d: return g2g(arg(1)) *    0.9                 /*ͺ*convert gradians  ββββΊ degrees.      */
g2m: return g2g(arg(1)) *   16                   /*ͺ*convert gradians  ββββΊ mils.         */
g2r: return g2g(arg(1)) * pi()  *    0.005       /*ͺ*convert gradians  ββββΊ radians.      */
m2d: return m2m(arg(1)) *    9  *    0.00625     /*ͺ*convert mils      ββββΊ degrees.      */
m2g: return m2m(arg(1)) /   16                   /*ͺ*convert mils      ββββΊ gradians.     */
m2r: return m2m(arg(1)) * pi()  / 3200           /*ͺ*convert mils      ββββΊ radians.      */
r2d: return r2r(arg(1)) *  180  / pi()           /*ͺ*convert radians   ββββΊ degrees.      */
r2g: return r2r(arg(1)) *  200  / pi()           /*ͺ*convert radians   ββββΊ gradians.     */
r2m: return r2r(arg(1)) * 3200  / pi()           /*ͺ*convert radians   ββββΊ mils.         */
d2d: return     arg(1) //  360                   /*ͺ*normalize degrees ββββΊ a unit circle.*/
g2g: return     arg(1) //  400                   /*ͺ*normalize gradiansββββΊ a unit circle.*/
m2m: return     arg(1) // 6400                   /*ͺ*normalize mils    ββββΊ a unit circle.*/
r2r: return     arg(1) // (pi() * 2)             /*ͺ*normalize radians ββββΊ a unit circle.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
hdr: parse arg newV5 newV6 newV7 newV8 .;         newV11= 'β';              say   /*ͺ* [β]  the header line*/
newV9  = 'normalized'
say center(newV5,23  )  center(newV9 newV5,w7) center(newV6,w7  ) center(newV7,w7  ) center(newV8,w7  )
say center('',23,newV11)  center('',w7, newV11) center('',w7,newV11) center('',w7,newV11) center('',w7,newV11)
return                                                      /*ͺ* 'β'  seperator line.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Angles-geometric-normalization-and-conversion\angles-geometric-normalization-and-conversion.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
