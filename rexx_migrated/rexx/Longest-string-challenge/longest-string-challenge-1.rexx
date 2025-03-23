/*�*REXX program reads a file  and  displays  the  longest [widest]  record(s) [line(s)]. */
signal on notReady                               /*�*when E-O-F is reached,  jump/branch. */
iFID= 'LONGEST.TXT'                              /*�*the default file identifier for input*/
parse arg fid .                                  /*�*obtain optional argument from the CL.*/
do newV1=1  to length(fid);          iFID=fid    /*�*Specified?   Then use what's given.  */
end   /*�*#*/
newV2=                                               /*�*the maximum width  (so far).         */
do forever;    newV3=linein(iFID);   newV4=newV3         /*�*read a line from the input file.     */
t=0                                          /*�*don't do the initialization next time*/
do newV1=t  for t;    newV2=newV4;       newV4=;        newV5=. || newV3;       end  /*�*just do 1st time.*/
do newV1=length(newV2' ')  to length(newV4) for 1;  newV5=;             end  /*�*found widest rec.*/
do newV1=length(newV2)     to length(newV4) for 1;  newV5=newV5'a0d'x || newV3; end  /*�*append it to  $. */
/*�* [↑]  variable  #  isn't really used.*/
newV2=left(.,  max( length(newV2), length(newV4) ) )     /*�*!:  is the max length record, so far.*/
end   /*�*forever*/
/*�* [↓]  comes here when file gets E─O─F*/
notReady:   do j=length(newV2)  to length(newV2)  for length(newV2)    /*�*handle the case of no input*/
say substr(newV5, 2)                     /*�*display (all) the longest records.   */
end   /*�*j*/                          /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Longest-string-challenge\longest-string-challenge-1.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
