/*ª*REXX program spits out decimal digits of pi  (one digit at a time)  until  Ctrlâ”€Break.*/
parse arg digs oFID .                            /*ª*obtain optional argument from the CL.*/
if digs=='' | digs==","  then digs= 1e6          /*ª*Not specified?  Then use the default.*/
if oFID=='' | oFID==","  then oFID='PI_SPIT.OUT' /*ª* "      "         "   "   "      "   */
write= digs<0                                    /*ª*if ODIGS is <0, also spit pi to file.*/
numeric digits abs(digs) + 4                     /*ª*with bigger digs, spitting is slower.*/
call time 'Reset'                                /*ª*reset the wallâ”€clock (elapsed) timer.*/
signal on halt                                   /*ª*â”€â”€â”€â–º HALT when Ctrlâ”€Break is pressed.*/
spit= 0                                          /*ª*the index of the spitted pi dec. digs*/
pi=0;  v=5;   vv=v*v;   g=239;   gg=g*g;  s= 16  /*ª*assign some values to some variables.*/
r= 4                                             /*ª*calculate Ï€ with increasing accuracy */
do n=1  by 2  until  old=pi;      old= pi  /*ª*just calculate  pi  with odd integers*/
pi= pi   +   s / (n*v)    -    r / (n*g)   /*ª*    Â·Â·Â·  using John Machin's formula.*/
s= -s;    r= -r;    v= v * vv;   g= g * gg /*ª*compute some variables for shortcuts.*/
if n>3     then spit= spit + 1             /*ª*maintain a lag for pi digits rounding*/
if spit<4  then iterate                    /*ª*Not enough digs yet?  Then don't show*/
newV1= substr(pi, spit-3, 1)                   /*ª*lag behind the true pi calculation.  */
call charout     , newV1         /*ª*write the spitted digits to the term.*/
if write then call charout oFID, newV1         /*ª*  "    "     "      "     "  a  file?*/
end   /*ª*n*/

newV1= substr(pi, spit - 2);   L= length(newV1) - 4      /*ª*handle any residual decimal digits.  */
if L>0  then do                                  /*ª*if any residual digits, then show 'em*/
call charout     , substr(newV1, 1, L)         /*ª*write to term.  */
if write then call charout oFID, substr(newV1, 1, L)         /*ª*  "    " file?  */
end
say                                              /*ª*stick a fork in it,  we're all done. */
exit: say;  say n%2+1  'iterations took'  format(time("Elapsed"),,2)  'seconds.';   exit 0
halt: say;  say 'PI_SPIT halted via use of Ctrlâ”€Break.';  signal exit /*ª*show iterations.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Pi\pi-1.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
