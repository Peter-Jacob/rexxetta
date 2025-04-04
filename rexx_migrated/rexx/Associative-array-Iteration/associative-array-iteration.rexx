/*ͺ*REXX program demonstrates how to  set and display  values  for an  associative array. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ
β The (below) two REXX statements aren't really necessary,  but it shows how to      β
β define any and all entries in a associative array so that if a "key" is used that  β
β isn't defined, it can be displayed to indicate such,  or its value can be checked  β
β to determine if a particular associative array element has been set (defined).     β
ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
stateF.= ' [not defined yet] '                   /*ͺ*sets any/all state  former  capitals.*/
stateN.= ' [not defined yet] '                   /*ͺ*sets any/all state names.            */
w      = 0                                       /*ͺ*the maximum  length  of a state name.*/
stateL =
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ
β The list of states (empty as of now).  It's convenient to have them in alphabetic  β
β order;  they'll be listed in the order as they are in the REXX program below).     β
β In REXX,  when a key is used  (for a stemmed array,  as they are called in REXX),  β
β and the key isn't assigned a value,  the key's  name  is stored (internally)  as   β
β uppercase  (Latin)  characters  (as in the examples below.   If the  key  has a    β
β a value, the key's value is used as is  (i.e.:  no upper translation is performed).β
β Actually,  any characters can be used,  including blank(s)  and  nonβdisplayable   β
β characters  (including   '00'x,   'ff'x,   commas,   periods,   quotes,   Β·Β·Β·).    β
ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
call setSC 'al',  "Alabama"            ,  'Tuscaloosa'
call setSC 'ca',  "California"         ,  'Benicia'
call setSC 'co',  "Colorado"           ,  'Denver City'
call setSC 'ct',  "Connecticut"        ,  'Hartford and New Haven  (jointly)'
call setSC 'de',  "Delaware"           ,  'New-Castle'
call setSC 'ga',  "Georgia"            ,  'Milledgeville'
call setSC 'il',  "Illinois"           ,  'Vandalia'
call setSC 'in',  "Indiana"            ,  'Corydon'
call setSC 'ia',  "Iowa"               ,  'Iowa City'
call setSC 'la',  "Louisiana"          ,  'New Orleans'
call setSC 'me',  "Maine"              ,  'Portland'
call setSC 'mi',  "Michigan"           ,  'Detroit'
call setSC 'ms',  "Mississippi"        ,  'Natchez'
call setSC 'mo',  "Missouri"           ,  'Saint Charles'
call setSC 'mt',  "Montana"            ,  'Virginia City'
call setSC 'ne',  "Nebraska"           ,  'Lancaster'
call setSC 'nh',  "New Hampshire"      ,  'Exeter'
call setSC 'ny',  "New York"           ,  'New York'
call setSC 'nc',  "North Carolina"     ,  'Fayetteville'
call setSC 'oh',  "Ohio"               ,  'Chillicothe'
call setSC 'ok',  "Oklahoma"           ,  'Guthrie'
call setSC 'pa',  "Pennsylvania"       ,  'Lancaster'
call setSC 'sc',  "South Carolina"     ,  'Charlestown'
call setSC 'tn',  "Tennessee"          ,  'Murfreesboro'
call setSC 'vt',  "Vermont"            ,  'Windsor'

do j=1  for words(stateL)                 /*ͺ*show all capitals that were defined. */
newV1= word(stateL, j)                        /*ͺ*get the next (USA) state in the list.*/
say 'the former capital of  ('newV1") "    left(stateN.newV1, w)      " was "      stateC.newV1
end    /*ͺ*j*/                              /*ͺ* [β]   show states that were defined.*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
setSC: parse arg code,name,cap;   upper code     /*ͺ*get code, name & cap.; uppercase code*/
stateL= stateL code                       /*ͺ*keep a list of all the US state codes*/
stateN.code= name; w= max(w,length(name)) /*ͺ*define the state's name;  max width. */
stateC.code= cap                          /*ͺ*   "    "     "   code to the capital*/
return                                    /*ͺ*return to invoker, SETSC is finished.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Associative-array-Iteration\associative-array-iteration.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
