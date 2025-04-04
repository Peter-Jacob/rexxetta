/*ͺ*REXX program shows various ways to display the system time, including other options.  */

say 'ββββββββββββ Normal format of time'
say 'hh:mm:ss        ββββββββββββββββ hh= is  00 βββΊ 23'
say 'hh:mm:ss        ββββββββββββββββ hh= hour   mm= minute   ss= second'
say time()
say time('n')                                    /*ͺ*    (same as the previous example.)  */
say time('N')                                    /*ͺ*       "   "  "      "       "       */
say time('Normal')                               /*ͺ*       "   "  "      "       "       */
say time('nitPick')                              /*ͺ*       "   "  "      "       "       */

say
say 'ββββββββββββ Civil format of time'
say 'hh:mmcc         ββββββββββββββββ hh= is   1 βββΊ 12'
say 'hh:mmam         ββββββββββββββββ hh= hour   mm= minute   am= ante meridiem'
say 'hh:mmpm         ββββββββββββββββ                         pm= post meridiem'
say time('C')
say time('civil')                                /*ͺ*    (same as the previous example.)  */
/*ͺ*ante meridiemβ‘Latin for before midday*/
/*ͺ*post    "       "    "   after   "   */
say
say 'ββββββββββββ long format of time'
say 'hh:mm:ss        ββββββββββββββββ hh= is   0 βββΊ 23'
say 'hh:mm:ss.ffffff ββββββββββββββββ hh= hour   mm= minute   fffff= fractional seconds'
say time('L')
say time('long')                                 /*ͺ*    (same as the previous example.)  */
say time('long time no see')                     /*ͺ*       "   "  "      "       "       */

say
say 'ββββββββββββ complete hours since midnight'
say 'hh              ββββββββββββββββ hh =  0 ββββΊ 23'
say time('H')
say time('hours')                                /*ͺ*    (same as the previous example.)  */

say
say 'ββββββββββββ complete minutes since midnight'
say 'mmmm            ββββββββββββββββ mmmm =  0 ββββΊ 1439'
say time('M')
say time('minutes')                              /*ͺ*    (same as the previous example.)  */

say
say 'ββββββββββββ  complete seconds since midnight'
say 'sssss           ββββββββββββββββ sssss =  0 ββββΊ 86399'
say time('S')
say time('seconds')                              /*ͺ*    (same as the previous example.)  */
/*ͺ*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\System-time\system-time.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
