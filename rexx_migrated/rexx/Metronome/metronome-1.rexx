/*ª*REXX program simulates a visual (textual)  metronome  (with no sound).                */
parse arg bpm bpb dur .                          /*ª*obtain optional arguments from the CL*/
if bpm=='' | bpm==","  then bpm=72               /*ª*the number of  beats  per minute.    */
if bpb=='' | bpb==","  then bpb= 4               /*ª* "     "    "    "     "   bar.      */
if dur=='' | dur==","  then dur= 5               /*ª*duration of the  run  in seconds.    */
call time 'Reset'                                /*ª*reset the REXX elapsed timer.        */
bt=1/bpb                                         /*ª*calculate a   tock-time   interval.  */

do until et>=dur;    et=time('Elasped')        /*ª*process  tick-tocks  for the duration*/
say; call charout ,'TICK'                      /*ª*show the first tick for the period.  */
es=et+1                                        /*ª*bump the elapsed time  "limiter".    */
newV1=et+bt
do until e>=es;        e=time('Elapsed')
if e<newV1 then iterate                       /*ª*time for tock?     */
call charout , ' tock'                     /*ª*show a  "tock".    */
newV1=newV1+bt                                   /*ª*bump the TOCK time.*/
end   /*ª*until eâ‰¥es*/
end   /*ª*until etâ‰¥dur*/
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Metronome\metronome-1.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
