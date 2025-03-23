/*�*REXX program processes instrument data as read from a time sorted data file.*/
iFID= 'LICENSE.LOG'                    /*�*the fileID of the   input  file.     */
high=0                                 /*�*highest number of licenses (so far). */
newV1=0                                    /*�*the count of number of licenses out. */
n=0                                    /*�*the number of  highest licenses out. */
do recs=0  while lines(iFID)\==0   /*�* [↓]  read file  until  end─of─file. */
parse value linein(iFID) with . newV2 . newV3       /*�*get IN│OUT status, job info.*/
if newV2=='IN'  then                   newV1=newV1-1    /*�*decrement the license count.*/
else if newV2=='OUT'  then newV1=newV1+1    /*�*increment  "     "      "   */
if newV1 >high then do;  n=1;    job.1=newV3;  end  /*�*the job info for highest cnt*/
if newV1==high then do;  n=n+1;  job.n=newV3;  end  /*�* "   "    "   "   equal   " */
high=max(high,newV1)                            /*�*calculate max license count.*/
end   /*�*while ···*/

say recs  'records read from the input file: '  iFID
say 'The maximum number of licenses out is '    high        " at:"
say
do j=1  for n                     /*�*show what/when max licenses occurred.*/
say left('',20)  job.j            /*�*indent the information displayed.    */
end   /*�*j*/                       /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Text-processing-Max-licenses-in-use\text-processing-max-licenses-in-use-1.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
