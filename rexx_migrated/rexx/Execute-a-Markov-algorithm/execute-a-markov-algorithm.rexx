/*ͺ*REXX program executes a  Markov  algorithm(s)  against  specified entries.            */
parse arg low high .                             /*ͺ*allows which  ruleset  to process.   */
if  low=='' |  low==","  then  low=1             /*ͺ*Not specified?  Then use the default.*/
if high=='' | high==","  then high=6             /*ͺ* "      "         "   "   "     "    */
tellE= low<0;          tellR= high<0             /*ͺ*flags: used to display file contents.*/
call readEntry
do j=abs(low)  to abs(high)       /*ͺ*process each of these  rulesets.     */
call readRules j                  /*ͺ*read    a particular   ruleset.      */
call execRules j                  /*ͺ*execute "     "            "         */
say 'result for ruleset'      j      "ββββΊ"      newV2.j
end   /*ͺ*j*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
execRules: parse arg q .;           if tellE | tellR  then say      /*ͺ*show a blank line?*/
do f=1
do k=1  while newV1.k\=='';      if left(newV1.k, 1)=='#' | newV1.k=''  then iterate
parse var  newV1.k   a   ' ->'    b  /*ͺ*obtain the  A  &  B  parts from rule.*/
a=strip(a);      b=strip(b)      /*ͺ*strip leading and/or trailing blanks.*/
fullstop= left(b, 1)==.          /*ͺ*is this a  "fullstop"  rule?   1β‘yes */
if fullstop  then b=substr(b, 2) /*ͺ*purify the  B  part of the rule.     */
old=newV2.q                          /*ͺ*remember the value before the change.*/
newV2.q=changestr(a, newV2.q, b)         /*ͺ*implement the  ruleset  change.      */
if fullstop   then if old\==newV2.q  then return          /*ͺ*should we stop? */
if old\==newV2.q  then iterate f     /*ͺ*Has Entry changed?   Then start over.*/
end   /*ͺ*k*/
return
end     /*ͺ*f*/
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
readEntry: eFID= 'MARKOV.ENT';     if tellE  then say               /*ͺ*show a blank line?*/
newV2.=                                   /*ͺ*placeholder for all the test entries.*/
do e=1  while lines(eFID)\==0  /*ͺ*read the input file until End-Of-File*/
newV2.e=linein(eFID);  if tellE  then say 'test entry'    e    "ββββΊ"    newV2.e
end   /*ͺ*e*/                    /*ͺ* [β]  read and maybe echo the entry. */
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
readRules: parse arg newV3 .;  rFID= 'MARKOV_R.'newV3;  if tellR  then say  /*ͺ*show a blank line?*/
newV1.=                                   /*ͺ*placeholder for all the Markov rules.*/
do r=1  while lines(rFID)\==0  /*ͺ*read the input file until End-Of-File*/
newV1.r=linein(rFID);  if tellR  then say 'ruleSet' newV3"."left(r,4) 'ββββΊ' newV1.r
end   /*ͺ*r*/                    /*ͺ* [β]  read and maybe echo the rule.  */
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Execute-a-Markov-algorithm\execute-a-markov-algorithm.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
