/*ª*REXX program  displays a  power set;  items may be  anything  (but can't have blanks).*/
Parse Arg text                                   /*ª*allow the user specify optional set. */
If text='' Then                                  /*ª*Not specified?  Then use the default.*/
text='one two three four'
n=words(text)
psi=0
Do k=0 To n               /*ª* loops from 0 to n elements of a set      */
cc=comb(n,k)            /*ª* returns the combinations of 1 through k  */
Do while pos('/',cc)>0        /*ª* as long as there is a combination  */
Parse Var cc elist '/' cc   /*ª* get i from comb's result string    */
psl=''                      /*ª* initialize the list of words       */
psi=psi+1                   /*ª* index of this set                  */
Do While elist<>''          /*ª* loop through elements              */
parse var elist e elist   /*ª* get an element (a digit)           */
psl=psl','word(text,e)    /*ª* add corresponding test word to set */
End
psl=substr(psl,2)           /*ª* get rid of leading comma           */
Say right(psi,2) '{'psl'}'  /*ª* show this element of the power set */
End
End
Exit
comb: Procedure
/*ª***********************************************************************
* Returns the combinations of size digits out of things digits
* e.g. comb(4,2) -> ' 1 2/1 3/1 4/2 3/2 4/3 4/'
1 2/  1 3/  1 4/  2 3/  2 4/  3 4 /
***********************************************************************/
Parse Arg things,size
n=2**things-1
list=''
Do u=1 To n
co=combinations(u)
If co>'' Then
list=list '/' combinations(u)
End
Return substr(space(list),2) '/'    /*ª* remove leading / */

combinations: Procedure Expose things size
Parse Arg u
nc=0
bu=x2b(d2x(u))
bu1=space(translate(bu,' ',0),0)
If length(bu1)=size Then Do
ub=reverse(bu)
res=''
Do i=1 To things
c=i
If substr(ub,i,1)=1 Then res=res i
End
Return res
End
Else
Return ''
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Power-set\power-set.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
