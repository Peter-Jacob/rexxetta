/*ª*REXX program reads a CSV file & appends a SUM column (which is the sum of all columns)*/
parse arg iFID .                                  /*ª*obtain optional argument from the CL*/
if iFID=='' | iFID==","  then iFID= 'CSV_SUM.DAT' /*ª*Not specified?  Then use the default*/
call linein iFID,1,0                              /*ª*position the input file to line one.*/
/*ª* [â†‘]  only needed if pgm is nested. */
do rec=1  while lines(iFID)\==0               /*ª*read the input file  (all records). */
x= linein(iFid);     y= translate(x, , ',')   /*ª*read a rec; change commas to blanks.*/
newV2= 0                                          /*ª*initial the sum to zero.            */
do j=1  for words(y);     newV3= word(y, j)    /*ª*get a CSV value.  */
if datatype(newV3, 'N')  then newV2= newV2 + newV3         /*ª*Numeric? Add to $.*/
else newV2= 'SUM'         /*ª*Not? Append "SUM".*/
end   /*ª*j*/
newV1.rec = x','newV2                                 /*ª*append the   sum   to the record.   */
end   /*ª*rec*/                                 /*ª*Note: at EOF,  REC â‰¡ # of records+1.*/
say rec-1    ' records read from: '      iFID     /*ª* [â†“]  this elides the need for ERASE*/
call lineout iFID,newV1.1,1                           /*ª*set file ptr to 1st rec., write hdr.*/
do k=2  for rec-2        /*ª*process all the records just read.  */
call lineout iFID,newV1.k    /*ª*write the new CSV record (has SUM). */
end   /*ª*k*/              /*ª*stick a fork in it,  we're all done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\CSV-data-manipulation\csv-data-manipulation-2.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
