/*ª* REXX ***************************************************************
* Parse Arg rowcount
* 12.07.2012 Walter Pachl  - translated from Python
**********************************************************************/
Parse Arg rowcount
col=0
ll=''                               /*ª* last line of triangle         */
Do j=rowcount*(rowcount-1)/2+1 to rowcount*(rowcount+1)/2
col=col+1                         /*ª* column number                 */
ll=ll j                           /*ª* build last line               */
len.col=length(j)                 /*ª* remember length of column     */
End
Do i=1 To rowcount-1                /*ª* now do and output the rest    */
ol=''
col=0
Do j=i*(i-1)/2+1 to i*(i+1)/2     /*ª* elements of line i            */
col=col+1
ol=ol right(j,len.col)          /*ª* element in proper length      */
end
Say ol                            /*ª* output ith line               */
end
Say ll                              /*ª* output last line              */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Floyds-triangle\floyds-triangle-1.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
