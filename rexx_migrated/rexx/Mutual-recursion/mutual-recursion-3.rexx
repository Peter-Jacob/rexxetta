/*�*REXX program shows  mutual recursion  (via the Hofstadter Male and Female sequences). */
/*�*───────────────── If LIM is negative, a single result is shown for the abs(lim) entry.*/

parse arg lim .;       if lim==''  then lim= 99;           aLim= abs(lim)
w= length(aLim);       newV1.=.;      newV1.0= 0;     newV2.=.;     newV2.0= 1;    Js=;    Fs=;    Ms=

do j=0  for aLim+1;     call F(J);          call M(j)
if lim<0  then iterate
Js= Js right(j, w);     Fs= Fs right(newV2.j, w);      Ms= Ms right(newV1.j, w)
end   /*�*j*/

if lim>0  then  say 'Js='   Js;        else  say  'J('aLim")="     right(   aLim, w)
if lim>0  then  say 'Fs='   Fs;        else  say  'F('aLim")="     right(newV2.aLim, w)
if lim>0  then  say 'Ms='   Ms;        else  say  'M('aLim")="     right(newV1.aLIM, w)
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
F: procedure expose newV1. newV2.; parse arg n; if newV2.n==.  then newV2.n= n-M(F(n-1));  return newV2.n
M: procedure expose newV1. newV2.; parse arg n; if newV1.n==.  then newV1.n= n-F(M(n-1));  return newV1.n
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Mutual-recursion\mutual-recursion-3.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
