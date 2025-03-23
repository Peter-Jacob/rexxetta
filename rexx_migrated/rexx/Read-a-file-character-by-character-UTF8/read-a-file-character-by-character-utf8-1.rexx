/*�*REXX program  reads and displays  a file char by char, returning   'EOF'   when done. */
parse arg iFID .                                 /*�*iFID:     is the fileID to be read.  */
/*�* [↓]  show the file's contents.      */
if iFID\==''  then do j=1  until  x=='EOF'       /*�*J  count's the file's characters.    */
x=getchar(iFID);    y=        /*�*get a character  or  an 'EOF'.       */
if x>>' '   then y=x          /*�*display   X   if presentable.        */
say  right(j, 12)     'character,  (hex,char)'      c2x(x)      y
end   /*�*j*/                   /*�* [↑]  only display  X  if not low hex*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
getchar: procedure;  parse arg z;  if chars(z)==0  then return 'EOF';     return charin(z)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Read-a-file-character-by-character-UTF8\read-a-file-character-by-character-utf8-1.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
