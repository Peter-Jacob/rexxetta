/*ͺ*REXX program creates & displays an ASCII art version of the YinβYang (taijitu) symbol.*/
parse arg s1 s2 .                                /*ͺ*obtain optional arguments from the CL*/
if s1=='' | s1==","  then s1=     17             /*ͺ*Not defined?   Then use the default. */
if s2=='' | s2==","  then s2= s1 % 2             /*ͺ* "      "        "   "   "     "     */
if s1>0              then call  Yin_Yang  s1     /*ͺ*create & display 1st Yin-Yang symbol.*/
if s2>0              then call  Yin_Yang  s2     /*ͺ*   "   "    "    2nd    "       "    */
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
in@:     procedure;  parse arg cy,r,x,y;           return x**2  +  (y-cy)**2  <=  r**2
big@:      /*ͺ*in big         circle. */             return in@(  0 ,    r  ,    x,    y )
semi@:     /*ͺ*in semi        circle. */             return in@( r/2,    r/2,    x,    y )
sB@:       /*ͺ*in small black circle. */             return in@( r/2,    r/6,    x,    y )
sW@:       /*ͺ*in small white circle. */             return in@(-r/2,    r/6,    x,    y )
Bsemi@:    /*ͺ*in black semi  circle. */             return in@(-r/2,    r/2,    x,    y )
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
Yin_Yang: procedure; parse arg r;  mX= 2;  mY= 1 /*ͺ*aspect multiplier for the  X,Y  axis.*/
do   sy= r*mY  to  -r*mY  by -1;     newV1=                           /*ͺ*$ β‘ an output line*/
do sx=-r*mX  to   r*mX;            x= sx / mX;    y= sy / mY    /*ͺ*apply aspect ratio*/
if big@() then if semi@()  then if sB@()     then newV1= newV1'Ξ';                else newV1= newV1"Β°"
else if Bsemi@()  then if sW@()  then newV1= newV1'Β°'; else newV1= newV1"Ξ"
else if x<0    then newV1= newV1'Β°'; else newV1= newV1"Ξ"
else newV1= newV1' '
end   /*ͺ*sy*/
say strip(newV1, 'T')                              /*ͺ*display one line of a YinβYang symbol*/
end     /*ͺ*sx*/;       return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Yin-and-yang\yin-and-yang.rexx was migrated on 23 Mar 2025 at 10:43:36
 * -------------------------------------------------------------------------
*/ 
