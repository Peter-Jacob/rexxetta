/*ª*REXX pgm finds and displays bare language (<lang>) tags without a language specified. */
parse arg iFID .                                 /*ª*obtain optional argument from the CL.*/
if iFID=='' | iFID=","  then iFID= 'BARELANG.HTM'  /*ª*Not specified?  Then assume default*/
call lineout iFID                                /*ª*close the file, just in case its open*/
call linein  ifid,1,0                            /*ª*point to the first record.           */
noLa= 0;  bare= 0;  header=;  heads=             /*ª*initialize various REXX variables.   */
newV3.= 0                                            /*ª*sparse array to hold language headers*/
do recs=0  while lines(iFID)\==0     /*ª*read all lines in the input file.    */
newV4= linein(iFID)                      /*ª*read a line (record) from the input. */
newV4= space(newV4)                          /*ª*elide superfluous blanks from record.*/
if newV4==''  then iterate               /*ª*if a blank line, then skip any tests.*/
call testHead                        /*ª*process possible  ==((header|aaa}}== */
call testLang                        /*ª*   "        "    <lang aaa> or <lang>*/
end   /*ª*recs*/

call lineout iFID                                /*ª*close the file, just in case its open*/
say recs  ' records read from file: '  iFID; say /*ª*show number of records read from file*/
if bare==0  then bare= 'no';    say right(bare, 9)   " bare language tags.";           say

do newV5=1  for words(head);   newV6= word(head, newV5)   /*ª*maybe show  <lang>  for language aaa */
if newV3.newV6\==0  then say right(newV3.newV6, 9)  ' in'  newV6  /*ª*show the count for a particular lang.*/
end   /*ª*#*/

if noLa==0  then noLa= 'no';    say right(noLa, 9)   " in no specified language."
exit 0
/*ª*--------------------------------------------------------------------------------------*/
testHead: @head= '=={{header|';      newV1= "}}=="               /*ª*define two literals. */
hh= pos(@head, newV4     );    if hh==0  then return       /*ª*get start of literal.*/
or= hh + length(@head) - 1                             /*ª*get position of  |   */
hb= pos(newV1, newV4, or);     if hb==0  then return       /*ª*get position of foot.*/
head= substr(newV4, or+1, hb-or-1)                         /*ª*get the language name*/
if head\==''  then header= head                        /*ª*Header?  Then use it.*/
if wordpos(head, heads)==0  then heads= heads head     /*ª*Is lang?  Add--? list*/
return
/*ª*--------------------------------------------------------------------------------------*/
testLang: @lang= '<lang';            newV2= ">"                  /*ª*define two literals. */
s1= pos(@lang, newV4      );   if s1==0  then return       /*ª*get start of literal.*/
gt= pos(newV2, newV4, s1+1)                                /*ª*get position of  <   */
lang= strip( substr(newV4, gt-2, gt-length(@lang) -1 ) )   /*ª*get the language name*/
if lang==''  then bare= bare + 1                       /*ª*No lang?  Bump bares.*/
else @lang= lang                          /*ª*Is lang?  Set lang.  */
if @lang\==''  &  header==''   then noLa= noLa + 1     /*ª*bump  noLang counter.*/
if @lang\==''  &  header\==''  then newV3.head= newV3.head + 1 /*ª*bump  a lang    "    */
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Rosetta-Code-Find-bare-lang-tags\rosetta-code-find-bare-lang-tags.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
