/*�*REXX pgm shows current date:  yyyy-mm-dd  &  Dayofweek, Month dd, yyyy*/
/*�* ╔══════════════════════════════════════════════════════════════════╗
║  function              returns               a specific example  ║
║ ───────────   ───────────────────────────   ──────────────────── ║
║  date()        dd mon yyyy                      3 Jun 2009       ║
║  date('N')     (same as above)                                   ║
║  date('B')     days since Jan 1, year 1           735382         ║
║  date('C')     days since Jan 1 this century       5264          ║
║  date('D')     days since Jan 1, this yr            154          ║
║  date('E')     dd/mm/yy                          03/06/09        ║
║  date('I')     yyyy-mm-dd                       2009-03-06       ║
║  date('J')     yyddd                              2009154        ║
║  date('M')     month name                          June          ║
║  date('O')     yy/mm/dd                          09/03/06        ║
║  date('S')     yyyyddmm                          20090603        ║
║  date('T')     seconds since Jan 1st, 1970      1401483686       ║
║  date('U')     mm/dd/yy                          03/06/09        ║
║  date('W')     day─of─the─week                   Wednesday       ║
║ ───────────   ───────────────────────────   ──────────────────── ║
║                                                                  ║
║  Note:  not all of the above are supported by all REXX versions. ║
╚══════════════════════════════════════════════════════════════════╝ */
parse value date('S') with yyyy 5 mm 7 dd   /*�*get various pieces of date*/
say yyyy'-'mm"-"dd                     /*�*yyyy-mm-dd with leading zeroes.*/

say  date('W')","   date('M')   word(date(), 1)","   yyyy
/*�* [↑]  dayofweek  Month dd, yyyy*/
/*�*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Date-format\date-format-2.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
