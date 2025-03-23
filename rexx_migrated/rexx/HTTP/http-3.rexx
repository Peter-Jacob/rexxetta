/*ª* ft=rexx */
/*ª* GET3.RX - Display contents of an URL on the terminal. */
/*ª* Usage: rexx get3.rx http://rosettacode.org            */
parse arg url .
address system 'curl' url with output fifo ''
address system 'more' with input fifo ''
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\HTTP\http-3.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
