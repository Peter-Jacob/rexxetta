/*ª* Simple ARexx program to open a port after checking if it's already open */
IF Show('PORTS','ROSETTA') THEN DO           /*ª* Port is already open; exit */
SAY 'This program may only be run in a single instance at a time.'
EXIT 5                                    /*ª* Exit with a mild warning   */
END
/*ª* Open rexxsupport.library so that ports can be opened   */
IF ~Show('LIBRARIES','rexxsupport.library')
THEN CALL AddLib('rexxsupport.library',0,-30,0)

IF ~OpenPort('ROSETTA')    THEN EXIT 10       /*ª* Open port, end if it fails */

SAY 'Program is now running.'

DO FOREVER                                    /*ª* Busyloop                   */
/*ª* Program stuff here */
END

EXIT 0
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Determine-if-only-one-instance-is-running\determine-if-only-one-instance-is-running.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
