/*�*REXX program  evaluates  some  Machin─like  formulas  and  verifies  their veracity.  */
newV1.=;   pi= pi();        numeric digits( length(pi) ) - length(.);      numeric fuzz 3
say center('  computing with ' digits() " decimal digits  ", 110, '═')
newV1.1 = 'pi/4 =    atan(1/2)    +    atan(1/3)'
newV1.2 = 'pi/4 =  2*atan(1/3)    +    atan(1/7)'
newV1.3 = 'pi/4 =  4*atan(1/5)    -    atan(1/239)'
newV1.4 = 'pi/4 =  5*atan(1/7)    +  2*atan(3/79)'
newV1.5 = 'pi/4 =  5*atan(29/278) +  7*atan(3/79)'
newV1.6 = 'pi/4 =    atan(1/2)    +    atan(1/5)   +    atan(1/8)'
newV1.7 = 'pi/4 =  4*atan(1/5)    -    atan(1/70)  +    atan(1/99)'
newV1.8 = 'pi/4 =  5*atan(1/7)    +  4*atan(1/53)  +  2*atan(1/4443)'
newV1.9 = 'pi/4 =  6*atan(1/8)    +  2*atan(1/57)  +    atan(1/239)'
newV1.10= 'pi/4 =  8*atan(1/10)   -    atan(1/239) -  4*atan(1/515)'
newV1.11= 'pi/4 = 12*atan(1/18)   +  8*atan(1/57)  -  5*atan(1/239)'
newV1.12= 'pi/4 = 16*atan(1/21)   +  3*atan(1/239) +  4*atan(3/1042)'
newV1.13= 'pi/4 = 22*atan(1/28)   +  2*atan(1/443) -  5*atan(1/1393) - 10*atan(1/11018)'
newV1.14= 'pi/4 = 22*atan(1/38)   + 17*atan(7/601) + 10*atan(7/8149)'
newV1.15= 'pi/4 = 44*atan(1/57)   +  7*atan(1/239) - 12*atan(1/682)  + 24*atan(1/12943)'
newV1.16= 'pi/4 = 88*atan(1/172)  + 51*atan(1/239) + 32*atan(1/682)  + 44*atan(1/5357)  + 68           *atan(1/12943)'
newV1.17= 'pi/4 = 88*atan(1/172)  + 51*atan(1/239) + 32*atan(1/682)  + 44*atan(1/5357)  + 68           *atan(1/12944)'
newV1.18= 'pi/4 = 88*atan(1/172)  + 51*atan(1/239) + 32*atan(1/682)  + 44*atan(1/5357)  + 67.9999999994*atan(1/12943)'

do j=1  while  newV1.j\==''                  /*�*evaluate each "Machin─like" formulas.*/
interpret  'answer='        newV1.j          /*�*where REXX does the heavy lifting.   */
say  right( word( 'bad OK', answer + 1),  3)": "          newV1.j
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
pi:   return 3.141592653589793238462643383279502884197169399375105820974944592307816406286
Acos: procedure; parse arg x;            return pi() * .5 - Asin(x)
Atan: procedure; arg x; if abs(x)=1 then return pi()/4*sign(x); return Asin(x/sqrt(1+x*x))
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Asin: procedure; parse arg x 1 z 1 o 1 p;       a=abs(x);       aa=a*a
if a>=sqrt(2)*.5  then  return sign(x)  *  Acos( sqrt(1 - aa) )
do j=2 by 2 until p=z;  p=z;  o=o*aa*(j-1)/j;  z=z+o/(j+1); end /*�*j*/;  return z
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sqrt: procedure; parse arg x; if x=0  then return 0; d=digits(); m.=9; h=d+6; numeric form
numeric digits; parse value format(x,2,1,,0) 'E0'  with  g 'E' newV2 .;  g=g *.5'e'newV2 % 2
do j=0  while h>9;       m.j=h;               h=h%2+1;       end /*�*j*/
do k=j+5  to 0  by -1;   numeric digits m.k;  g=(g+x/g)*.5;  end /*�*k*/;  return g
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Check-Machin-like-formulas\check-machin-like-formulas.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
