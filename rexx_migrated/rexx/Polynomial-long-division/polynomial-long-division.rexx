/*ª* REXX needed by some... */
z='1 -12 0 -42'  /*ª* Numerator   */
n='1 -3'         /*ª* Denominator */
zx=z
nx=n copies('0 ',words(z)-words(n))
qx=''            /*ª* Quotient    */
Do Until words(zx)<words(n)
Parse Value div(zx,nx) With q zx
qx=qx q
nx=subword(nx,1,words(nx)-1)
End
Say '('show(z)')/('show(n)')=('show(qx)')'
Say 'Remainder:' show(zx)
Exit
div: Procedure
Parse Arg z,n
q=word(z,1)/word(n,1)
zz=''
Do i=1 To words(z)
zz=zz word(z,i)-q*word(n,i)
End
Return q subword(zz,2)

show: Procedure
Parse Arg poly
d=words(poly)-1
res=''
Do i=1 To words(poly)
Select
When d>1 Then fact='*x**'d
When d=1 Then fact='*x'
Otherwise     fact=''
End
Select
When word(poly,i)=0  Then p=''
When word(poly,i)=1  Then p='+'substr(fact,2)
When word(poly,i)=-1 Then p='-'substr(fact,2)
When word(poly,i)<0  Then p=word(poly,i)||fact
Otherwise                 p='+'word(poly,i)||fact
End
res=res p
d=d-1
End
Return strip(space(res,0),'L','+')
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Polynomial-long-division\polynomial-long-division.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
