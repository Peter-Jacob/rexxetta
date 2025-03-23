/*�*REXX program to calculate and show the Hickerson series (are near integer). */
numeric digits length(ln2())-length(.) /*�*be able to calculate big factorials. */
parse arg N .                          /*�*get optional number of values to use.*/
if N==''  then N= 1                    /*�*Not specified?  Then use the default.*/
newV1= 1                                   /*�* [↓]  compute possible Hickerson #s. */
do j=1  for N;  newV2= Hickerson(j)   /*�*traipse thru a range of Hickerson #s.*/
newV3= right(newV2 * 10 % 1,  1)          /*�*get 1st decimal digit past dec. point*/
if newV3==0 | newV3==9  then newV4= 'almost integer'                /*�*the number is, */
else newV4= '              '                /*�*  or it ain't. */
say right(j,3)  newV4  format(newV2, , 5) /*�*show number with 5 dec digs fraction.*/
end   /*�*j*/
exit                                   /*�*stick a fork in it,  we're all done. */
/*�*─────────────────────────────────────────────────────────────────────────────────────────────────────────*/
Hickerson: parse arg z;     newV1= newV1 * z;          return  newV1  /  (2*ln2() ** (z+1) )
ln2: return .69314718055994530941723212145817656807550013436025525412068000949339362196969471560586332699641,
|| 8687542001481020570685733685520235758130557032670751635075961930727570828371435190307038623891673471123,
|| 3501153644979552391204751726815749320651555247341395258829504530070953263666426541042391578149520437404,
|| 3038550080194417064167151864471283996817178454695702627163106454615025720740248163777338963855069526066,
|| 83411372738737229289564935470257626520988596932019650585547647033067936544325476327449512504060694381470
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Hickerson-series-of-almost-integers\hickerson-series-of-almost-integers-3.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
