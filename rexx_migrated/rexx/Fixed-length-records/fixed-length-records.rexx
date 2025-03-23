/*ª*REXX pgm reads fixedâ”€length 80 byte records;  reverses each record, displays to term. */
iFID= 'FIXEDLEN.TXT'                             /*ª*the file's filename (used for input).*/
call charin iFID, 1, 0                           /*ª*open the file, point rec pointer to 1*/
/*ª* [+]  just to be safe, position file.*/
do j=1  while chars(iFID) >= 80      /*ª*read data records of LRECL â‰¡ eighty. */
newV1.j= charin(iFID, , 80)              /*ª*read a data record of eighty bytes.  */
end   /*ª*j*/
newV2= j - 1                                         /*ª*adjust # of records (J is 1 too high)*/
do k=1  for newV2                        /*ª* [â†“]  process all the records read.  */
say reverse(newV1.k)                     /*ª* reverse a record and write to term. */
end   /*ª*k*/                          /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Fixed-length-records\fixed-length-records.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
