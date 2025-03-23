/*�*REXX program displays an  ASCII  table of characters  (within a  16x16  indexed grid).*/
parse upper version newV2 .                       /*�*some REXXes can't display '1b'x glyph*/
newV1= 'REXX/PERSONAL'==newV2 | "REXX/PC"==newV2 /*�*is this  PC/REXX  or  REXX/Personal? */
func= '  nul soh stx etx eot enq ack bel  bs tab  lf  vt  ff  cr  so  si  '  ||,
"  dle dc1 dc2 dc3 dc4 nak syn etb can  em eof esc  fs  gs  rs  us  "
newV3.=
newV3.1= "x'07'    x'08'       x'09'     x'0a'      x'0d'      x'1a'      x'1b'     x'20'"
newV3.2= "bel      b/s         tab       l/f        c/r        eof        esc       bla"
newV3.3= "bell     backspace   tabchar   linefeed   carriage   end-of-    escape    blank"
newV3.4= "                                          return     file"
newV3.5= copies('≈', 79)
do a=1  for 8;   say newV3.a             /*�*display header info  (abbreviations).*/
end   /*�*a*/                          /*�*also included are three blank lines. */
b= ' ';         hdr= left(b, 7)                  /*�*prepend blanks to HDR  (indentation).*/
call xhdr                                        /*�*construct a  top  index for the grid.*/
call grid '╔',  "╤",  '╗',  "═══"                /*�*construct & display bottom of a cell.*/
iidx= left(b, length(hdr) - 4 )                  /*�*the length of the indentation of idx.*/
cant= copies('═', 3)                             /*�*can't show a character with this REXX*/
/*�* [↓]  construct a sixteen-row grid.  */
do j=0  by 16  for 16;  idx= left(d2x(j),1,2) /*�*prepend an index literal for the grid*/
newV6= iidx idx b;           newV4= iidx "   "       /*�*an index and indent; without an index*/
sep= '║'                                      /*�*assign a character to cell separator.*/
do newV7=j  to j+15;               chr= center( d2c(newV7), 3)   /*�*true char glyph.*/
if newV7>6 & newV7<11  |  newV7==13   then chr= cant         /*�*can't show these glyphs.*/
/*�*esc*/   if newV7==27 then if newV1  then chr= cant         /*�*  "     "  this  glyph. */
else chr= center( d2c(newV7), 3)   /*�*true char glyph.*/
if newV7 <32 then newV4= newV4 || sep || right(word(func, newV7+1), 3) /*�*show a function.*/
if newV7==32 then chr= 'bla'            /*�*spell out (within 3 chars) a "BLAnk".*/
if newV7 >31 then newV4=                   /*�*Above a blank?  Then nullify 3rd line*/
newV6= newV6 || sep || chr;     sep= '│'    /*�*append grid cell; use a new sep char.*/
end   /*�*#*/
if newV4\==''  then say newV4"║ "                   /*�*append the  last grid cell character.*/
say newV6'║ '   idx                               /*�*append an   index   to the grid line.*/
if j\==240  then call grid '╟',"┼",'╢',"───"  /*�*construct & display most cell bottoms*/
end   /*�*j*/

call grid '╚',  "╧",  '╝',  "═══"                /*�*construct & display last cell bottom.*/
call xhdr                                        /*�*construct a bottom index for the grid*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
xhdr: say; newV6= hdr;  sep= b;   do k=0  for 16; newV6=newV6||b d2x(k)b;  end;    say newV6; say;  return
grid: arg newV5,$2,$3,$4; newV6=hdr; do 16;  newV6=newV6 || newV5 || $4;  newV5= $2;  end;  say newV6 || $3; return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Show-ASCII-table\show-ascii-table.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
