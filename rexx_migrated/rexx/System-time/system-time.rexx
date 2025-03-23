/*�*REXX program shows various ways to display the system time, including other options.  */

say '════════════ Normal format of time'
say 'hh:mm:ss        ◄─────────────── hh= is  00 ──► 23'
say 'hh:mm:ss        ◄─────────────── hh= hour   mm= minute   ss= second'
say time()
say time('n')                                    /*�*    (same as the previous example.)  */
say time('N')                                    /*�*       "   "  "      "       "       */
say time('Normal')                               /*�*       "   "  "      "       "       */
say time('nitPick')                              /*�*       "   "  "      "       "       */

say
say '════════════ Civil format of time'
say 'hh:mmcc         ◄─────────────── hh= is   1 ──► 12'
say 'hh:mmam         ◄─────────────── hh= hour   mm= minute   am= ante meridiem'
say 'hh:mmpm         ◄───────────────                         pm= post meridiem'
say time('C')
say time('civil')                                /*�*    (same as the previous example.)  */
/*�*ante meridiem≡Latin for before midday*/
/*�*post    "       "    "   after   "   */
say
say '════════════ long format of time'
say 'hh:mm:ss        ◄─────────────── hh= is   0 ──► 23'
say 'hh:mm:ss.ffffff ◄─────────────── hh= hour   mm= minute   fffff= fractional seconds'
say time('L')
say time('long')                                 /*�*    (same as the previous example.)  */
say time('long time no see')                     /*�*       "   "  "      "       "       */

say
say '════════════ complete hours since midnight'
say 'hh              ◄─────────────── hh =  0 ───► 23'
say time('H')
say time('hours')                                /*�*    (same as the previous example.)  */

say
say '════════════ complete minutes since midnight'
say 'mmmm            ◄─────────────── mmmm =  0 ───► 1439'
say time('M')
say time('minutes')                              /*�*    (same as the previous example.)  */

say
say '════════════  complete seconds since midnight'
say 'sssss           ◄─────────────── sssss =  0 ───► 86399'
say time('S')
say time('seconds')                              /*�*    (same as the previous example.)  */
/*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\System-time\system-time.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
