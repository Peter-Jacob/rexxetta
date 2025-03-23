/*�*REXX program calculates the  Nth root  of  X,  with  DIGS  (decimal digits) accuracy. */
parse arg x root digs .                          /*�*obtain optional arguments from the CL*/
if    x=='' |    x==","   then    x= 2           /*�*Not specified?  Then use the default.*/
if root=='' | root==","   then root= 2           /*�* "       "        "   "   "      "   */
if digs=='' | digs==","   then digs=65           /*�* "       "        "   "   "      "   */
numeric digits digs                              /*�*set the  decimal digits  to   DIGS.  */
say '       x = '    x                           /*�*echo the value of   X.               */
say '    root = '    root                        /*�*  "   "    "    "   ROOT.            */
say '  digits = '    digs                        /*�*  "   "    "    "   DIGS.            */
say '  answer = '    root(x, root)               /*�*show the value of   ANSWER.          */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
root: procedure;  parse arg x 1 Ox, r 1 Or             /*�*arg1 ──► x & Ox, 2nd ──► r & Or*/
if r==''  then r=2                               /*�*Was root specified?  Assume √. */
if r=0    then return '[n/a]'                    /*�*oops-ay!  Can't do zeroth root.*/
complex= x<0 & R//2==0                           /*�*will the result be complex?    */
oDigs=digits()                                   /*�*get the current number of digs.*/
if x=0 | r=1  then return x/1                    /*�*handle couple of special cases.*/
dm=oDigs+5                                       /*�*we need a little guard room.   */
r=abs(r);   x=abs(x)                             /*�*the absolute values of R and X.*/
rm=r-1                                           /*�*just a fast version of  ROOT -1*/
numeric form                                     /*�*take a good guess at the root─┐*/
parse value format(x,2,1,,0) 'E0' with newV1 'E' newV2 . /*�* ◄────────────────────────────┘*/
g= (newV1 / r'E'newV2 % r)  +  (x>1)                     /*�*kinda uses a crude "logarithm".*/
d=5                                              /*�*start with five decimal digits.*/
do until d==dm;   d=min(d+d,dm)             /*�*each time,  precision doubles. */
numeric digits d                            /*�*tell REXX to use   D   digits. */
old=-1                                      /*�*assume some kind of old guess. */
do until old=g;   old=g              /*�*where da rubber meets da road─┐*/
g=format((rm*g**r+x)/r/g**rm,, d-2)  /*�* ◄────── the root computation─┘*/
end   /*�*until old=g*/                /*�*maybe until the cows come home.*/
end          /*�*until d==dm*/                /*�*and wait for more cows to come.*/

if g=0        then return 0                      /*�*in case the jillionth root = 0.*/
if Or<0       then g=1/g                         /*�*root < 0 ?   Reciprocal it is! */
if \complex   then g=g*sign(Ox)                  /*�*adjust the sign  (maybe).      */
numeric digits oDigs                             /*�*reinstate the original digits. */
return (g/1)  ||  left('j', complex)             /*�*normalize # to digs, append j ?*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Nth-root\nth-root.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
