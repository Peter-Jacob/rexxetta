/*ช*REXX program reads a config (configuration) file and assigns  VARs  as found within.  */
signal on syntax;      signal on novalue         /*ช*handle REXX source program errors.   */
parse arg cFID newV2 .                               /*ช*cFID:  is the CONFIG file to be read.*/
if cFID==''  then cFID='CONFIG.DAT'              /*ช*Not specified?  Then use the default.*/
bad=                                             /*ช*this will contain all the  bad VARs. */
varList=                                         /*ช*  "    "     "     "   "  good   "   */
maxLenV=0;   blanks=0;   hashes=0;   semics=0;   badVar=0    /*ช*zero all these variables.*/

do j=0  while lines(cFID)\==0                 /*ช*J:   it counts the lines in the file.*/
txt=strip(linein(cFID))                       /*ช*read a line (record) from the file,  */
/*ช*  ยทยทยท & strip leading/trailing blanks*/
if      txt    =''    then do; blanks=blanks+1; iterate; end   /*ช*count # blank lines.*/
if left(txt,1)=='#'   then do; hashes=hashes+1; iterate; end   /*ช*  "   " lines with #*/
if left(txt,1)==';'   then do; semics=semics+1; iterate; end   /*ช*  "   "   "     "  ;*/
eqS=pos('=',txt)                              /*ช*we can't use the   TRANSLATE   BIF.  */
if eqS\==0  then txt=overlay(' ',txt,eqS)     /*ช*replace the first  '='  with a blank.*/
parse var txt xxx value;  upper xxx           /*ช*get the variable name and it's value.*/
value=strip(value)                            /*ช*strip leading and trailing blanks.   */
if value='' then value='true'                 /*ช*if no value,  then use   "true".     */
if symbol(xxx)=='BAD'  then do                /*ช*can REXX utilize the variable name ? */
badVar=badVar+1;  bad=bad xxx;  iterate  /*ช*append to list*/
end
varList=varList xxx                           /*ช*add it to the list of good variables.*/
call value xxx,value                          /*ช*now,  use VALUE to set the variable. */
maxLenV=max(maxLenV,length(value))            /*ช*maxLen of varNames,  pretty display. */
end   /*ช*j*/

vars=words(varList);          newV1= 'ignored that began with a'
say #(j)       'record's(j) "were read from file: " cFID
if blanks\==0  then say #(blanks)  'blank record's(blanks) "were read."
if hashes\==0  then say #(hashes)  'record's(hashes)   newV1   "#  (hash)."
if semics\==0  then say #(semics)  'record's(semics)   newV1   ";  (semicolon)."
if badVar\==0  then say #(badVar)  'bad variable name's(badVar) 'detected:' bad
say;  say 'The list of'    vars    "variable"s(vars)    'and'    s(vars,'their',"it's"),
"value"s(vars)       'follows:'
say;          do k=1  for vars
v=word(varList,k)
say  right(v,maxLenV) '=' value(v)
end   /*ช*k*/
say;  exit                                       /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
s:       if arg(1)==1  then return arg(3);               return word(arg(2) 's',1)
#:       return right(arg(1),length(j)+11)       /*ช*right justify a number & also indent.*/
err:       do j=1  for arg();  say '***error***    ' arg(j);  say;  end  /*ช*j*/;    exit 13
novalue: syntax:   call err 'REXX program' condition('C') "error",,
condition('D'),'REXX source statement (line' sigl"):",sourceline(sigl)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Read-a-configuration-file\read-a-configuration-file.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
