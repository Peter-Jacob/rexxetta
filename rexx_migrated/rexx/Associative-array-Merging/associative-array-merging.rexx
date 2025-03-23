/*�*REXX program merges two associative arrays  (requiring an external list of indices).  */
newV1.=                                              /*�*define default value(s) for arrays.  */
newV2.wAAn= 21;      newV2.wKey= 7;       newV2.wVal= 7      /*�*max widths of:  AAname, keys, values.*/
call defAA  'base',     "name Rocket Skates",   'price 12.75',   "color yellow"
call defAA  'update',   "price 15.25",          "color red",     'year 1974'
call show   'base'
call show   'update'
call show   'new'
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
defAA: procedure expose newV1. newV2.;  parse arg AAn;      new= 'new'   /*�*get AA name; set NEW.*/
do j=2  to arg();   parse value arg(j)  with  key val   /*�*obtain key and value.*/
newV1.AAn.key= val                          /*�*assign a  value  to a  key for AAn.  */
if wordpos(key, newV1.AAN.?keys)==0  then newV1.AAn.?keys= newV1.AAn.?keys key
/*�* [↑]  add to key list if not in list.*/
newV1.new.key= val                          /*�*assign a  value  to a  key for "new".*/
if wordpos(key, newV1.new.?keys)==0  then newV1.new.?keys= newV1.new.?keys key
/*�* [↑]  add to key list if not in list.*/
newV2.wKey= max(newV2.wKey, length(key) )       /*�*find max width of a name of a  key.  */
newV2.wVal= max(newV2.wVal, length(val) )       /*�*  "   "    "    " "   "   " "  value.*/
newV2.wAA = max(newV2.wAAn, length(AAn) )       /*�*  "   "    "    " "   "   "    array.*/
end   /*�*j*/
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show:  procedure expose newV1. newV2.;  parse arg AAn;      say;     newV3= '═'    /*�*set title char.*/
do j=1  for words(newV1.AAn.?keys)                                /*�*process keys.  */
if j==1  then say  center('associate array', newV2.wAAn,     newV3)  ,
center("key"            , newV2.wKey,     newV3)  ,
center('value'          , newV2.wVal + 2, newV3)
key= word(newV1.AAn.?keys, j)                              /*�*get the name of a key.*/
say center(AAn, newV2.wAAn)  right(key, newV2.wKey)  newV1.AAn.key /*�*show some information.*/
end   /*�*j*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Associative-array-Merging\associative-array-merging.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
