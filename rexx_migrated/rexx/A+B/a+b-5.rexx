/*ª*REXX program obtains some numbers from the input stream (the console), shows their sum*/
numeric digits 1000                              /*ª*just in case the user gets  ka-razy. */
say 'enter some numbers to be summed:'           /*ª*display a prompt message to terminal.*/
parse pull y                                     /*ª*obtain all numbers from input stream.*/
y=space(y)
y=translate(y,'+',' ')
Interpret 's='y
say 'sum of '  many  " numbers = " s/1           /*ª*display normalized sum s to terminal.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\A+B\a+b-5.rexx was migrated on 23 Mar 2025 at 10:43:04
 * -------------------------------------------------------------------------
*/ 
