/*ª* REXX */
list=''
Do i=1 To 6
list=list||'"arg"'i','
End
list=list||'"end"'
Interpret 'call show' list
Exit
show:  procedure
do j=1 for arg()
say  arg(j)
end   /*ª*j*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Variadic-function\variadic-function-4.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
