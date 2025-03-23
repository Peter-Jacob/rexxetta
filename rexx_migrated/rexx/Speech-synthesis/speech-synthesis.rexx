/*ª*REXX program uses a command line interface to invoke Windows SAM for speech synthesis.*/
parse arg t                                      /*ª*get the (optional) text from the C.L.*/
if t=''  then exit                               /*ª*Nothing to say?    Then exit program.*/
dquote= '"'
rate= 1                                          /*ª*talk:   -10 (slow)   to   10 (fast). */
/*ª* [â†“]  where the rubber meets the road*/
'NIRCMD'  "speak text"  dquote  t  dquote   rate /*ª*NIRCMD  invokes Microsoft's Sam voice*/
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Speech-synthesis\speech-synthesis.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
