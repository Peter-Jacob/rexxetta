/*�*REXX program to display scope modifiers  (for subroutines/functions). */
a=1/4
b=20
c=3
d=5
call SSN_571  d**4

/*�* at this point,  A   is    defined and equal to      .25       */
/*�* at this point,  B   is    defined and equal to    40          */
/*�* at this point,  C   is    defined and equal to    27          */
/*�* at this point,  D   is    defined and equal to     5          */
/*�* at this point,  FF  isn't defined.                            */
/*�* at this point, EWE  is    defined and equal to 'female sheep' */
/*�* at this point,  G   is    defined and equal to   625          */
exit                                   /*�*stick a fork in it, we're done.*/
/*�*─────────────────────────────────────SSN_571 submarine, er, subroutine*/
SSN_571: procedure expose b c ewe g;  parse arg g
b   = b*2
c   = c**3
ff  = b+c
ewe = 'female sheep'
d   = 55555555
return                     /*�*compliments to Jules Verne's Captain Nemo? */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Scope-modifiers\scope-modifiers-1.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
