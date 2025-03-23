/*�*REXX pgms demonstrates various methods/approaches of invoking/calling a REXX function.*/

/*�*╔════════════════════════════════════════════════════════════════════╗
║ Calling a function that REQUIRES no arguments.                     ║
║                                                                    ║
║ In the REXX language, there is no way to require the caller to not ║
║ pass arguments, but the programmer can check if any arguments were ║
║ (or weren't) passed.                                               ║
╚════════════════════════════════════════════════════════════════════╝*/

yr= yearFunc()                              /*�*the function name is caseless if it isn't */
/*�*enclosed in quotes (') or apostrophes (").*/
say 'year='  yr
exit                                             /*�*stick a fork in it,  we're all done. */

yearFunc: procedure                              /*�*function  ARG  returns the # of args.*/
errmsg= '***error***'                  /*�*an error message eyecatcher string.  */
if arg() \== 0  then say errmsg  "the YEARFUNC function won't accept arguments."
return left( date('Sorted'), 3)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Call-a-function\call-a-function-1.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
