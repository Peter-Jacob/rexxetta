/*ª* REXX **************************************************************
* 15.11.2012 Walter Pachl - my own solution
* 16.11.2012 Walter Pachl generalized n prisoners + w killing distance
*                         and s=number of survivors
* 09.05.2013 Walter Pachl accept arguments n w s and fix output
*                         thanks for the review/test
* I see no need for specifying a start count (actually a start number)
* This task states:      n    prisoners are standing on a circle,
*    sequentially numbered from  0  to  n-1.    The 1st prisoner is  0.
* This program should work on EVERY REXX.
* Pls report if this is not the case and let us know what's a problem.
**********************************************************************/
Parse Arg n w s .
If n='?' Then Do
Say 'Invoke the program with the following arguments:'
Say 'n number of prisoners            (default 41)'
Say 'w killing count                  (default  3)'
Say 's number of prisoners to survive (default  1)'
Exit
End
If n='' Then n=41                      /*ª* number of alive prisoners  */
If w='' Then w=3                       /*ª* killing count              */
If s='' Then s=1                       /*ª* nuber of survivors         */
dead.=0                                /*ª* nobody's dead yet          */
nn=n                                   /*ª* wrap around boundary       */
p=-1                                   /*ª* start here                 */
killed=''                              /*ª* output of killings         */
Do until n=s                           /*ª* until one alive prisoner   */
found=0                              /*ª* start looking              */
Do Until found=w                     /*ª* until we have the third    */
p=p+1                              /*ª* next position              */
If p=nn Then p=0                   /*ª* wrap around                */
If dead.p=0 Then                   /*ª* a prisoner who is alive    */
found=found+1                    /*ª* increment found count      */
End
dead.p=1
/*ª*
Say 'killing' p 'now'
*/
n=n-1                                /*ª* shoot the one on this pos. */
killed=killed p                      /*ª* add to output              */
End                                  /*ª* End of main loop           */
Say 'killed:'killed                    /*ª* output killing sequence    */
s=''
Do i=0 To nn-1                            /*ª* look for the surviving p's */
If dead.i=0 Then s=s i               /*ª* found one                  */
End
Say 'Survivor(s):'s                    /*ª* show                       */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Josephus-problem\josephus-problem-1.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
