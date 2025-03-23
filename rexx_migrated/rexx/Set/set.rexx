/*�*REXX program  demonstrates some  common   SET   functions.                            */
truth.0= 'false';            truth.1= "true"    /*�*two common names for a truth table.   */
set.=                                           /*�*the  order  of sets isn't important.  */

call setAdd 'prime',2 3 2 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97
call setSay 'prime'                             /*�*a small set of some  prime numbers.   */

call setAdd 'emirp',97 97 89 83 79 73 71 67 61 59 53 47 43 41 37 31 29 23 19 17 13 11 7 5 3 2
call setSay 'emirp'                             /*�*a small set of  backward  primes.     */

call setAdd 'happy',1 7 10 13 19 23 28 31 32 44 49 68 70 79 82 86 91 100 94 97 97 97 97 97
call setSay 'happy'                             /*�*a small set of some  happy  numbers.  */

do j=11  to 100  by 10                    /*�*see if  PRIME  contains some numbers. */
call setHas  'prime', j
say '             prime contains'     j":"     truth.result
end   /*�*j*/

call setUnion  'prime','happy','eweion';  call setSay 'eweion'                /*�* (sic). */
call setCommon 'prime','happy','common';  call setSay 'common'
call setDiff   'prime','happy','diff'  ;  call setSay 'diff';        newV1=left('', 12)
call setSubset 'prime','happy'         ;  say newV1 'prime is a subset of happy:' truth.result
call setEqual  'prime','emirp'         ;  say newV1 'prime is  equal   to emirp:' truth.result
exit                                                   /*�*stick a fork in it, we're done.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
setHas:    procedure expose set.; arg newV1 .,newV2 .; return wordpos(newV2, set.newV1)\==0
setAdd:    return set$('add'    , arg(1), arg(2))
setDiff:   return set$('diff'   , arg(1), arg(2), arg(3))
setSay:    return set$('say'    , arg(1), arg(2))
setUnion:  return set$('union'  , arg(1), arg(2), arg(3))
setCommon: return set$('common' , arg(1), arg(2), arg(3))
setEqual:  return set$('equal'  , arg(1), arg(2))
setSubset: return set$('subSet' , arg(1), arg(2))
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
set$: procedure expose set.;   arg $,newV11,newV12,newV13;   setnewV1=set.newV11;   t=newV13;   s=t;   newV2=1
if $=='SAY'    then do;   say "[set."newV11']= 'set.newV11;   return set.newV11;   end
if $=='UNION'  then do
call set$ 'add', newV13, set.newV11
call set$ 'add', newV13, set.newV12
return set.newV13
end
add=$=='ADD';  common=$=='COMMON'; diff=$=='DIFF'; eq=$=='EQUAL'; subset=$=='SUBSET'
if common | diff | eq | subset  then s=newV12
if add  then do;  setnewV1=newV12;  t=newV11;  s=newV11;  end

do j=1  for words(setnewV1);       newV1=word(setnewV1, j);       has=wordpos(newV1, set.s)\==0
if (add    & \has) |,
(common &  has) |,
(diff   & \has)       then set.t=space(set.t newV1)
if (eq | subset) & \has  then return 0
end    /*�*j*/

if subset  then return 1
if eq      then  if arg()>3  then return 1
else return set$('equal', newV12, newV11, 1)
return set.t
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Set\set.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
