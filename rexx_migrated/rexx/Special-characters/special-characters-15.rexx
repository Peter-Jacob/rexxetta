x='--12 ++12 -12.000 +12 12 12. 012 0012 0012.00 1.2E1 1.2e+1 --12e-00 120e-1 ++12 ++12. 0--12 00--12 --12'
do j=1 for words(x)
interpret 'something=' word(x,j)
say 'j=' j  '   x=' x   '   something='something
end
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Special-characters\special-characters-15.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
