call  routineName                      /*ª*no arguments passed to routine.*/
call  routineName  50                  /*ª*one argument (fifty) passed.   */
call  routineName  50,60               /*ª*two arguments        passed.   */
call  routineName  50, 60              /*ª*(same as above)                */
call  routineName  50 ,60              /*ª*(same as above)                */
call  routineName  10*5 , 8**4 - 4     /*ª*(same as above)                */
call  routineName  50 , , , 70         /*ª*4 args passed, 2nd&3rd omitted.*/
/*ª*omitted args are   NOT  null.  */
call  routineName  ,,,,,,,,,,,,,,,,800 /*ª*17 args passed, 16 omitted.    */
call   date                            /*ª*looks for DATE internally first*/
call  'DATE'                           /*ª*  "    "    "  BIF | externally*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Flow-control-structures\flow-control-structures-1.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
