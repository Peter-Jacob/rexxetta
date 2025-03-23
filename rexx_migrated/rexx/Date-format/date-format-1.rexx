/*�*REXX pgm shows current date:  yyyy-mm-dd  &  Dayofweek, Month dd, yyyy*/
x = date('S')                       /*�*get current date as  yyyymmdd  */
yyyy = left(x,4)                       /*�*pick off year         (4 digs).*/
dd = right(x,2)                      /*�*pick off day-of-month (2 digs).*/
mm = substr(x,5,2)                   /*�*pick off month number (2 digs).*/
say yyyy'-'mm"-"dd                     /*�*yyyy-mm-dd with leading zeroes.*/

weekday = date('W')                    /*�*dayofweek (Monday or somesuch).*/
month   = date('M')                    /*�*Month     (August or somesuch).*/
zdd     = dd+0                         /*�*remove leading zero from  DD   */
say weekday',' month zdd"," yyyy       /*�*format date as:  Month dd, yyyy*/
/*�*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Date-format\date-format-1.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
