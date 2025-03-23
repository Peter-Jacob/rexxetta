say quibbling('')
say quibbling('ABC')
say quibbling('ABC DEF')
say quibbling('ABC DEF G H')
exit

quibbling: procedure
parse arg list
Select
When list='' Then result=''
When words(list)=1 then result=word(list,1)
Otherwise result=translate(strip(subword(list,1,words(list)-1)),',',' '),
'and' word(list,words(list))
End
Return '{'result'}'
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Comma-quibbling\comma-quibbling-1.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
