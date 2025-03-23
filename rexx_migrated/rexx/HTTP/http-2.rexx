/*ª* ft=rexx */
/*ª* GET2.RX - Display contents of an URL on the terminal. */
/*ª* Usage: rexx get2.rx http://rosettacode.org            */
parse arg url .
address system 'curl' url with output stem stuff.
do i = 1 to stuff.0
say stuff.i
end
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\HTTP\http-2.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
