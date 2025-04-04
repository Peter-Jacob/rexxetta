/*ͺ*REXX pgm shows current date:  yyyy-mm-dd  &  Dayofweek, Month dd, yyyy*/
/*ͺ* ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ
β  function              returns               a specific example  β
β βββββββββββ   βββββββββββββββββββββββββββ   ββββββββββββββββββββ β
β  date()        dd mon yyyy                      3 Jun 2009       β
β  date('N')     (same as above)                                   β
β  date('B')     days since Jan 1, year 1           735382         β
β  date('C')     days since Jan 1 this century       5264          β
β  date('D')     days since Jan 1, this yr            154          β
β  date('E')     dd/mm/yy                          03/06/09        β
β  date('I')     yyyy-mm-dd                       2009-03-06       β
β  date('J')     yyddd                              2009154        β
β  date('M')     month name                          June          β
β  date('O')     yy/mm/dd                          09/03/06        β
β  date('S')     yyyyddmm                          20090603        β
β  date('T')     seconds since Jan 1st, 1970      1401483686       β
β  date('U')     mm/dd/yy                          03/06/09        β
β  date('W')     dayβofβtheβweek                   Wednesday       β
β βββββββββββ   βββββββββββββββββββββββββββ   ββββββββββββββββββββ β
β                                                                  β
β  Note:  not all of the above are supported by all REXX versions. β
ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ */
parse value date('S') with yyyy 5 mm 7 dd   /*ͺ*get various pieces of date*/
say yyyy'-'mm"-"dd                     /*ͺ*yyyy-mm-dd with leading zeroes.*/

say  date('W')","   date('M')   word(date(), 1)","   yyyy
/*ͺ* [β]  dayofweek  Month dd, yyyy*/
/*ͺ*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Date-format\date-format-2.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
