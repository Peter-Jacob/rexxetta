/*ช*REXX program converts a  decimal  or  rational fraction  to a  continued fraction.    */
numeric digits 230                               /*ช*determines how many terms to be gened*/
say '              1/2  โโโบ CF: '   r2cf( '1/2'      )
say '               3   โโโบ CF: '   r2cf(   3        )
say '             23/8  โโโบ CF: '   r2cf( '23/8'     )
say '             13/11 โโโบ CF: '   r2cf( '13/11'    )
say '             22/7  โโโบ CF: '   r2cf( '22/7 '    )
say '                       ___'
say 'โโโโโโโโโ attempts at โ 2.'
say '14142/1e4          โโโบ CF: '   r2cf( '14142/1e4 '          )
say '141421/1e5         โโโบ CF: '   r2cf( '141421/1e5 '         )
say '1414214/1e6        โโโบ CF: '   r2cf( '1414214/1e6 '        )
say '14142136/1e7       โโโบ CF: '   r2cf( '14142136/1e7 '       )
say '141421356/1e8      โโโบ CF: '   r2cf( '141421356/1e8 '      )
say '1414213562/1e9     โโโบ CF: '   r2cf( '1414213562/1e9 '     )
say '14142135624/1e10   โโโบ CF: '   r2cf( '14142135624/1e10 '   )
say '141421356237/1e11  โโโบ CF: '   r2cf( '141421356237/1e11 '  )
say '1414213562373/1e12 โโโบ CF: '   r2cf( '1414213562373/1e12 ' )
say 'โ2                 โโโบ CF: '   r2cf(  sqrt(2)              )
say
say 'โโโโโโโโโ an attempt at pi'
say 'pi                 โโโบ CF: '   r2cf(  pi() )
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
newV3maxFact: procedure;  parse arg x 1 newV1,y;   y=10**(digits()-1);   b=0;  h=1;  a=1;     g=0
do while a<=y & g<=y;  n=trunc(newV1);  newV2=a;  a=n*a+b;   b=newV2;  newV2=g;  g=n*g+h; h=newV2
if n=newV1 | a/g=x  then do; if a>y | g>y  then iterate; b=a;  h=g;  leave;   end
newV1=1/(newV1-n);  end;                           return  b'/'h
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
pi: return 3.1415926535897932384626433832795028841971693993751058209749445923078164062862,
|| 089986280348253421170679821480865132823066470938446095505822317253594081284,
|| 811174502841027019385211055596446229489549303819644288109756659334461284756,
|| 48233786783165271                        /*ช* ยทยทยท should  โฅ  NUMERIC DIGITS */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
r2cf: procedure; parse arg g 1 s 2;  newV3=;     if s=='-'  then g=substr(g, 2)
else s=
if pos(., g)\==0  then do;  if \datatype(g, 'N')  then call serr 'not numeric:'   g
g=newV3maxfact(g)
end
if pos('/', g)==0      then g=g"/"1
parse var  g   n  '/'  d
if \datatype(n, 'W')   then call serr    "a numerator isn't an integer:"    n
if \datatype(d, 'W')   then call serr  "a denominator isn't an integer:"    d
if d=0                 then call serr  'a denominator is zero'
n=abs(n)                                         /*ช*ensure numerator is positive.  */
do  while  d\==0;      newV2=d    /*ช*where the rubber meets the road*/
newV3=newV3  s || (n%d)               /*ช*append another number to list. */
d=n // d;              n=newV2    /*ช* %  is int div,  // is modulus.*/
end   /*ช*while*/
return strip(newV3)
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
serr: say;    say '***error***';    say;    say arg(1);     say;    exit 13
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
sqrt: procedure; parse arg x;  if x=0  then return 0;  d=digits();   h=d+6;   numeric form
m.=9; numeric digits; parse value format(x,2,1,,0) 'E0' with g 'E' newV2 .; g=g*.5'e'newV2%2
do j=0  while h>9;      m.j=h;               h=h%2+1;       end /*ช*j*/
do k=j+5  to 0  by -1;  numeric digits m.k;  g=(g+x/g)*.5;  end /*ช*k*/
numeric digits d;                      return g/1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Continued-fraction-Arithmetic-Construct-from-rational-number\continued-fraction-arithmetic-construct-from-rational-number.rexx was migrated on 23 Mar 2025 at 10:43:09
 * -------------------------------------------------------------------------
*/ 
