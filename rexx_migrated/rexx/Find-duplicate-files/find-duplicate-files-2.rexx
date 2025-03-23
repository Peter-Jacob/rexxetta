/*�*REXX program to reads a (DOS) directory  and  finds and displays files that identical.*/
sep=center(' files are identical in size and content: ',79,"═")    /*�*define the header. */
parse arg newV30;     if newV30all(arg())  then exit                         /*�*boilerplate HELP(?)*/
signal on halt;  signal on novalue;  signal on syntax              /*�*handle exceptions, */

if \newV24  then call err 'this program requires the DOS [environment].'
call getTFID                                     /*�*defines a temporary  File ID for DOS.*/
arg maxSize aDir                                 /*�*obtain optional arguments from the CL*/
if maxSize='' | maxSize="," then maxSize=1000000 /*�*filesize limit (in bytes) [1 million]*/
if \isInt(maxSize)      then call err  "maxSize isn't an integer:"       maxSize
if maxSize<0            then call err  "maxSize can't be negative:"      maxSize
if maxSize=0            then call err  "maxSize can't be zero:"          maxSize
aDir=strip(aDir)                                 /*�*remove any leading or trailing blanks*/
if right(aDir,3)=='*.*' then aDir=substr(aDir,1,length(aDir)-3)   /*�*adjust the dir name.*/
if right(aDir,1)\=='\'  then aDir=aDir"\"        /*�*possibly add a trailing backslash [\]*/
newV13    = 'DIR'                                  /*�*literal for the (DOS)  DIR  command. */
newV1= '/a-d-s-h'                             /*�*ignore DIRs, SYSTEM, and HIDDEN files*/
newV2= '/oS /s'                               /*�*sort DIR's (+ subdirs) files by size.*/
newV4 = '| FIND "/"'                           /*�*the "lines" must have a slash [/].   */
newV9  = 'ERASE'                                /*�*literal for the (DOS)  ERASE command.*/
newV13 aDir newV1 newV2 newV4 '>' tFID     /*�*(DOS) DIR  output ──► temporary file.*/
pFN=                                             /*�*the previous  filename and filesize. */
pSZ=;  do j=0  while lines(tFID)\==0             /*�*process each of the files in the list*/
aLine=linein(tFID)                        /*�*obtain (DOS) DIR's output about a FID*/
parse var aLine . . sz fn                 /*�*obtain the filesize and its fileID.  */
sz=space(translate(sz,,','),0)            /*�*elide any commas from the size number*/
if sz>maxSize  then leave                 /*�*Is the file > maximum?  Ignore file. */
/*�* [↓]  files identical?  (1st million)*/
if sz==pSZ  then  if charin(aDir||pFN,1,sz)==charin(aDir||FN,1,sz)  then do
say sep
say pLine
say aLine
say
end
pSZ=sz;      pFN=FN;      pLine=aLine     /*�*remember the previous stuff for later*/
end   /*�*j*/

say j  'file's(j)  "examined in"  aDir           /*�*show information to the screen.*/
if lines(tFID)\==0  then 'ERASE'  tFID           /*�*do housecleaning  (delete temp file).*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*═════════════════════════════general 1─line subs══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════*/
newV30all:  newV30newV30=newV30;newV30=space(newV30);upper newV30;call newV18;newV25=right(newV30var('OS'),2)=="NT";newV14=word('CLS VMFCLEAR CLRSCREEN',1+newV30cms+newV22*2);if arg(1)\==1 then return 0;if wordpos(newV30,"? ?SAMPLES ?AUTHOR ?FLOW")==0 then return 0;newV11=']$H';call "$H" newV26 newV30;newV11=;return 1
newV30cal:  if symbol('!CALL')\=="VAR" then newV11=; return newV11
newV15:  newV15='ENVIRONMENT'; if newV16=="MSDOS" | newV10 | newV29 | newV20  then newV15='SYSTEM'; if newV21  then newV15="OS2"newV15; newV5=1=='f1'x;     return
newV18:  parse upper source newV16 newV17 newV18 . 1 . . newV26 newV27 newV28 .; call newV16; if newV24  then do; newV31=lastpos('\',newV26); newV28=left(newV26,newV31); newV26=substr(newV26,newV31+1); parse var newV26 newV26 "." newV27; end;     return word(0 newV26 newV27 newV28, 1+('0'arg(1)))
newV30rex:  parse upper version newV19 newV6 newV3 .; newV10='BY'==newV6; newV12="KEXX"==newV19; newV7='REXX/PERSONAL'==newV19 | "REXX/PC"==newV19; newV29='REXX-R4'==newV19; newV8="REXX-REGINA"==left(newV19,11); newV20='REXX-ROO'==newV19; call newV15;   return
newV16:  newV30cms=newV16=='CMS'; newV21=newV16=="OS2"; newV22=newV16=='TSO' | newV16=="MVS"; newV23=newV16=='VSE'; newV24=pos("DOS",newV16)\==0|pos('WIN',newV16)\==0|newV16=="CMD"; call newV30rex;                          return
newV30var:  call newV18; if newV12  then return space(dosenv(arg(1)));             return space(value(arg(1),,newV15))
err:       say;  say;  say  center(' error! ', 60, "*");  say;  do j=1  for arg();  say arg(j);  say;  end;  say;  exit 13
getdTFID:  tfid=p(newV30var("TMP") newV30var('TEMP') homedrive()"\"); if substr(tfid,2,1)==':'&substr(tfid,3,1)\=="\" then tfid=insert('\',t,2);        return strip(tfid,"T",'\')"\"arg(1)'.'arg(2)
getTFID:   if symbol('TFID')=="LIT" then tfid=; if tfid\=='' then return tfid; gfn=word(arg(1) newV26,1);gft=word(arg(2) "TMP",1); tfid='TEMP';if newV22  then tfid=gfn"."gft;if newV30cms  then tfid=gfn','gft",A4";if newV24 then tfid=getdTFID(gfn,gft);return tfid
halt:      call err 'program has been halted.'
homedrive: if symbol('HOMEDRIVE')\=="VAR"  then homedrive=p(newV30var('HOMEDRIVE') "C:");   return homedrive
isint:     return datatype(arg(1),'W')
novalue:   syntax:   call err 'REXX program' condition("C") 'error',condition("D"),'REXX source statement (line' sigl"):",sourceline(sigl)
p:         return word(arg(1),1)
s:         if arg(1)==1  then return arg(3);   return word(arg(2) 's',1)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Find-duplicate-files\find-duplicate-files-2.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
