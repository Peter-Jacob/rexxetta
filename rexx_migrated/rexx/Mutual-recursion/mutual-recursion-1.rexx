/*�*REXX program shows  mutual recursion  (via the Hofstadter Male and Female sequences). */
parse arg lim .;      if lim=''  then lim= 40;     w= length(lim);      pad= left('', 20)

do j=0  for lim+1;   jj= right(j, w);   ff= right(F(j), w);        mm= right(M(j), w)
say    pad       'F('jj") ="            ff   pad   'M('jj") ="     mm
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
F: procedure;  parse arg n;   if n==0  then return 1;           return  n - M( F(n-1) )
M: procedure;  parse arg n;   if n==0  then return 0;           return  n - F( M(n-1) )
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Mutual-recursion\mutual-recursion-1.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
