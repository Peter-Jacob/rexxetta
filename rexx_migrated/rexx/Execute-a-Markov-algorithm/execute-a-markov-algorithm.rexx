/*�*REXX program executes a  Markov  algorithm(s)  against  specified entries.            */
parse arg low high .                             /*�*allows which  ruleset  to process.   */
if  low=='' |  low==","  then  low=1             /*�*Not specified?  Then use the default.*/
if high=='' | high==","  then high=6             /*�* "      "         "   "   "     "    */
tellE= low<0;          tellR= high<0             /*�*flags: used to display file contents.*/
call readEntry
do j=abs(low)  to abs(high)       /*�*process each of these  rulesets.     */
call readRules j                  /*�*read    a particular   ruleset.      */
call execRules j                  /*�*execute "     "            "         */
say 'result for ruleset'      j      "───►"      newV2.j
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
execRules: parse arg q .;           if tellE | tellR  then say      /*�*show a blank line?*/
do f=1
do k=1  while newV1.k\=='';      if left(newV1.k, 1)=='#' | newV1.k=''  then iterate
parse var  newV1.k   a   ' ->'    b  /*�*obtain the  A  &  B  parts from rule.*/
a=strip(a);      b=strip(b)      /*�*strip leading and/or trailing blanks.*/
fullstop= left(b, 1)==.          /*�*is this a  "fullstop"  rule?   1≡yes */
if fullstop  then b=substr(b, 2) /*�*purify the  B  part of the rule.     */
old=newV2.q                          /*�*remember the value before the change.*/
newV2.q=changestr(a, newV2.q, b)         /*�*implement the  ruleset  change.      */
if fullstop   then if old\==newV2.q  then return          /*�*should we stop? */
if old\==newV2.q  then iterate f     /*�*Has Entry changed?   Then start over.*/
end   /*�*k*/
return
end     /*�*f*/
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
readEntry: eFID= 'MARKOV.ENT';     if tellE  then say               /*�*show a blank line?*/
newV2.=                                   /*�*placeholder for all the test entries.*/
do e=1  while lines(eFID)\==0  /*�*read the input file until End-Of-File*/
newV2.e=linein(eFID);  if tellE  then say 'test entry'    e    "───►"    newV2.e
end   /*�*e*/                    /*�* [↑]  read and maybe echo the entry. */
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
readRules: parse arg newV3 .;  rFID= 'MARKOV_R.'newV3;  if tellR  then say  /*�*show a blank line?*/
newV1.=                                   /*�*placeholder for all the Markov rules.*/
do r=1  while lines(rFID)\==0  /*�*read the input file until End-Of-File*/
newV1.r=linein(rFID);  if tellR  then say 'ruleSet' newV3"."left(r,4) '───►' newV1.r
end   /*�*r*/                    /*�* [↑]  read and maybe echo the rule.  */
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Execute-a-Markov-algorithm\execute-a-markov-algorithm.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
