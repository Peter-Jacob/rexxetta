/*ª*REXX program  produces and displays a zig-zag  matrix (a square array) */
Parse Arg n start inc .   /*ª* obtain optional arguments from command line */
if     n=='' |     n==","  then     n= 5 /*ª*Not specified? use the default*/
if start=='' | start==","  then start= 0 /*ª* "      "       "   "     "   */
if   inc=='' |   inc==","  then   inc= 1 /*ª* "      "       "   "     "   */
Parse Value 1 1 n**2 With row col size
Do x=start By inc For size
m.row.col=x
If (row+col)//2=0 Then do  /*ª* moving upward                            */
Select
when row=1 Then Do     /*ª* at upper bound                           */
If col<n Then
col=col+1          /*ª* move right                               */
Else
row=2              /*ª* move down                                */
End
when col=n Then        /*ª* at right border                          */
row=row+1            /*ª* move down                                */
Otherwise Do           /*ª* in all other cases                       */
row=row-1            /*ª* move up                                  */
col=col+1            /*ª* and to the right                         */
End
End
End
Else Do                    /*ª* moving downward                          */
Select
When col=1 Then Do     /*ª* at lower bound                           */
If row=n Then        /*ª* in bottom row                            */
col=2              /*ª* move right                               */
Else                 /*ª* otherwise                                */
row=row+1          /*ª* move down                                */
End
When row=n Then        /*ª* at lower bound                           */
col=col+1            /*ª* move right                               */
Otherwise Do           /*ª* in all other cases                       */
row=row+1            /*ª* move down                                */
col=col-1            /*ª* and to the left                          */
End
End
End
End
Call show
Exit
/*ª*-----------------------------------------------------------------------*/
show:
w=length(start+size*inc)            /*ª* max width of any matrix element */
Do row=1 To n                       /*ª* loop over rows                  */
line=right(m.row.1,w)             /*ª* first element                   */
Do column=2 To n                  /*ª* loop over other elements        */
line=line right(m.row.column,w) /*ª* build output line               */
End
Say line
End                               /*ª* display the line                */
Return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Zig-zag-matrix\zig-zag-matrix-2.rexx was migrated on 23 Mar 2025 at 10:43:36
 * -------------------------------------------------------------------------
*/ 
