/*ͺ*REXX program  parses  an   S-expression   and  displays the results to the terminal.  */
input= '((data "quoted data" 123 4.5) (data (!@# (4.5) "(more" "data)")))'
say center('input', length(input), "β")          /*ͺ*display the header title to terminal.*/
say         input                                /*ͺ*   "     "  input data    "    "     */
say copies('β',     length(input) )              /*ͺ*   "     "  header sep    "    "     */
grpO.=;      grpO.1 = '{'   ;    grpC.1 = "}"    /*ͺ*pair of grouping symbol: braces      */
grpO.2 = '['   ;    grpC.2 = "]"    /*ͺ*  "   "    "       "     brackets    */
grpO.3 = '('   ;    grpC.3 = ")"    /*ͺ*  "   "    "       "     parentheses */
grpO.4 = 'Β«'   ;    grpC.4 = "Β»"    /*ͺ*  "   "    "       "     guillemets  */
q.=;            q.1 = "'"   ;       q.2 = '"'    /*ͺ*1st and 2nd literal string delimiter.*/
newV2        = 0                                     /*ͺ*the number of tokens found (so far). */
tabs     = 10                                    /*ͺ*used for the indenting of the levels.*/
seps     = ',;'                                  /*ͺ*characters used for separation.      */
atoms    = ' 'seps                               /*ͺ*     "       "  to  separate atoms.  */
level    = 0                                     /*ͺ*the current level being processed.   */
quoted   = 0                                     /*ͺ*quotation level  (for nested quotes).*/
grpU     =                                       /*ͺ*used to go   up  an expression level.*/
grpD     =                                       /*ͺ*  "   "  "  down  "     "       "    */
newV1.=;        do n=1  while grpO.n\==''
atoms = atoms || grpO.n || grpC.n    /*ͺ*add Open and Closed groups to  ATOMS.*/
grpU  = grpU  || grpO.n              /*ͺ*add Open            groups to  GRPU, */
grpD  = grpD  || grpC.n              /*ͺ*add          Closed groups to  GRPD, */
end   /*ͺ*n*/                          /*ͺ* [β]  handle a bunch of grouping syms*/
literals=
do k=1  while q.k\=='';  literals= literals || q.k  /*ͺ*add literal delimiters*/
end   /*ͺ*k*/
newV3=;                                      literalStart=
do j=1  to length(input);          newV4= substr(input, j, 1)                              /*ͺ* ββ β β β β text parsing*/
/*ͺ* ββ β β β β text parsing*/
if quoted                then do;  newV3=newV3 || newV4;    if newV4==literalStart  then quoted= 0     /*ͺ* ββ β β β β text parsing*/
iterate                                             /*ͺ* ββ β β β β text parsing*/
end          /*ͺ* [β]  handle running  quoted string. */   /*ͺ* ββ β β β β text parsing*/
/*ͺ* ββ β β β β text parsing*/
if pos(newV4, literals)\==0  then do;  literalStart= newV4;      newV3= newV3 || newV4;        quoted= 1   /*ͺ* ββ β β β β text parsing*/
iterate                                             /*ͺ* ββ β β β β text parsing*/
end          /*ͺ* [β]  handle start of quoted strring.*/   /*ͺ* ββ β β β β text parsing*/
/*ͺ* ββ β β β β text parsing*/
if pos(newV4, atoms)==0      then do;  newV3= newV3 || newV4;   iterate;   end    /*ͺ*is    an atom?*/   /*ͺ* ββ β β β β text parsing*/
else do;  call addnewV3;   newV3= newV4;      end    /*ͺ*isn't  "   " ?*/   /*ͺ* ββ β β β β text parsing*/
/*ͺ* ββ β β β β text parsing*/
if pos(newV4, literals)==0   then do;  if pos(newV4, grpU)\==0  then level= level + 1          /*ͺ* ββ β β β β text parsing*/
call addnewV3                                           /*ͺ* ββ β β β β text parsing*/
if pos(newV4, grpD)\==0  then level= level - 1          /*ͺ* ββ β β β β text parsing*/
if level<0  then say  'error, mismatched'   newV4       /*ͺ* ββ β β β β text parsing*/
end                                                      /*ͺ* ββ β β β β text parsing*/
end   /*ͺ*j*/                                                                            /*ͺ* ββ β β β β text parsing*/
/*ͺ* ββ β β β β text parsing*/
call addnewV3                                        /*ͺ*process any residual tokens.         */   /*ͺ* ββ β β β β text parsing*/
if level\==0  then say  'error, mismatched grouping symbol'                                  /*ͺ* ββ β β β β text parsing*/
if quoted     then say  'error, no end of quoted literal'      literalStart                  /*ͺ* ββ β β β β text parsing*/

do m=1  for newV2;   say newV1.m                   /*ͺ*display the tokens  ββββΊ  terminal.  */
end   /*ͺ*m*/
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
addnewV3: if newV3=''  then return;   newV2=newV2+1;  newV1.newV2=left("", max(0, tabs*(level-1)))newV3;  newV3=;   return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\S-expressions\s-expressions.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
