/*�*REXX program converts decimal  ◄───►  balanced ternary;  it also performs arithmetic. */
numeric digits 10000                             /*�*be able to handle  gihugic  numbers. */
Ao = '+-0++0+' ;    Abt =      Ao                /*�*   [↓]  2 literals used by subroutine*/
Bo =    '-436' ;    Bbt = d2bt(Bo);                    newV5 = "(decimal)"
Co =   '+-++-' ;    Cbt =      Co ;                   newV2 = "balanced ternary ="
call btShow  '[a]',       Abt
call btShow  '[b]',       Bbt
call btShow  '[c]',       Cbt
say;                      newV1 = btMul(Abt, btSub(Bbt, Cbt) )
call btShow '[a*(b-c)]',  newV1
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
d2bt: procedure; parse arg x 1;  x= x / 1;    p= 0;  newV3.= '-';   newV3.1= "+";   newV3.0= 0;     newV6=
do  until x==0;           newV7= (x // (3** (p+1) ) )  %  3**p
if newV7== 2  then newV7= -1
else if newV7== -2  then newV7= 1
x= x  -  newV7 * (3**p);      p= p + 1;                     newV6= newV3.newV7  ||  newV6
end   /*�*until*/;          return newV6
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
bt2d: procedure; parse arg x;  r= reverse(x);  newV3.= -1;  newV3.0= 0;  newV6= 0;    newV7= '+';   newV3.newV7= 1
do j=1  for length(x);  newV7= substr(r, j, 1);  newV6= newV6  +  newV3.newV7 * 3 ** (j-1)
end   /*�*j*/;                         return newV6
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
btAdd: procedure; parse arg x,y;    rx= reverse(x);      ry= reverse(y);          carry= 0
newV4.= 0;   newV7= '-';   newV4.newV7= -1;   newV7= "+";  newV4.newV7= 1;  newV3.= '-';   newV3.0= 0;   newV3.1= "+";   newV6=
do j=1  for max( length(x), length(y) )
xnewV7= substr(rx, j, 1);            xn= newV4.xnewV7
ynewV7= substr(ry, j, 1);            yn= newV4.ynewV7
s= xn + yn + carry;           carry= 0
if s== 2  then do;   s=-1;    carry= 1;    end
if s== 3  then do;   s= 0;    carry= 1;    end
if s==-2  then do;   s= 1;    carry=-1;    end
newV6= newV3.s || newV6
end   /*�*j*/
if carry\==0  then newV6= newV3.carry || newV6;                      return btNorm(newV6)
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
btMul: procedure; parse arg x 1 x1 2, y 1 y1 2; if x==0 | y==0  then return 0;  S= 1;  P=0
x= btNorm(x); y= btNorm(y); Lx= length(x); Ly= length(y)  /*�*handle: 0-xxx values.*/
if x1=='-'  then do;   x= btNeg(x);   S= -S;   end        /*�*positate the number. */
if y1=='-'  then do;   y= btNeg(y);   S= -S;   end        /*�*    "     "    "     */
if Ly>Lx    then parse value  x y  with  y x              /*�*optimize  "    "     */
do   until  y==0    /*�*keep adding 'til done*/
P= btAdd(P,  x )    /*�*multiple the hard way*/
y= btSub(y, '+')    /*�*subtract  1  from  Y.*/
end   /*�*until*/
if S==-1  then P= btNeg(P);  return P       /*�*adjust the product's sign;  return.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
btNeg:  return translate( arg(1), '-+', "+-")                    /*�*negate bal_ternary #.*/
btNorm: newV7= strip(arg(1), 'L', 0);  if newV7==''  then newV7=0;  return newV7 /*�*normalize the number.*/
btSub:  return btAdd( arg(1), btNeg( arg(2) ) )                  /*�*subtract two BT args.*/
btShow: say center( arg(1), 9)  right( arg(2), 20)  newV2  right( bt2d(arg(2)), 9) newV5;  return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Balanced-ternary\balanced-ternary.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
