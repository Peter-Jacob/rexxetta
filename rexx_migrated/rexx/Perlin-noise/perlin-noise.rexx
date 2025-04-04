/*ª*REXX program  implements a   Perlin noise algorithm   of a  point  in  3Dâspace.      */
newV2= 97a0895b5a0f830dc95f6035c2e907e18c24671e458e086325f0150a17be0694f778ea4b001ac53e5efcdbcb75230b2039b12158ed953857ae147d88aba844af,
||4aa547868b301ba64d929ee7536fe57a3cd385e6dc695c29372ef528f4668f3641193fa101d85049d14c84bbd05912a9c8c4878274bc9f56a4646dc6adba0340,
||34d9e2fa7c7b05ca2693767eff5255d4cfce3be32f103a11b6bd1c2adfb7aad577f898022c9aa346dd99659ba72bac09811627fd13626c6e4f71e0e8b2b97068,
||daf661e4fb22f2c1eed2900cbfb3a2f1513391ebf90eef6b31c0d61fb5c76a9db854ccb07379322d7f0496fe8aeccd5dde72431d1848f38d80c34e42d73d9cb4
do j=0  for length(newV2)%2;   newV1.j= x2d( substr(newV2,  2 * j  + 1,  2) )
end   /*ª*j*/                                 /*ª* [â]  assign an indexed array.       */
parse arg x y z d .                              /*ª*obtain optional arguments from the CL*/
if x=='' | x==","  then x=   3.14                /*ª*Not specified?  Then use the default.*/
if y=='' | y==","  then y=  42                   /*ª* "      "         "   "   "     "    */
if z=='' | z==","  then z=   7                   /*ª* "      "         "   "   "     "    */
if d=='' | d==","  then d= 100                   /*ª* "      "         "   "   "     "    */
numeric digits d                                 /*ª*use  D  decimal digits for precision.*/
say 'Perlin noise for the 3D point  ['space(x y z, 3)"]  ââââº "       PerlinNoise(x, y, z)
exit                                             /*ª*stick a fork in it,  we're all done. */
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
fade:  procedure; parse arg t;                    return  t**3 * (t * (t * 6 - 15)  +  10)
floor: procedure; parse arg x;       newV2= x % 1;    return  newV2  -   (x < 0)   *   (x \= newV2)
lerp:  procedure; parse arg t,a,b;                return  a  +    t * (b - a)
pick:  newV2= abs( arg(1) ) // 256;                   return  newV1.newV2
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
grad:  procedure; parse arg hash,x,y,z;  newV2= abs(hash) // 16   /*ª*force positive remainder*/
select
when newV2== 0 | newV2==12  then return  x+y;       when newV2== 1 | newV2==14  then return  y-x
when newV2== 2          then return  x-y;       when newV2== 3          then return -x-y
when newV2== 4          then return  x+z;       when newV2== 5          then return  z-x
when newV2== 6          then return  x-z;       when newV2== 7          then return -x-z
when newV2== 8          then return  y+z;       when newV2== 9 | newV2==13  then return  z-y
when newV2==10          then return  y-z
otherwise                return -y-z             /*ª*for cases   11  or  15. */
end   /*ª*select*/
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
PerlinNoise: procedure expose newV1.;     parse arg x,y,z
x$= floor(x) // 256;     x = x - floor(x);    xm= x-1;     u= fade(x)
y$= floor(y) // 256;     y = y - floor(y);    ym= y-1;     v= fade(y)
z$= floor(z) // 256;     z = z - floor(z);    zm= z-1;     w= fade(z)
a = pick(x$   ) + y$;    aa= pick(a) + z$;                ab= pick(a +1) + z$
b = pick(x$ +1) + y$;    ba= pick(b) + z$;                bb= pick(b +1) + z$
return lerp(w, lerp(v, lerp(u,  grad(  pick(aa  ),   x ,    y ,   z   ),    ,
grad(  pick(ba  ),   xm,    y ,   z   )),   ,
lerp(u,  grad(  pick(ab  ),   x ,    ym,   z   ),    ,
grad(  pick(bb  ),   xm,    ym,   z   ))),  ,
lerp(v, lerp(u,  grad(  pick(aa+1),   x ,    y ,   zm  ),    ,
grad(  pick(ba+1),   xm,    y ,   zm  )),   ,
lerp(u,  grad(  pick(ab+1),   x ,    ym,   zm  ),    ,
grad(  pick(bb+1),   xm,    ym,   zm  )))) /1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Perlin-noise\perlin-noise.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
