/*�*REXX program displays a histogram of filesize distribution of a directory structure(s)*/
numeric digits 30                                /*�*ensure enough decimal digits for a #.*/
parse arg ds .                                   /*�*obtain optional argument from the CL.*/
parse source . . path .                          /*�*   "   the path of this REXX program.*/
fID= substr(path, 1 + lastpos('\', path) )       /*�*   "   the filename and the filetype.*/
parse var  fID   fn  '.'                         /*�*   "   just the pure filename of pgm.*/
sw=max(79, linesize() - 1)                       /*�*   "   terminal width (linesize) - 1.*/
work= fn".OUT"   /*�*filename for workfile output of  DIR.*/
'DIR'   ds   '/s /-c /a-d  >'   work             /*�*do (DOS) DIR cmd for a data structure*/
call linein 0, 1                                 /*�*open output file, point to 1st record*/
maxL= 0;    newV1.= 00;      g= 0                    /*�*max len size; log array; # good recs.*/
newV2=0                                              /*�*$:  total bytes used by files found. */
do while lines(work)\==0;  newV3= linein(work)  /*�*process the data in the DIR work file*/
if left(newV3, 1)==' '    then iterate          /*�*Is the record not legitimate?  Skip. */
parse upper  var   newV3    .  .  sz  .         /*�*uppercase the suffix  (if any).      */
sz= space( translate(sz, , ','),  0)        /*�*remove any commas if present in the #*/

if \datatype(sz,'W')  then do; newV4= left(sz, length(sz) - 1)       /*�*SZ has a suffix?*/
if \datatype(newV4,'N')  then iterate /*�*Meat ¬ numeric? */
sz= newV4 * 1024 ** pos( right(sz, 1), 'KMGTPEZYXWVU') / 1
end                                   /*�* [↑]  use suffix*/
newV2= newV2 + sz                                   /*�*keep a running total for the filesize*/
if sz==0  then L= 0                         /*�*handle special case for an empty file*/
else L= length(sz)                /*�*obtain the length of filesize number.*/
g= g + 1                                    /*�*bump the counter of # of good records*/
maxL= max(L, maxL)                          /*�*get max length filesize for alignment*/
newV1.L= newV1.L + 1                                /*�*bump counter of record size category.*/
end   /*�*j*/                                 /*�* [↑]   categories:  split by log ten.*/

if g==0  then do;  say 'file not found: '  ds;  exit 13;    end        /*�*no good records*/
say  ' record size range    count   '
hdr= '══════════════════ ══════════ ';     say hdr;         Lhdr=length(hdr)
mC=0                                             /*�*mC:  the maximum count for any range.*/
do   t=1  to 2                              /*�*T==1   is used to find the max count.*/
do k=0  to maxL;  mC= max(mC, newV1.k);  if t==1  then iterate           /*�*1st pass? */
if k==0  then y= center('zero',  length( word(hdr, 1)  ) )
else y= '10^'left(k-1,2)  "──► 10^"left(k,2)  '-1'
say y || right( commas(newV1.k), 11)   copies('─', max(1, (newV1.k / mC * sw % 1) - LHdr) )
end   /*�*k*/
end     /*�*y*/
say
trace off;   'ERASE'  work                       /*�*perform clean─up (erase a work file).*/
say commas(g)      ' files detected, '       commas(newV2)        " total bytes."
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: parse arg newV3;  do jnewV4=length(newV3)-3  to 1  by -3; newV3=insert(',', newV3, jnewV4); end;  return newV3
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\File-size-distribution\file-size-distribution.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
