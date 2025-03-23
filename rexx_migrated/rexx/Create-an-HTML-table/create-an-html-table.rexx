/*�*REXX program  creates (and displays)  an  HTML table of five rows  and  three columns.*/
parse arg rows .                                 /*�*obtain optional argument from the CL.*/
if rows=='' | rows==","   then rows=5            /*�*no ROWS specified?  Then use default.*/
cols = 3                                   /*�*specify three columns for the table. */
maxRand = 9999                                /*�*4-digit numbers, allows negative nums*/
headerInfo = 'X Y Z'                             /*�*specifify column header information. */
oFID = 'a_table.html'                      /*�*name of the  output  file.           */
w = 0                                   /*�*number of writes to the output file. */

call wrt  "<html>"
call wrt  "<head></head>"
call wrt  "<body>"
call wrt  "<table border=5  cellpadding=20  cellspace=0>"

do r=0  to rows                                /*�* [↓]  handle row  0 as being special.*/
if r==0  then call wrt  "<tr><th></th>"        /*�*when it's     the zeroth row.        */
else call wrt  "<tr><th>"  r  "</th>" /*�*  "    "  not  "    "     "          */

do c=1  for cols                           /*�* [↓]  for row 0,  add the header info*/
if r==0  then call wrt  "<th>"   word(headerInfo,c)   "</th>"
else call wrt  "<td align=right>"    rnd()   "</td>"
end   /*�*c*/
end       /*�*r*/

call wrt  "</table>"
call wrt  "</body>"
call wrt  "</html>"
say;         say  w    ' records were written to the output file: '   oFID
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
rnd: return right(random(0,maxRand*2)-maxRand,5) /*�*RANDOM doesn't generate negative ints*/
wrt: call lineout oFID,arg(1);   say '══►'  arg(1);   w=w+1;    return          /*�*write.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Create-an-HTML-table\create-an-html-table.rexx was migrated on 23 Mar 2025 at 10:43:09
 * -------------------------------------------------------------------------
*/ 
