/*ª*REXX program performs a  conjugate transpose  on a  complex  square matrix.           */
parse arg N elements;  if N==''|N==","  then N=3 /*ª*Not specified?  Then use the default.*/
k= 0;             do   r=1  for N
do c=1  for N;    k= k+1;      M.r.c= word( word(elements, k)  1,  1)
end   /*ª*c*/
end     /*ª*r*/
call showCmat 'M'        ,N                      /*ª*display a nicely formatted matrix.   */
identity.= 0;                     do d=1  for N;   identity.d.d= 1;    end  /*ª*d*/
call conjCmat 'MH', "M"  ,N                      /*ª*conjugate the  M  matrix  ââââº  MH   */
call showCmat 'MH'       ,N                      /*ª*display a nicely formatted matrix.   */
say 'M is Hermitian:  '    word('no yes', isHermitian('M', "MH", N) + 1)
call multCmat 'M',  'MH', 'MMH',  N              /*ª*multiple the two matrices together.  */
call multCmat 'MH', 'M',  'MHM',  N              /*ª*    "     "   "      "        "      */
say '  M is Normal:   '           word('no yes', isHermitian('MMH', "MHM", N) + 1)
say '  M is Unary:    '           word('no yes',     isUnary('M',   N) + 1)
say 'MMH is Unary:    '           word('no yes',     isUnary('MMH', N) + 1)
say 'MHM is Unary:    '           word('no yes',     isUnary('MHM', N) + 1)
exit                                             /*ª*stick a fork in it,  we're all done. */
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
cP:       procedure; arg ',' c;        return word( strip( translate(c, , 'IJ') )  0, 1)
rP:       procedure; parse arg r ',';  return word( r 0, 1)  /*ª*âââmaybe return a 0 â    */
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
conjCmat: parse arg matX,matY,rows 1 cols;                call normCmat matY, rows
do   r=1  for rows;   newV2=
do c=1  for cols;   v= value(matY'.'r"."c)
rP= rP(v);     cP= -cP(v);                 call value matX'.'c"."r, rP','cP
end   /*ª*c*/
end     /*ª*r*/;                return
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
isHermitian: parse arg matX,matY,rows 1 cols;                 call normCmat matX, rows
call normCmat matY, rows
do   r=1  for rows;  newV2=
do c=1  for cols
if value(matX'.'r"."c) \= value(matY'.'r"."c)  then return 0
end   /*ª*c*/
end     /*ª*r*/;                return 1
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
isUnary: parse arg matX,rows 1 cols
do   r=1  for rows;    newV2=
do c=1  for cols;    z= value(matX'.'r"."c);   rP= rP(z);       cP= cP(z)
if abs( sqrt( rP(z) **2  +  cP(z)**2)  -  (r==c)) >= .0001  then return 0
end   /*ª*c*/
end     /*ª*r*/;                return 1
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
multCmat: parse arg matA,matB,matT,rows 1 cols;               call value matT'.', 0
do     r=1  for rows;  newV2=
do   c=1  for cols
do k=1  for cols;  T= value(matT'.'r"."c);   Tr= rP(T);   Tc= cP(T)
A= value(matA'.'r"."k);   Ar= rP(A);   Ac= cP(A)
B= value(matB'.'k"."c);   Br= rP(B);   Bc= cP(B)
Pr= Ar*Br - Ac*Bc;    Pc= Ac*Br  +  Ar*Bc;   Tr= Tr+Pr;   Tc= Tc+Pc
call value  matT'.'r"."c,Tr','Tc
end   /*ª*k*/
end     /*ª*c*/
end       /*ª*r*/;              return
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
normCmat: parse arg matN,rows 1 cols
do   r=1  to rows;  newV2=
do c=1  to cols;  v= translate( value(matN'.'r"."c), , "IiJj")
parse upper  var  v  real  ','  cplx
if real\==''  then real= real / 1
if cplx\==''  then cplx= cplx / 1;             if cplx=0  then cplx=
if cplx\==''  then cplx= cplx"j"
call value matN'.'r"."c,  strip(real','cplx,  "T",  ',')
end   /*ª*c*/
end     /*ª*r*/;                return
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
showCmat: parse arg matX,rows,cols;    if cols==''  then cols= rows;       newV1= left('', 6)
say;  say center('matrix' matX, 79, 'â');      call normCmat matX, rows, cols
do   r=1  to rows;  newV2=
do c=1  to cols;  newV2= newV2 newV1 left( value(matX'.'r"."c),  9)
end   /*ª*c*/
say newV2
end     /*ª*r*/;      say;      return
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
sqrt: procedure; parse arg x;  if x=0  then return 0;   d=digits();  numeric form;   h=d+6
numeric digits; parse value format(x,2,1,,0) 'E0'  with  g 'E' newV2 .;  g=g *.5'e'newV2 % 2
m.=9;  do j=0  while h>9;     m.j=h;              h=h%2+1;       end /*ª*j*/
do k=j+5  to 0  by -1; numeric digits m.k; g=(g+x/g)*.5;  end /*ª*k*/; return g
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Conjugate-transpose\conjugate-transpose.rexx was migrated on 23 Mar 2025 at 10:43:09
 * -------------------------------------------------------------------------
*/ 
