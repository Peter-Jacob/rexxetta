/*�*REXX program validates a user  "word"  against a  "command table"  with abbreviations.*/
parse arg uw                                     /*�*obtain optional arguments from the CL*/
if uw=''  then uw= 'riG   rePEAT copies  put mo   rest    types   fup.    6       poweRin'
say 'user words: '   uw

newV1= 'Add ALTer  BAckup Bottom  CAppend Change SCHANGE  CInsert CLAst COMPress COpy'   ,
'COUnt COVerlay CURsor DELete CDelete Down DUPlicate Xedit EXPand EXTract Find'   ,
'NFind NFINDUp NFUp CFind FINdup FUp FOrward GET Help HEXType Input POWerinput'   ,
'Join SPlit SPLTJOIN  LOAD  Locate CLocate  LOWercase UPPercase  LPrefix MACRO'   ,
'MErge MOve MODify MSG Next Overlay PARSE PREServe PURge PUT PUTD  Query  QUIT'   ,
'READ  RECover REFRESH RENum REPeat  Replace CReplace  RESet  RESTore  RGTLEFT'   ,
'RIght LEft  SAVE  SET SHift SI  SORT  SOS  STAck STATus  TOP TRAnsfer Type Up'

say 'full words: '   validate(uw)                /*�*display the result(s) to the terminal*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
validate: procedure expose newV1;  arg x;  upper newV1   /*�*ARG   capitalizes all the  X  words. */
newV2=                                     /*�*initialize the return string to null.*/
do j=1  to words(x);   newV3=word(x, j) /*�*obtain a word from the     X  list.  */
do k=1  to words(newV1); a=word(newV1, k) /*�*get a legitimate command name from @.*/
L=verify(newV3, 'abcdefghijklmnopqrstuvwxyz', "M")  /*�*maybe get abbrev's len.*/
if L==0  then L=length(newV3)         /*�*0?  Command name can't be abbreviated*/
if abbrev(a, newV3, L)   then do; newV2=newV2 a;  iterate j;  end  /*�*is valid abbrev?*/
end   /*�*k*/
newV2=newV2 '*error*'                       /*�*processed the whole list, not valid. */
end     /*�*j*/
return strip(newV2)                        /*�*elide the superfluous leading blank. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Abbreviations-easy\abbreviations-easy.rexx was migrated on 23 Mar 2025 at 10:43:04
 * -------------------------------------------------------------------------
*/ 
