gcd: procedure
x=abs(arg(1))
do j=2 to arg()
y=abs(arg(j))
If y<>0 Then Do
do until z==0
z=x//y
x=y
y=z
end
end
end
return x
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Greatest-common-divisor\greatest-common-divisor-3.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
