/*�*REXX pgm calculates difference between two angles (in degrees), normalizes the result.*/
numeric digits 25                                    /*�*use enough dec. digits for angles*/
call show      20,                    45             /*�*display angular difference (deg).*/
call show     -45,                    45             /*�*   "       "        "        "   */
call show     -85,                    90             /*�*   "       "        "        "   */
call show     -95,                    90             /*�*   "       "        "        "   */
call show     -45,                   125             /*�*   "       "        "        "   */
call show      45,                   145             /*�*   "       "        "        "   */
call show      29.4803,              -88.6361        /*�*   "       "        "        "   */
call show     -78.3251,             -159.036         /*�*   "       "        "        "   */
call show  -70099.74233810938,     29840.67437876723 /*�*   "       "        "        "   */
call show -165313.6666297357,      33693.9894517456  /*�*   "       "        "        "   */
call show    1174.8380510598456, -154146.66490124757 /*�*   "       "        "        "   */
call show   60175.773067955546,    42213.07192354373 /*�*   "       "        "        "   */
exit                                                 /*�*stick a fork in it,  we're done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show: parse arg a,b;    d=digits();     newV1='º'    /*�*obtain the 2 angles (are in degrees).*/
x=format( ( ( ((b-a) // 360) + 540) // 360) - 180, 4, d)   /*�*compute and format.  */
if pos(., x)\==0  then x=strip( strip(x, 'T', 0), "T", .)  /*�*strip trailing chaff.*/
say center(a || newV1, d)      '─'      center(b || newV1, d)       " ────► "      x || newV1
return                                     /*�* [↑]  display the angular difference.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Angle-difference-between-two-bearings\angle-difference-between-two-bearings.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
