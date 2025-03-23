/*ª*REXX pgm shows the states of a person's biorhythms                   */
/*ª*                                 (physical, emotional, intellectual) */
Parse Arg birthdate targetdate .  /*ª* obtain one or two dates from CL   */
If birthdate='?' Then Do
Say 'rexx bio birthdate (yyyymmdd) shows you today''s biorhythms'
Say 'or enter your birthday now'
Parse Pull birthdate
If birthdate='' Then Exit
End
If birthdate='' Then
Parse Value 19460906 20200906 With birthdate targetdate
If targetdate='' Then
targetdate=Date('S')
days=daysbet2(birthdate,targetdate)
If days==0 Then Do
Say
Say 'The two dates specified are exacty the same.'
Exit 1
End
cycles='physical emotional intellectual' /*ª*the biorhythm cycle names   */
cycle='negative neutral positive'
period.1=23
period.2=28
period.3=33
pid2=pi()*2*days
say 'Birthdate:   ' birthdate  '('translate('gh.ef.abcd',birthdate,'abcdefgh')')'
say 'Today:       ' targetdate '('translate('gh.ef.abcd',targetdate,'abcdefgh')')'
Say 'Elapsed days:' days
Do j=1 To 3
state=2+sign(sin(pid2/period.j))  /*ª* obtain state for each biorhythm */
Say 'biorhythm for the' right(word(cycles,j),12) 'cycle is',
word(cycle,state)
End
Exit
/*ª*---------------------------------------------------------------------*/
pi:
pi=3.1415926535897932384626433832795028841971693993751058209749445923078
Return pi
r2r:
Return arg(1)//(pi()*2)           /*ª* normalize radians --? a unit ci*/
/*ª*--------------------------------------------------------------------------------------*/
sin: Procedure
Parse Arg x
x=r2r(x)
newV1=x
Numeric Fuzz min(5,max(1,digits()-3))
If x=pi*.5 Then
Return 1
If x==pi*1.5 Then
Return-1
If abs(x)=pi|x=0 Then
Return 0
q=x*x
z=x
Do k=2 By 2 Until p=z
p=z
newV1=-newV1*q/(k*k+k)
z=z+newV1
End
Return z

daysbet2: Procedure
/*ª* compute the number of days between fromdate and todate */
Parse Arg fromdate,todate
fromday=date('B',fromdate,'S')
today=date('B',todate,'S')
Return today-fromday
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Biorhythms\biorhythms.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
