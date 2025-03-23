/*�*REXX program  reads  the  files specified  and  globally replaces  a string.          */
old= "Goodbye London!"                           /*�*the  old text     to be replaced.    */
new= "Hello New York!"                           /*�* "   new   "   used for replacement. */
parse  arg  fileList                             /*�*obtain required list of files from CL*/
newV2= words(fileList)                               /*�*the number of files in the file list.*/

do f=1  for newV2;     fn= translate( word(fileList, f), , ',');     say;     say
say '──────── file is being read: '    fn    " ("f   'out of'     newV2     "files)."
call linein fn,1,0                            /*�*position the file for input.         */
changes= 0                                    /*�*the number of changes in file so far.*/
do rec=0  while lines(fn)\==0       /*�*read a file   (if it exists).        */
newV1.rec= linein(fn)                   /*�*read a record (line)  from the file. */
if pos(old, newV1.rec)==0  then iterate /*�*Anything to change?   No, then skip. */
changes= changes + 1                /*�*flag that file contents have changed.*/
newV1.rec= changestr(old, newV1.rec, new)   /*�*change the @.rec record, old ──► new.*/
end   /*�*rec*/

say '──────── file has been read: '         fn", with "      rec      'records.'
if changes==0  then do;  say '──────── file  not  changed: '   fn;   iterate;   end
call lineout fn,,1                            /*�*position file for output at 1st line.*/
say '──────── file being changed: '   fn

do r=0  for rec;     call lineout fn, newV1.r /*�*re─write the contents of the file.   */
end   /*�*r*/

say '──────── file was   changed: '   fn    " with"   changes   'lines changed.'
end   /*�*f*/                                   /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Globally-replace-text-in-several-files\globally-replace-text-in-several-files-1.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
