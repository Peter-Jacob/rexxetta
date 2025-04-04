/*ͺ*REXX program  places   N   queens on an  NxN  chessboard  (the eight queens problem). */
parse arg N .                                    /*ͺ*obtain optional argument from the CL.*/
if N=='' | N==","  then N= 8                     /*ͺ*Not specified:  Then use the default.*/
if N<1             then call nOK                 /*ͺ*display a message, the board is bad. */
rank= 1;           file= 1;               newV2= 0   /*ͺ*starting rank&file;  #β‘number queens.*/
newV1.= 0;             pad= left('', 9* (N<18) )     /*ͺ*define empty board;  set indentation.*/
/*ͺ* [β]  rank&file β‘ chessboard row&cols*/
do  while newV2<N;     newV1.file.rank= 1              /*ͺ*keep placing queens until we're done.*/
if ok(file, rank)  then do; file= 1;    newV2= newV2+1 /*ͺ*Queen not being attacked? Then eureka*/
rank= rank+1       /*ͺ*use another attempt at another rank. */
iterate            /*ͺ*go and try another queen placement.  */
end                    /*ͺ* [β]  found a good queen placement.  */
newV1.file.rank= 0                                 /*ͺ*It isn't safe.  So remove this queen.*/
file= file + 1                                 /*ͺ*So, try the next (higher) chess file.*/
do  while file>N;    rank= rank - 1;            if rank==0  then call nOK
do j=1  for N;    if \newV1.j.rank  then iterate             /*ͺ*ΒΏocupado?*/
newV1.j.rank= 0;      newV2= newV2 - 1;     file= j + 1;     leave
end  /*ͺ*j*/
end     /*ͺ*while file>N*/
end                    /*ͺ*while    #<N*/
call show                                        /*ͺ*display the chess board with queens. */
exit  1                                          /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
nOK: say;      say  "No solution for"      N      'queens.';          say;          exit 0
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
ok:  parse arg f,r;  fp= f + 1;   rm= r - 1      /*ͺ*if returnβ‘0,  then queen isn't safe. */
do k=1          for rm;               if newV1.f.k  then return 0;           end
f= f-1;  do k=rm  by -1  for rm  while f\==0;  if newV1.f.k  then return 0;  f= f-1;  end
f= fp;   do k=rm  by -1  for rm  while f <=N;  if newV1.f.k  then return 0;  f= f+1;  end
return 1   /*ͺ*1β‘queen is safe. */            /*ͺ*  ββββββββ    is queen under attack? */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
show: say  'A solution for '     N     " queens:"     /*ͺ*display a title to the terminal.*/
g= substr( copies("β¬βββ",  N)  ,2)              /*ͺ*start of all cells on chessboard*/
say;      say pad  translate('β'g"β", 'β¦', "β¬") /*ͺ*display top rank (of the board).*/
line   = 'β 'g"βξεχΦ²";   dither= "β";   ditherQ= 'β' /*ͺ*define a line for cell boundary.*/
bar    = 'β'    ;   queen = "Q"                 /*ͺ*kinds:   horiz.,  vert.,  salad.*/
Bqueen = ditherQ  ||  queen  ||  ditherQ        /*ͺ*glyph befitting a black square Q*/
Wqueen =           ' 'queen" "                  /*ͺ*  "       "     " white    "   "*/
do   rank=1  for N;     if rank\==1  then say pad line;    newV3=  /*ͺ*show rank sep. */
do file=1  for N
B = (file + rank) // 2                      /*ͺ*Is the square black ?  Then B=1.*/
if  B          then Qgylph= Bqueen          /*ͺ*if black square, use dithered Q.*/
else Qgylph= Wqueen          /*ͺ* " white    "     "   white   " */
if newV1.file.rank then newV3= newV3 || bar || Qgylph   /*ͺ*Has queen? Use a 3βchar Q symbol*/
else if B then newV3=newV3 || bar || copies(dither,3) /*ͺ*dithering      */
else newV3=newV3 || bar || copies(  ' ' ,3) /*ͺ* 3 blanks      */
end   /*ͺ*file*/                              /*ͺ* [β]  preserve squareβish board.*/
say pad  newV3 || bar                             /*ͺ*show a single rank of the board.*/
end     /*ͺ*rank*/                              /*ͺ*80 cols  can view a 19x19 board.*/
say pad  translate('β'g"β", 'β©', "β¬");   return /*ͺ*display the last rank (of board)*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\N-queens-problem\n-queens-problem.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
