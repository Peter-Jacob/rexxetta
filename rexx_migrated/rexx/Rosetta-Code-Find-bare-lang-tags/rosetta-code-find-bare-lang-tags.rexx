/*�*REXX pgm finds and displays bare language (<lang>) tags without a language specified. */
parse arg iFID .                                 /*�*obtain optional argument from the CL.*/
if iFID=='' | iFID=","  then iFID= 'BARELANG.HTM'  /*�*Not specified?  Then assume default*/
call lineout iFID                                /*�*close the file, just in case its open*/
call linein  ifid,1,0                            /*�*point to the first record.           */
noLa= 0;  bare= 0;  header=;  heads=             /*�*initialize various REXX variables.   */
newV3.= 0                                            /*�*sparse array to hold language headers*/
do recs=0  while lines(iFID)\==0     /*�*read all lines in the input file.    */
newV4= linein(iFID)                      /*�*read a line (record) from the input. */
newV4= space(newV4)                          /*�*elide superfluous blanks from record.*/
if newV4==''  then iterate               /*�*if a blank line, then skip any tests.*/
call testHead                        /*�*process possible  ==((header|aaa}}== */
call testLang                        /*�*   "        "    <lang aaa> or <lang>*/
end   /*�*recs*/

call lineout iFID                                /*�*close the file, just in case its open*/
say recs  ' records read from file: '  iFID; say /*�*show number of records read from file*/
if bare==0  then bare= 'no';    say right(bare, 9)   " bare language tags.";           say

do newV5=1  for words(head);   newV6= word(head, newV5)   /*�*maybe show  <lang>  for language aaa */
if newV3.newV6\==0  then say right(newV3.newV6, 9)  ' in'  newV6  /*�*show the count for a particular lang.*/
end   /*�*#*/

if noLa==0  then noLa= 'no';    say right(noLa, 9)   " in no specified language."
exit 0
/*�*--------------------------------------------------------------------------------------*/
testHead: @head= '=={{header|';      newV1= "}}=="               /*�*define two literals. */
hh= pos(@head, newV4     );    if hh==0  then return       /*�*get start of literal.*/
or= hh + length(@head) - 1                             /*�*get position of  |   */
hb= pos(newV1, newV4, or);     if hb==0  then return       /*�*get position of foot.*/
head= substr(newV4, or+1, hb-or-1)                         /*�*get the language name*/
if head\==''  then header= head                        /*�*Header?  Then use it.*/
if wordpos(head, heads)==0  then heads= heads head     /*�*Is lang?  Add--? list*/
return
/*�*--------------------------------------------------------------------------------------*/
testLang: @lang= '<lang';            newV2= ">"                  /*�*define two literals. */
s1= pos(@lang, newV4      );   if s1==0  then return       /*�*get start of literal.*/
gt= pos(newV2, newV4, s1+1)                                /*�*get position of  <   */
lang= strip( substr(newV4, gt-2, gt-length(@lang) -1 ) )   /*�*get the language name*/
if lang==''  then bare= bare + 1                       /*�*No lang?  Bump bares.*/
else @lang= lang                          /*�*Is lang?  Set lang.  */
if @lang\==''  &  header==''   then noLa= noLa + 1     /*�*bump  noLang counter.*/
if @lang\==''  &  header\==''  then newV3.head= newV3.head + 1 /*�*bump  a lang    "    */
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Rosetta-Code-Find-bare-lang-tags\rosetta-code-find-bare-lang-tags.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
