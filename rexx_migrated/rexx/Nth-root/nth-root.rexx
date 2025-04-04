/*ͺ*REXX program calculates the  Nth root  of  X,  with  DIGS  (decimal digits) accuracy. */
parse arg x root digs .                          /*ͺ*obtain optional arguments from the CL*/
if    x=='' |    x==","   then    x= 2           /*ͺ*Not specified?  Then use the default.*/
if root=='' | root==","   then root= 2           /*ͺ* "       "        "   "   "      "   */
if digs=='' | digs==","   then digs=65           /*ͺ* "       "        "   "   "      "   */
numeric digits digs                              /*ͺ*set the  decimal digits  to   DIGS.  */
say '       x = '    x                           /*ͺ*echo the value of   X.               */
say '    root = '    root                        /*ͺ*  "   "    "    "   ROOT.            */
say '  digits = '    digs                        /*ͺ*  "   "    "    "   DIGS.            */
say '  answer = '    root(x, root)               /*ͺ*show the value of   ANSWER.          */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
root: procedure;  parse arg x 1 Ox, r 1 Or             /*ͺ*arg1 βββΊ x & Ox, 2nd βββΊ r & Or*/
if r==''  then r=2                               /*ͺ*Was root specified?  Assume β. */
if r=0    then return '[n/a]'                    /*ͺ*oops-ay!  Can't do zeroth root.*/
complex= x<0 & R//2==0                           /*ͺ*will the result be complex?    */
oDigs=digits()                                   /*ͺ*get the current number of digs.*/
if x=0 | r=1  then return x/1                    /*ͺ*handle couple of special cases.*/
dm=oDigs+5                                       /*ͺ*we need a little guard room.   */
r=abs(r);   x=abs(x)                             /*ͺ*the absolute values of R and X.*/
rm=r-1                                           /*ͺ*just a fast version of  ROOT -1*/
numeric form                                     /*ͺ*take a good guess at the rootββ*/
parse value format(x,2,1,,0) 'E0' with newV1 'E' newV2 . /*ͺ* ββββββββββββββββββββββββββββββ*/
g= (newV1 / r'E'newV2 % r)  +  (x>1)                     /*ͺ*kinda uses a crude "logarithm".*/
d=5                                              /*ͺ*start with five decimal digits.*/
do until d==dm;   d=min(d+d,dm)             /*ͺ*each time,  precision doubles. */
numeric digits d                            /*ͺ*tell REXX to use   D   digits. */
old=-1                                      /*ͺ*assume some kind of old guess. */
do until old=g;   old=g              /*ͺ*where da rubber meets da roadββ*/
g=format((rm*g**r+x)/r/g**rm,, d-2)  /*ͺ* βββββββ the root computationββ*/
end   /*ͺ*until old=g*/                /*ͺ*maybe until the cows come home.*/
end          /*ͺ*until d==dm*/                /*ͺ*and wait for more cows to come.*/

if g=0        then return 0                      /*ͺ*in case the jillionth root = 0.*/
if Or<0       then g=1/g                         /*ͺ*root < 0 ?   Reciprocal it is! */
if \complex   then g=g*sign(Ox)                  /*ͺ*adjust the sign  (maybe).      */
numeric digits oDigs                             /*ͺ*reinstate the original digits. */
return (g/1)  ||  left('j', complex)             /*ͺ*normalize # to digs, append j ?*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Nth-root\nth-root.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
