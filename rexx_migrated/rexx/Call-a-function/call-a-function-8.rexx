/*�*╔════════════════════════════════════════════════════════════════════╗
║ Distinguishing subroutines and functions.                          ║
║                                                                    ║
║ There is no programmatic difference between subroutines and        ║
║ functions if the subroutine returns a value  (which effectively    ║
║ makes it a function).   REXX allows you to call a function as if   ║
║ it were a subroutine.                                              ║
╚════════════════════════════════════════════════════════════════════╝*/

/*�*╔════════════════════════════════════════════════════════════════════╗
║ In REXX, all arguments are passed by value, never by name,  but it ║
║ is possible to accomplish this if the variable's name is passed    ║
║ and the subroutine/function could use the built-in-function VALUE  ║
║ to retrieve the variable's value.                                  ║
╚════════════════════════════════════════════════════════════════════╝*/

/*�*╔════════════════════════════════════════════════════════════════════╗
║ In the REXX language,  partial application is possible,  depending ║
║ how partial application is defined;  I prefer the 1st definition   ║
║ (as per the "discussion" for "Partial Function Application" task:  ║
║   1.  The "syntactic sugar" that allows one to write some examples ║
║       are:      map (f 1 9)       [1..9]                           ║
║        or:      map (f(1,_,9))    [1, ..., 9]                      ║
╚════════════════════════════════════════════════════════════════════╝*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Call-a-function\call-a-function-8.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
