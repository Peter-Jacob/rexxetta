/*�*REXX program reads a CSV file & appends a SUM column (which is the sum of all columns)*/
parse arg iFID .                                  /*�*obtain optional argument from the CL*/
if iFID=='' | iFID==","  then iFID= 'CSV_SUM.DAT' /*�*Not specified?  Then use the default*/
call linein iFID,1,0                              /*�*position the input file to line one.*/
/*�* [↑]  only needed if pgm is nested. */
do rec=1  while lines(iFID)\==0               /*�*read the input file  (all records). */
x= linein(iFid);     y= translate(x, , ',')   /*�*read a rec; change commas to blanks.*/
newV2= 0                                          /*�*initial the sum to zero.            */
do j=1  for words(y);     newV3= word(y, j)    /*�*get a CSV value.  */
if datatype(newV3, 'N')  then newV2= newV2 + newV3         /*�*Numeric? Add to $.*/
else newV2= 'SUM'         /*�*Not? Append "SUM".*/
end   /*�*j*/
newV1.rec = x','newV2                                 /*�*append the   sum   to the record.   */
end   /*�*rec*/                                 /*�*Note: at EOF,  REC ≡ # of records+1.*/
say rec-1    ' records read from: '      iFID     /*�* [↓]  this elides the need for ERASE*/
call lineout iFID,newV1.1,1                           /*�*set file ptr to 1st rec., write hdr.*/
do k=2  for rec-2        /*�*process all the records just read.  */
call lineout iFID,newV1.k    /*�*write the new CSV record (has SUM). */
end   /*�*k*/              /*�*stick a fork in it,  we're all done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\CSV-data-manipulation\csv-data-manipulation-2.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
