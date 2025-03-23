/*ª*REXX program displays the top   N   salaries in each department (internal table).     */
parse arg topN .                                 /*ª*get optional # for the top N salaries*/
if topN=='' | topN==","  then topN= 1            /*ª*Not specified?  Then use the default.*/
say 'Finding the top '   topN   " salaries in each department.";            say
newV1.=                          /*ª*â•â•â•â•â•â•â•â• employee name      ID    salary   dept. â•â•â•â•â•â•â• */
newV1.1 = "Tyler Bennett    ,E10297,  32000,  D101"
newV1.2 = "John Rappl       ,E21437,  47000,  D050"
newV1.3 = "George Woltman   ,E00127,  53500,  D101"
newV1.4 = "Adam Smith       ,E63535,  18000,  D202"
newV1.5 = "Claire Buckman   ,E39876,  27800,  D202"
newV1.6 = "David McClellan  ,E04242,  41500,  D101"
newV1.7 = "Rich Holcomb     ,E01234,  49500,  D202"
newV1.8 = "Nathan Adams     ,E41298,  21900,  D050"
newV1.9 = "Richard Potter   ,E43128,  15900,  D101"
newV1.10 = "David Motsinger  ,E27002,  19250,  D202"
newV1.11 = "Tim Sampair      ,E03033,  27000,  D101"
newV1.12 = "Kim Arlich       ,E10001,  57000,  D190"
newV1.13 = "Timothy Grove    ,E16398,  29900,  D190"
depts=                                           /*ª*build people database from  @  array.*/
do j=1  until newV1.j=='';  parse var newV1.j name.j ',' id.j "," sal.j ',' dept.j .
if wordpos(dept.j, depts)==0  then depts= depts dept.j       /*ª*a new DEPT?*/
end   /*ª*j*/
employees= j-1                                   /*ª*adjust for the bumped  DO loop index.*/
say 'There are '   employees   "employees, "    words(depts)     'departments: '     depts
say
do dep=1  for words(depts);       say         /*ª*process each of the departments.     */
Xdept= word(depts, dep)                       /*ª*current department being processed.  */
do topN;        h= 0;          highSal= 0  /*ª*process the top  N  salaries.        */
do e=1  for employees             /*ª*process each employee in department. */
if dept.e\==Xdept | sal.e<highSal then iterate  /*ª*is this the wrong info?*/
highSal= sal.e;        h= e       /*ª*a higher salary was just discovered. */
end   /*ª*e*/
if h==0  then iterate                      /*ª*do we have no highest paid this time?*/
say 'department:  '      dept.h       " $" || sal.h+0        id.h      space(name.h)
dept.h=                                    /*ª*make sure we see the employee again. */
end         /*ª*topN*/
end             /*ª*dep*/                       /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Top-rank-per-group\top-rank-per-group-1.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
