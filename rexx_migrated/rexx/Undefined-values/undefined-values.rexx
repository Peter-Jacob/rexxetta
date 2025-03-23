/*ª*REXX program test if a (REXX)  variable is  defined  or  not defined.       */
tlaloc = "rain god of the Aztecs."     /*ª*assign a value to the Aztec rain god.*/
/*ª*check if the  rain god  is defined.  */
y= 'tlaloc'
if symbol(y)=="VAR"  then say y  ' is   defined.'
else say y  "isn't defined."

/*ª*check if the  fire god  is defined.  */

y= 'xiuhtecuhtli'                      /*ª*assign a value to the Aztec file god.*/
if symbol(y)=="VAR"  then say y  ' is   defined.'
else say y  "isn't defined."


drop tlaloc                            /*ª*unâ”€define the  TLALOC  REXX variable.*/
/*ª*check if the  rain god  is defined.  */
y= 'tlaloc'
if symbol(y)=="VAR"  then say y  ' is  defined.'
else say y  "isn't defined."
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Undefined-values\undefined-values.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
