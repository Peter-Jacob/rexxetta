/*ª* REXX ***************************************************************
* 04.09.2013 Walter Pachl
**********************************************************************/
Parse Arg imax jmax seed
If imax='' Then imax=10
If jmax='' Then jmax=15
If seed='' Then seed=4711
c='123456789'||,
'abcdefghijklmnopqrstuvwxyz'||,
translate('abcdefghijklmnopqrstuvwxyz')
c=copies(c,10)
call random 1,10,seed
id=2*imax+1                         /*ª* vertical dimension of a.i.j   */
jd=2*jmax+1                         /*ª* horizontal dimension of a.i.j */
a.=1                                   /*ª* mark all borders present   */
p.='.'                                 /*ª* Initialize all grid points */
pl.=0                                  /*ª* path list                  */
ii=random(1,imax)                      /*ª* find a start position      */
jj=random(1,jmax)
p=1                                    /*ª* first position             */
na=1                                   /*ª* number of points used      */
Do si=1 To 1000                        /*ª* Do Forever - see Leave     */
/*ª* Say 'loop' si na                     show progress              */
Call path ii,jj                /*ª* compute a path starting at ii/jj */
If na=imax*jmax Then                 /*ª* all points used            */
Leave                              /*ª* we are done                */
Parse Value select_next() With ii jj /*ª* get a new start from a path*/
End

/*ª***************
Do i=1 To imax
ol=''
Do j=1 To jmax
ol=ol||p.i.j
End
Say ol
End
Say ' '
***************/
Call show
/*ª***********************
Do pi=1 To imax*jmax
Say right(pi,3) pos.pi
End
***********************/
Exit

path: Procedure Expose p. np. p pl. c a. na imax jmax id jd pos.
/*ª**********************************************************************
* compute a path starting from point (ii,jj)
**********************************************************************/
Parse Arg ii,jj
p.ii.jj='1'
pos.p=ii jj
Do pp=1 to 50                /*ª* compute a path of maximum length 50*/
neighbors=neighbors(ii,jj)         /*ª* number of free neighbors   */
Select
When neighbors=1 Then            /*ª* just one                   */
Call advance 1,ii,jj           /*ª* go for it                  */
When neighbors>0 Then Do         /*ª* more Than 1                */
ch=random(1,neighbors)         /*ª* choose one possibility     */
Call advance ch,ii,jj          /*ª* and go for that            */
End
Otherwise                        /*ª* none available             */
Leave
End
End
Return

neighbors: Procedure Expose p. np.  imax jmax neighbors pl.
/*ª**********************************************************************
* count the number of free neighbors of point (i,j)
**********************************************************************/
Parse Arg i,j
neighbors=0
in=i-1; If in>0     Then Call check in,j
in=i+1; If in<=imax Then Call check in,j
jn=j-1; If jn>0     Then Call check i,jn
jn=j+1; If jn<=jmax Then Call check i,jn
Return neighbors

check: Procedure Expose p. imax jmax np. neighbors pl.
/*ª**********************************************************************
* check if point (i,j) is free and note it as possible successor
**********************************************************************/
Parse Arg i,j
If p.i.j='.' Then Do                 /*ª* point is free              */
neighbors=neighbors+1              /*ª* number of free neighbors   */
np.neighbors=i j                   /*ª* note it as possible choice */
End
Return

advance: Procedure Expose p pos. np. p. c ii jj a. na pl. pos.
/*ª**********************************************************************
* move to the next point of the current path
**********************************************************************/
Parse Arg ch,pii,pjj
Parse Var np.ch ii jj
p=p+1                                /*ª* position number            */
pos.p=ii jj                          /*ª* note its coordinates       */
p.ii.jj=substr(c,p,1)                /*ª* mark the point as used     */
ai=pii+ii                            /*ª* vertical border position   */
aj=pjj+jj                            /*ª* horizontal border position */
a.ai.aj=0                            /*ª* tear the border down       */
na=na+1                              /*ª* number of used positions   */
z=pl.0+1                             /*ª* add the point to the list  */
pl.z=ii jj                           /*ª* of follow-up start pos.    */
pl.0=z
Return

show: Procedure Expose id jd a.  na
/*ª*********************************************************************
* Show the resulting maze
*********************************************************************/
say 'mgg 6 18 4711'
say 'show na='na
Do i=1 To id
ol=''
Do j=1 To jd
If i//2=1 Then Do                /*ª* odd lines                 */
If a.i.j=1 Then Do             /*ª* border to be drawn        */
If j//2=0 Then
ol=ol||'---'               /*ª* draw the border           */
Else
ol=ol'+'
End
Else Do                        /*ª* border was torn down      */
If j//2=0 Then
ol=ol||'   '               /*ª* blanks instead of border  */
Else
ol=ol||'+'
End
End
Else Do                          /*ª* even line                 */
If a.i.j=1 Then Do
If j//2=0 Then               /*ª* even column               */
ol=ol||'   '               /*ª* moving space              */
Else                         /*ª* odd column                */
ol=ol||'|'                 /*ª* draw the border           */
End
Else                           /*ª* border was torn down      */
ol=ol||' '                   /*ª* blank instead of border   */
End
End
Select
When i=6 Then ol=overlay('A',ol,11)
When i=8 Then ol=overlay('B',ol, 3)
Otherwise Nop
End
Say ol format(i,2)
End
Return

select_next: Procedure Expose p. pl. imax jmax
/*ª*********************************************************************
* look for a point to start the nnext path
*********************************************************************/
Do Until neighbors>0                 /*ª* loop until one is found   */
n=pl.0                             /*ª* number of points recorded */
s=random(1,n)                      /*ª* pick a random index       */
Parse Var pl.s is js               /*ª* its coordinates           */
neighbors=neighbors(is,js)         /*ª* count free neighbors      */
If neighbors=0 Then Do             /*ª* if there is none          */
pl.s=pl.n                        /*ª* remove this point         */
pl.0=pl.0-1
End
End
Return is js                         /*ª* return the new start point*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Maze-generation\maze-generation-3.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
