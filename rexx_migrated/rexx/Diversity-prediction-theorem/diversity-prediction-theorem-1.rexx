/*ª* REXX */
Numeric Digits 20
Call diversityTheorem 49,'48 47 51'
Say '--------------------------------------'
Call diversityTheorem 49,'48 47 51 42'
Exit

diversityTheorem:
Parse Arg truth,list
average=average(list)
Say 'average-error='averageSquareDiff(truth,list)
Say 'crowd-error='||(truth-average)**2
Say 'diversity='averageSquareDiff(average,list)
Return

average: Procedure
Parse Arg list
res=0
Do i=1 To words(list)
res=res+word(list,i)  /*ª* accumulate list elements */
End
Return res/words(list)  /*ª* return the average */

averageSquareDiff: Procedure
Parse Arg a,list
res=0
Do i=1 To words(list)
x=word(list,i)
res=res+(x-a)**2      /*ª* accumulate square of differences */
End
Return res/words(list)  /*ª* return the average */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Diversity-prediction-theorem\diversity-prediction-theorem-1.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
