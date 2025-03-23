/*ª*REXX program simulates a  metronome  (with sound).    Regina REXX only.               */
parse arg bpm bpb dur tockf tockd tickf tickd .  /*ª*obtain optional arguments from the CL*/
if   bpm=='' |   bpm==","  then   bpm= 72        /*ª*the number of  beats  per minute.    */
if   bpb=='' |   bpb==","  then   bpb=  4        /*ª* "    "     "    "     "   bar.      */
if   dur=='' |   dur==","  then   dur=  5        /*ª*duration  of the  run         in secs*/
if tockf=='' | tockf==","  then tockf=400        /*ª*frequency  "  "   tock  sound  " HZ. */
if tockd=='' | tockd==","  then tockd= 20        /*ª*duration   "  "     "     "    " msec*/
if tickf=='' | tickf==","  then tickf=600        /*ª*frequency  "  "   tick    "    " HZ. */
if tickd=='' | tickd==","  then tickd= 10        /*ª*duration   "  "     "     "    " msec*/
call time 'Reset'                                /*ª*reset the REXX elapsed timer.        */
bt=1/bpb                                         /*ª*calculate a   tockâ”€time   interval.  */

do until et>=dur;     et=time('Elasped')       /*ª*process  tick-tocks  for the duration*/
call beep tockf, tockd                         /*ª*sound a beep for the  "TOCK".        */
es=et+1                                        /*ª*bump the elapsed time  "limiter".    */
newV1=et+bt
do until e>=es;        e=time('Elapsed')
if e<newV1 then iterate                       /*ª*time for tock?     */
call beep tickf, tickd                     /*ª*sound a  "tick".   */
newV1=newV1+bt                                   /*ª*bump the TOCK time.*/
end   /*ª*until eâ‰¥es*/
end   /*ª*until etâ‰¥dur*/
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Metronome\metronome-2.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
