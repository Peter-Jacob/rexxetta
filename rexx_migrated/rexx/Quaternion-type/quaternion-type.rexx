/*ª*REXX program performs some operations on  quaternion type numbers and displays results*/
q = 1 2 3 4    ;                     q1 = 2 3 4 5
r = 7          ;                     q2 = 3 4 5 6
call qShow  q                         ,     'q'
call qShow  q1                        ,     'q1'
call qShow  q2                        ,     'q2'
call qShow  r                         ,     'r'
call qShow  qNorm(q)                  ,     'norm q'                  ,        "task 1:"
call qShow  qNeg(q)                   ,     'negative q'              ,        "task 2:"
call qShow  qConj(q)                  ,     'conjugate q'             ,        "task 3:"
call qShow  qAdd( r, q  )             ,     'addition r+q'            ,        "task 4:"
call qShow  qAdd(q1, q2 )             ,     'addition q1+q2'          ,        "task 5:"
call qShow  qMul( q, r  )             ,     'multiplication q*r'      ,        "task 6:"
call qShow  qMul(q1, q2 )             ,     'multiplication q1*q2'    ,        "task 7:"
call qShow  qMul(q2, q1 )             ,     'multiplication q2*q1'    ,        "task 8:"
exit                                             /*ª*stick a fork in it,  we're all done. */
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
qConj: procedure; parse arg x;    call qXY;    return    x.1    (-x.2)    (-x.3)    (-x.4)
qNeg:  procedure; parse arg x;    call qXY;    return   -x.1    (-x.2)    (-x.3)    (-x.4)
qNorm: procedure; parse arg x;    call qXY;    return sqrt(x.1**2 +x.2**2 +x.3**2 +x.4**2)
qAdd:  procedure; parse arg x,y;  call qXY 2;  return x.1+y.1  x.2+y.2  x.3+y.3  x.4+y.4
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
qMul:  procedure; parse arg x,y;  call qXY y
return x.1*y.1 -x.2*y.2 -x.3*y.3 -x.4*y.4     x.1*y.2 +x.2*y.1 +x.3*y.4 -x.4*y.3 ,
x.1*y.3 -x.2*y.4 +x.3*y.1 +x.4*y.2     x.1*y.4 +x.2*y.3 -x.3*y.2 +x.4*y.1
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
qShow: procedure; parse arg x;          call qXY;                  newV1=
do m=1  for 4;  newV2= x.m;    if newV2==0  then iterate;     if newV2>=0  then newV2= '+'newV2
if m\==1  then newV2= newV2 || substr('âijk', m, 1);          newV1= strip(newV1 || newV2, , "+")
end   /*ª*m*/
say left(arg(3), 9)   right(arg(2), 20)       ' âââº '       newV1;           return newV1
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
qXY:                     do n=1  for 4; x.n= word( word(x, n) 0, 1)/1;  end /*ª*n*/
if arg()==1  then do m=1  for 4; y.m= word( word(y, m) 0, 1)/1;  end /*ª*m*/;  return
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
sqrt:  procedure; parse arg x;  if x=0  then return 0;   d= digits();   i=;   m.=9;  h=d+6
numeric digits; numeric form;    if x<0  then parse value  -x  'i'    with    x  i
parse value format(x, 2, 1, , 0) 'E0'   with   g  "E"  newV2  .;       g= g *.5'e'newV2 % 2
do j=0  while h>9;       m.j=h;                 h= h % 2   +  1;      end  /*ª*j*/
do k=j+5  to 0  by -1;   numeric digits m.k;    g= (g + x/g)* .5;     end  /*ª*k*/
numeric digits d;           return (g/1)i                 /*ª*make complex if  X<0 */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Quaternion-type\quaternion-type.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
