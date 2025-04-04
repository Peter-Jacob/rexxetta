/*ͺ*REXX program displays a histogram of filesize distribution of a directory structure(s)*/
numeric digits 30                                /*ͺ*ensure enough decimal digits for a #.*/
parse arg ds .                                   /*ͺ*obtain optional argument from the CL.*/
parse source . . path .                          /*ͺ*   "   the path of this REXX program.*/
fID= substr(path, 1 + lastpos('\', path) )       /*ͺ*   "   the filename and the filetype.*/
parse var  fID   fn  '.'                         /*ͺ*   "   just the pure filename of pgm.*/
sw=max(79, linesize() - 1)                       /*ͺ*   "   terminal width (linesize) - 1.*/
work= fn".OUT"   /*ͺ*filename for workfile output of  DIR.*/
'DIR'   ds   '/s /-c /a-d  >'   work             /*ͺ*do (DOS) DIR cmd for a data structure*/
call linein 0, 1                                 /*ͺ*open output file, point to 1st record*/
maxL= 0;    newV1.= 00;      g= 0                    /*ͺ*max len size; log array; # good recs.*/
newV2=0                                              /*ͺ*$:  total bytes used by files found. */
do while lines(work)\==0;  newV3= linein(work)  /*ͺ*process the data in the DIR work file*/
if left(newV3, 1)==' '    then iterate          /*ͺ*Is the record not legitimate?  Skip. */
parse upper  var   newV3    .  .  sz  .         /*ͺ*uppercase the suffix  (if any).      */
sz= space( translate(sz, , ','),  0)        /*ͺ*remove any commas if present in the #*/

if \datatype(sz,'W')  then do; newV4= left(sz, length(sz) - 1)       /*ͺ*SZ has a suffix?*/
if \datatype(newV4,'N')  then iterate /*ͺ*Meat Β¬ numeric? */
sz= newV4 * 1024 ** pos( right(sz, 1), 'KMGTPEZYXWVU') / 1
end                                   /*ͺ* [β]  use suffix*/
newV2= newV2 + sz                                   /*ͺ*keep a running total for the filesize*/
if sz==0  then L= 0                         /*ͺ*handle special case for an empty file*/
else L= length(sz)                /*ͺ*obtain the length of filesize number.*/
g= g + 1                                    /*ͺ*bump the counter of # of good records*/
maxL= max(L, maxL)                          /*ͺ*get max length filesize for alignment*/
newV1.L= newV1.L + 1                                /*ͺ*bump counter of record size category.*/
end   /*ͺ*j*/                                 /*ͺ* [β]   categories:  split by log ten.*/

if g==0  then do;  say 'file not found: '  ds;  exit 13;    end        /*ͺ*no good records*/
say  ' record size range    count   '
hdr= 'ββββββββββββββββββ ββββββββββ ';     say hdr;         Lhdr=length(hdr)
mC=0                                             /*ͺ*mC:  the maximum count for any range.*/
do   t=1  to 2                              /*ͺ*T==1   is used to find the max count.*/
do k=0  to maxL;  mC= max(mC, newV1.k);  if t==1  then iterate           /*ͺ*1st pass? */
if k==0  then y= center('zero',  length( word(hdr, 1)  ) )
else y= '10^'left(k-1,2)  "βββΊ 10^"left(k,2)  '-1'
say y || right( commas(newV1.k), 11)   copies('β', max(1, (newV1.k / mC * sw % 1) - LHdr) )
end   /*ͺ*k*/
end     /*ͺ*y*/
say
trace off;   'ERASE'  work                       /*ͺ*perform cleanβup (erase a work file).*/
say commas(g)      ' files detected, '       commas(newV2)        " total bytes."
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas: parse arg newV3;  do jnewV4=length(newV3)-3  to 1  by -3; newV3=insert(',', newV3, jnewV4); end;  return newV3
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\File-size-distribution\file-size-distribution.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
