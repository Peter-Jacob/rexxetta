/*ª*REXX program sorts a random list of words (or numbers)              */
/*ª* using the strand sort algorithm                                    */
Parse Arg size minv maxv old      /*ª* obtain optional arguments from CL*/
if size=='' | size==","  then size=20    /*ª*Not specified? use default.*/
if minv=='' | minv==","  then minv= 0    /*ª*Not specified? use default.*/
if maxv=='' | maxv==","  then maxv=size  /*ª*Not specified? use default.*/
Do i=1 To size
old=old random(0,maxv-minv)+minv/*ª* append random numbers to the list*/
End
old=space(old)
Say 'Unsorted list:'
Say old
new=strand_sort(old)  /*ª* sort given list (extended by random numbers) */
Say
Say 'Sorted list:'
Say new
Exit                           /*ª* stick a fork in it,  we're all done */
/*ª*--------------------------------------------------------------------*/
strand_sort: Procedure
Parse Arg source
sorted=''
Do While words(source)\==0
w=words(source)
/*ª* Find first word in source that is smaller Than its predecessor */
Do j=1 To w-1
If word(source,j)>word(source,j+1) Then
Leave
End
/*ª* Elements source.1 trough source.j are in ascending order       */
head=subword(source,1,j)
source=subword(source,j+1)     /*ª* the rest starts with a smaller  */
/*ª* value or is empty (j=w!)        */
sorted=merge(sorted,head)
End
Return sorted
/*ª*--------------------------------------------------------------------*/
merge: Procedure
Parse Arg a.1,a.2
p=''
Do Forever
w1=words(a.1)
w2=words(a.2)
Select
When w1==0 | w2==0 Then
Return space(p a.1 a.2)
When word(a.1,w1)<=word(a.2,1) Then
Return space(p a.1 a.2)
When word(a.2,w2)<=word(a.1,1) Then
Return space(p a.2 a.1)
Otherwise Do
nn=1+(word(a.1,1)>=word(a.2,1))
/*ª* move the smaller first word of a.1 or a.2 to p */
p=p word(a.nn,1)
a.nn=subword(a.nn,2)
End
End
End
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Strand-sort\sorting-algorithms-strand-sort.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
