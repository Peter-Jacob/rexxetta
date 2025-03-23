/*ª*REXX pgm calls a function in a shared library (regutil) to hide/show cursor.*/
z=rxfuncadd('sysloadfuncs', "regutil", 'sysloadfuncs')   /*ª*add a function lib.*/
if z\==0  then do                                        /*ª*test the return cod*/
say 'return code'  z  "from rxfuncadd"    /*ª*tell about bad RC. */
exit z                                    /*ª*exit this program. */
end

call sysloadfuncs                                        /*ª*load the functions.*/

/*ª* [â†“]   call a particular function.   */
call syscurstate 'off'                 /*ª*hide the displaying of the cursor.   */
say 'showing of the cursor is now off' /*ª*inform that the cursor is now hidden.*/

/*ª* Â·Â·Â· and perform some stuff here Â·Â·Â· */
say 'sleeping for three seconds ...'   /*ª*inform the user of what we're doing. */
call sleep 3                           /*ª*might as well sleep for three seconds*/

call syscurstate 'on'                  /*ª*(unhide) the displaying of the cursor*/
say 'showing of the cursor is now on'  /*ª*inform that the cursor is now showing*/
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Terminal-control-Hiding-the-cursor\terminal-control-hiding-the-cursor.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
