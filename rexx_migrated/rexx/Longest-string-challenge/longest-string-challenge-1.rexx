/*ª*REXX program reads a file  and  displays  the  longest [widest]  record(s) [line(s)]. */
signal on notReady                               /*ª*when E-O-F is reached,  jump/branch. */
iFID= 'LONGEST.TXT'                              /*ª*the default file identifier for input*/
parse arg fid .                                  /*ª*obtain optional argument from the CL.*/
do newV1=1  to length(fid);          iFID=fid    /*ª*Specified?   Then use what's given.  */
end   /*ª*#*/
newV2=                                               /*ª*the maximum width  (so far).         */
do forever;    newV3=linein(iFID);   newV4=newV3         /*ª*read a line from the input file.     */
t=0                                          /*ª*don't do the initialization next time*/
do newV1=t  for t;    newV2=newV4;       newV4=;        newV5=. || newV3;       end  /*ª*just do 1st time.*/
do newV1=length(newV2' ')  to length(newV4) for 1;  newV5=;             end  /*ª*found widest rec.*/
do newV1=length(newV2)     to length(newV4) for 1;  newV5=newV5'a0d'x || newV3; end  /*ª*append it to  $. */
/*ª* [â†‘]  variable  #  isn't really used.*/
newV2=left(.,  max( length(newV2), length(newV4) ) )     /*ª*!:  is the max length record, so far.*/
end   /*ª*forever*/
/*ª* [â†“]  comes here when file gets Eâ”€Oâ”€F*/
notReady:   do j=length(newV2)  to length(newV2)  for length(newV2)    /*ª*handle the case of no input*/
say substr(newV5, 2)                     /*ª*display (all) the longest records.   */
end   /*ª*j*/                          /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Longest-string-challenge\longest-string-challenge-1.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
