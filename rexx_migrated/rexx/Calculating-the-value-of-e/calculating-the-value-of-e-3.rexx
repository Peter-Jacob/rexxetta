/*�*REXX check the correctness of compey */
e_='2.7182818284590452353602874713526624977572470936999595749669676277240'||,
'766303535475945713821785251664274274663919320030599218174135966290435'||,
'729003342952605956307380251882050351967424723324653614466387706813388353430034'
ok=0
Do d=3 To 100
Parse Value compey(d) with e .
Numeric digits d
If e<>e_/1 Then Do
say d e
Say e
Say e_/1
End
Else ok=ok+1
End
Say ok 'comparisons are ok'
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Calculating-the-value-of-e\calculating-the-value-of-e-3.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
