/*ª*REXX pgm shows current date:  yyyy-mm-dd  &  Dayofweek, Month dd, yyyy*/
x = date('S')                       /*ª*get current date as  yyyymmdd  */
yyyy = left(x,4)                       /*ª*pick off year         (4 digs).*/
dd = right(x,2)                      /*ª*pick off day-of-month (2 digs).*/
mm = substr(x,5,2)                   /*ª*pick off month number (2 digs).*/
say yyyy'-'mm"-"dd                     /*ª*yyyy-mm-dd with leading zeroes.*/

weekday = date('W')                    /*ª*dayofweek (Monday or somesuch).*/
month   = date('M')                    /*ª*Month     (August or somesuch).*/
zdd     = dd+0                         /*ª*remove leading zero from  DD   */
say weekday',' month zdd"," yyyy       /*ª*format date as:  Month dd, yyyy*/
/*ª*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Date-format\date-format-1.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
