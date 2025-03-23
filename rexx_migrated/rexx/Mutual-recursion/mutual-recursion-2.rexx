/*�*REXX program shows  mutual recursion  (via the Hofstadter Male and Female sequences). */
parse arg lim .;      if lim==''  then lim=40             /*�*assume the default for LIM? */
w= length(lim);       newV1.=.;    newV1.0= 0;     newV2.=.;    newV2.0= 1;     Js=;     Fs=;     Ms=

do j=0  for lim+1
Js= Js right(j, w);     Fs= Fs right( F(j), w);      Ms= Ms right( M(j), w)
end   /*�*j*/
say 'Js='  Js                                    /*�*display the list of  Js  to the term.*/
say 'Fs='  Fs                                    /*�*   "     "    "   "  Fs   "  "    "  */
say 'Ms='  Ms                                    /*�*   "     "    "   "  Ms   "  "    "  */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
F: procedure expose newV1. newV2.; parse arg n; if newV2.n==.  then newV2.n= n-M(F(n-1));  return newV2.n
M: procedure expose newV1. newV2.; parse arg n; if newV1.n==.  then newV1.n= n-F(M(n-1));  return newV1.n
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Mutual-recursion\mutual-recursion-2.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
