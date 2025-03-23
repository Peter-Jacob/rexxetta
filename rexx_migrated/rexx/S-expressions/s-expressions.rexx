/*�*REXX program  parses  an   S-expression   and  displays the results to the terminal.  */
input= '((data "quoted data" 123 4.5) (data (!@# (4.5) "(more" "data)")))'
say center('input', length(input), "═")          /*�*display the header title to terminal.*/
say         input                                /*�*   "     "  input data    "    "     */
say copies('═',     length(input) )              /*�*   "     "  header sep    "    "     */
grpO.=;      grpO.1 = '{'   ;    grpC.1 = "}"    /*�*pair of grouping symbol: braces      */
grpO.2 = '['   ;    grpC.2 = "]"    /*�*  "   "    "       "     brackets    */
grpO.3 = '('   ;    grpC.3 = ")"    /*�*  "   "    "       "     parentheses */
grpO.4 = '«'   ;    grpC.4 = "»"    /*�*  "   "    "       "     guillemets  */
q.=;            q.1 = "'"   ;       q.2 = '"'    /*�*1st and 2nd literal string delimiter.*/
newV2        = 0                                     /*�*the number of tokens found (so far). */
tabs     = 10                                    /*�*used for the indenting of the levels.*/
seps     = ',;'                                  /*�*characters used for separation.      */
atoms    = ' 'seps                               /*�*     "       "  to  separate atoms.  */
level    = 0                                     /*�*the current level being processed.   */
quoted   = 0                                     /*�*quotation level  (for nested quotes).*/
grpU     =                                       /*�*used to go   up  an expression level.*/
grpD     =                                       /*�*  "   "  "  down  "     "       "    */
newV1.=;        do n=1  while grpO.n\==''
atoms = atoms || grpO.n || grpC.n    /*�*add Open and Closed groups to  ATOMS.*/
grpU  = grpU  || grpO.n              /*�*add Open            groups to  GRPU, */
grpD  = grpD  || grpC.n              /*�*add          Closed groups to  GRPD, */
end   /*�*n*/                          /*�* [↑]  handle a bunch of grouping syms*/
literals=
do k=1  while q.k\=='';  literals= literals || q.k  /*�*add literal delimiters*/
end   /*�*k*/
newV3=;                                      literalStart=
do j=1  to length(input);          newV4= substr(input, j, 1)                              /*�* ◄■■■■■text parsing*/
/*�* ◄■■■■■text parsing*/
if quoted                then do;  newV3=newV3 || newV4;    if newV4==literalStart  then quoted= 0     /*�* ◄■■■■■text parsing*/
iterate                                             /*�* ◄■■■■■text parsing*/
end          /*�* [↑]  handle running  quoted string. */   /*�* ◄■■■■■text parsing*/
/*�* ◄■■■■■text parsing*/
if pos(newV4, literals)\==0  then do;  literalStart= newV4;      newV3= newV3 || newV4;        quoted= 1   /*�* ◄■■■■■text parsing*/
iterate                                             /*�* ◄■■■■■text parsing*/
end          /*�* [↑]  handle start of quoted strring.*/   /*�* ◄■■■■■text parsing*/
/*�* ◄■■■■■text parsing*/
if pos(newV4, atoms)==0      then do;  newV3= newV3 || newV4;   iterate;   end    /*�*is    an atom?*/   /*�* ◄■■■■■text parsing*/
else do;  call addnewV3;   newV3= newV4;      end    /*�*isn't  "   " ?*/   /*�* ◄■■■■■text parsing*/
/*�* ◄■■■■■text parsing*/
if pos(newV4, literals)==0   then do;  if pos(newV4, grpU)\==0  then level= level + 1          /*�* ◄■■■■■text parsing*/
call addnewV3                                           /*�* ◄■■■■■text parsing*/
if pos(newV4, grpD)\==0  then level= level - 1          /*�* ◄■■■■■text parsing*/
if level<0  then say  'error, mismatched'   newV4       /*�* ◄■■■■■text parsing*/
end                                                      /*�* ◄■■■■■text parsing*/
end   /*�*j*/                                                                            /*�* ◄■■■■■text parsing*/
/*�* ◄■■■■■text parsing*/
call addnewV3                                        /*�*process any residual tokens.         */   /*�* ◄■■■■■text parsing*/
if level\==0  then say  'error, mismatched grouping symbol'                                  /*�* ◄■■■■■text parsing*/
if quoted     then say  'error, no end of quoted literal'      literalStart                  /*�* ◄■■■■■text parsing*/

do m=1  for newV2;   say newV1.m                   /*�*display the tokens  ───►  terminal.  */
end   /*�*m*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
addnewV3: if newV3=''  then return;   newV2=newV2+1;  newV1.newV2=left("", max(0, tabs*(level-1)))newV3;  newV3=;   return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\S-expressions\s-expressions.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
