/*�*REXX program  calculates and displays the  Levenshtein distance  between two strings. */
call Levenshtein   'kitten'                        ,     "sitting"
call Levenshtein   'rosettacode'                   ,     "raisethysword"
call Levenshtein   'Sunday'                        ,     "Saturday"
call Levenshtein   'Vladimir Levenshtein[1965]'    ,     "Vladimir Levenshtein[1965]"
call Levenshtein   'this algorithm is similar to'  ,     "Damerau─Levenshtein distance"
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Levenshtein: procedure; parse arg o,t;  oL= length(o);   tL= length(t);     newV1.= 0
say '        original string  = '    o                          /*�*show   old  string*/
say '          target string  = '    t                          /*�*  "   target   "  */
do newV2=1  for tL;   newV1.0.newV2= newV2;   end  /*�*#*/       /*�*the   drop  array.*/
do newV2=1  for oL;   newV1.newV2.0= newV2;   end  /*�*#*/       /*�* "   insert   "   */
do    j=1  for tL;   jm= j-1;    q= substr(t, j, 1)        /*�*obtain character. */
do k=1  for oL;   km= k-1
if q==substr(o, k, 1)  then newV1.k.j= newV1.km.jm              /*�*use previous char.*/
else newV1.k.j= 1   +   min(newV1.km.j,  newV1.k.jm,  newV1.km.jm)
end   /*�*k*/
end      /*�*j*/                                             /*�* [↑]  best choice.*/
say '   Levenshtein distance  = '  newV1.oL.tL;    say;      return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Levenshtein-distance\levenshtein-distance-1.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
