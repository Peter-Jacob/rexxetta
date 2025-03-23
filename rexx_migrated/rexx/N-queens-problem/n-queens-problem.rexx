/*�*REXX program  places   N   queens on an  NxN  chessboard  (the eight queens problem). */
parse arg N .                                    /*�*obtain optional argument from the CL.*/
if N=='' | N==","  then N= 8                     /*�*Not specified:  Then use the default.*/
if N<1             then call nOK                 /*�*display a message, the board is bad. */
rank= 1;           file= 1;               newV2= 0   /*�*starting rank&file;  #≡number queens.*/
newV1.= 0;             pad= left('', 9* (N<18) )     /*�*define empty board;  set indentation.*/
/*�* [↓]  rank&file ≡ chessboard row&cols*/
do  while newV2<N;     newV1.file.rank= 1              /*�*keep placing queens until we're done.*/
if ok(file, rank)  then do; file= 1;    newV2= newV2+1 /*�*Queen not being attacked? Then eureka*/
rank= rank+1       /*�*use another attempt at another rank. */
iterate            /*�*go and try another queen placement.  */
end                    /*�* [↑]  found a good queen placement.  */
newV1.file.rank= 0                                 /*�*It isn't safe.  So remove this queen.*/
file= file + 1                                 /*�*So, try the next (higher) chess file.*/
do  while file>N;    rank= rank - 1;            if rank==0  then call nOK
do j=1  for N;    if \newV1.j.rank  then iterate             /*�*¿ocupado?*/
newV1.j.rank= 0;      newV2= newV2 - 1;     file= j + 1;     leave
end  /*�*j*/
end     /*�*while file>N*/
end                    /*�*while    #<N*/
call show                                        /*�*display the chess board with queens. */
exit  1                                          /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
nOK: say;      say  "No solution for"      N      'queens.';          say;          exit 0
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
ok:  parse arg f,r;  fp= f + 1;   rm= r - 1      /*�*if return≡0,  then queen isn't safe. */
do k=1          for rm;               if newV1.f.k  then return 0;           end
f= f-1;  do k=rm  by -1  for rm  while f\==0;  if newV1.f.k  then return 0;  f= f-1;  end
f= fp;   do k=rm  by -1  for rm  while f <=N;  if newV1.f.k  then return 0;  f= f+1;  end
return 1   /*�*1≡queen is safe. */            /*�*  ↑↑↑↑↑↑↑↑    is queen under attack? */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show: say  'A solution for '     N     " queens:"     /*�*display a title to the terminal.*/
g= substr( copies("╬═══",  N)  ,2)              /*�*start of all cells on chessboard*/
say;      say pad  translate('╔'g"╗", '╦', "╬") /*�*display top rank (of the board).*/
line   = '╠'g"����ֲ";   dither= "▓";   ditherQ= '░' /*�*define a line for cell boundary.*/
bar    = '║'    ;   queen = "Q"                 /*�*kinds:   horiz.,  vert.,  salad.*/
Bqueen = ditherQ  ||  queen  ||  ditherQ        /*�*glyph befitting a black square Q*/
Wqueen =           ' 'queen" "                  /*�*  "       "     " white    "   "*/
do   rank=1  for N;     if rank\==1  then say pad line;    newV3=  /*�*show rank sep. */
do file=1  for N
B = (file + rank) // 2                      /*�*Is the square black ?  Then B=1.*/
if  B          then Qgylph= Bqueen          /*�*if black square, use dithered Q.*/
else Qgylph= Wqueen          /*�* " white    "     "   white   " */
if newV1.file.rank then newV3= newV3 || bar || Qgylph   /*�*Has queen? Use a 3─char Q symbol*/
else if B then newV3=newV3 || bar || copies(dither,3) /*�*dithering      */
else newV3=newV3 || bar || copies(  ' ' ,3) /*�* 3 blanks      */
end   /*�*file*/                              /*�* [↑]  preserve square─ish board.*/
say pad  newV3 || bar                             /*�*show a single rank of the board.*/
end     /*�*rank*/                              /*�*80 cols  can view a 19x19 board.*/
say pad  translate('╚'g"╝", '╩', "╬");   return /*�*display the last rank (of board)*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\N-queens-problem\n-queens-problem.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
