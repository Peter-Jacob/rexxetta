/*�*REXX program sorts a (stemmed) array using the  merge-sort method. */
/*�*   using mycmp function for the sort order                         */
/*�**********************************************************************
* mergesort taken from REXX (adapted for ooRexx (and all other REXXes))
* 28.07.2013 Walter Pachl
**********************************************************************/
Call gena                        /*�* generate the array elements.   */
Call showa 'before sort'         /*�* show the before array elements.*/
Call mergeSort highitem          /*�* invoke the merge sort for array*/
Call showa ' after sort'         /*�* show the  after array elements.*/
Exit                             /*�* stick a fork in it, we're done.*/
/*�*---------------------------------GENa subroutine-------------------*/
gena:
a.=''                            /*�* assign default value for a stem*/
a.1='---The seven deadly sins---'/*�* everybody:  pick your favorite.*/
a.2='==========================='
a.3='pride'
a.4='avarice'
a.5='wrath'
a.6='envy'
a.7='gluttony'
a.8='sloth'
a.9='lust'
Do highitem=1 While a.highitem\=='' /*�*find number of entries       */
End
highitem=highitem-1              /*�* adjust highitem by -1.         */
Return
/*�*---------------------------------MERGETOa subroutine---------------*/
mergetoa: Procedure Expose a. newV1.
Parse Arg l,n
Select
When n==1 Then
Nop
When n==2 Then Do
h=l+1
If mycmp(a.l,a.h)=1 Then Do
newV2=a.h
a.h=a.l
a.l=newV2
End
End
Otherwise Do
m=n%2
Call mergeToa l+m,n-m
Call mergeTo! l,m,1
i=1
j=l+m
Do k=l While k<j
If j==l+n|mycmp(newV1.i,a.j)<>1 Then Do
a.k=newV1.i
i=i+1
End
Else Do
a.k=a.j
j=j+1
End
End
End
End
Return
/*�*---------------------------------MERGESORT subroutine--------------*/
mergesort: Procedure Expose a.
Call mergeToa 1,arg(1)
Return
/*�*---------------------------------MERGETO! subroutine---------------*/
mergeto!: Procedure Expose a. newV1.
Parse Arg l,n,newV2
Select
When n==1 Then
newV1.newV2=a.l
When n==2 Then Do
h=l+1
q=1+newV2
If mycmp(a.l,a.h)=1 Then Do
q=newV2
newV2=q+1
End
newV1.newV2=a.l
newV1.q=a.h
Return
End
Otherwise Do
m=n%2
Call mergeToa l,m
Call mergeTo! l+m,n-m,m+newV2
i=l
j=m+newV2
Do k=newV2 While k<j
If j==n+newV2|mycmp(a.i,newV1.j)<>1 Then Do
newV1.k=a.i
i=i+1
End
Else Do
newV1.k=newV1.j
j=j+1
End
End
End
End
Return
/*�*---------------------------------SHOWa subroutine------------------*/
showa:
widthh=length(highitem)           /*�* maximum the width of any line.*/
Do j=1 For highitem
Say 'element' right(j,widthh) arg(1)':' a.j
End
Say copies('-',60)                /*�* show a separator line (fence).*/
Return

mycmp: Procedure
/*�**********************************************************************
* shorter string considered higher
* when lengths are equal: caseless 'Z' considered higher than 'X' etc.
* Result:  1  B consider higher than A
*         -1  A consider higher than B
*          0  A==B (caseless)
**********************************************************************/
Parse Upper Arg A,B
A=strip(A)
B=strip(B)
I = length(A)
J = length(B)
Select
When I << J THEN res=1
When I >> J THEN res=-1
When A >> B THEN res=1
When A << B THEN res=-1
Otherwise        res=0
End
RETURN res
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sort-using-a-custom-comparator\sort-using-a-custom-comparator.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
