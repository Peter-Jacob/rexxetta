/*�*REXX program creates & displays an ASCII art version of the Yin─Yang (taijitu) symbol.*/
parse arg s1 s2 .                                /*�*obtain optional arguments from the CL*/
if s1=='' | s1==","  then s1=     17             /*�*Not defined?   Then use the default. */
if s2=='' | s2==","  then s2= s1 % 2             /*�* "      "        "   "   "     "     */
if s1>0              then call  Yin_Yang  s1     /*�*create & display 1st Yin-Yang symbol.*/
if s2>0              then call  Yin_Yang  s2     /*�*   "   "    "    2nd    "       "    */
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
in@:     procedure;  parse arg cy,r,x,y;           return x**2  +  (y-cy)**2  <=  r**2
big@:      /*�*in big         circle. */             return in@(  0 ,    r  ,    x,    y )
semi@:     /*�*in semi        circle. */             return in@( r/2,    r/2,    x,    y )
sB@:       /*�*in small black circle. */             return in@( r/2,    r/6,    x,    y )
sW@:       /*�*in small white circle. */             return in@(-r/2,    r/6,    x,    y )
Bsemi@:    /*�*in black semi  circle. */             return in@(-r/2,    r/2,    x,    y )
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Yin_Yang: procedure; parse arg r;  mX= 2;  mY= 1 /*�*aspect multiplier for the  X,Y  axis.*/
do   sy= r*mY  to  -r*mY  by -1;     newV1=                           /*�*$ ≡ an output line*/
do sx=-r*mX  to   r*mX;            x= sx / mX;    y= sy / mY    /*�*apply aspect ratio*/
if big@() then if semi@()  then if sB@()     then newV1= newV1'Θ';                else newV1= newV1"°"
else if Bsemi@()  then if sW@()  then newV1= newV1'°'; else newV1= newV1"Θ"
else if x<0    then newV1= newV1'°'; else newV1= newV1"Θ"
else newV1= newV1' '
end   /*�*sy*/
say strip(newV1, 'T')                              /*�*display one line of a Yin─Yang symbol*/
end     /*�*sx*/;       return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Yin-and-yang\yin-and-yang.rexx was migrated on 23 Mar 2025 at 10:43:36
 * -------------------------------------------------------------------------
*/ 
