/*ª* REXX Driver for pancake.test */
do n=2 To 10
Call pancake n
End
pancake: Procedure
/*ª**********************************************************************
* REXX pancake.rex
* The task is to determine p(n) for n = 1 to 9,
* and for each show an example requiring p(n) flips.
* inspired by java and output like Phix
* 20230531 Walter Pachl
**********************************************************************/
Call time 'R'
parse arg n                          newV1 Number of pancakes
init=left('123456789abc',n)          newV1 ordered pancakes
Call o 'heureka' n
q.=0                                 newV1 implements the queue
qp=1
ex=0
call qadd init
stackFlips.=-1                       newV1 initialize map
stackFlips.init=0                    newV1 stackFlips.v: number of flips
newV1 from init to v
cnt.=0
cnt.1=1
max=0
Do while qp<=q.0                     newV1 as long we can flip
s=qget()                           newV1 get head of queue
flips=stackFlips.s+1               newV1 flips for the successors
cnt.flips=cnt.flips+1              newV1 count them
If flips>max Then ex=0             newV1 a new maximum
max=max(max,flips)
Do i=2 To n                        newV1 process n-1 successors
t=flip(s,i)                      newV1 one of them
If stackFlips.t=-1 Then Do       newV1 not set so far
stackFlips.t=flips             newV1 flips from init to t
Call qadd t                    newV1 append it to the queue
If ex<3 Then Do                newV1 show the first 3 examples
call o flips t
If ex>=0 Then Do             newV1 record the data to be shown
example=''                 newV1 as an example (see o2)
Do While t<>''
Parse Var t c +1 t
Select
When c='a' Then c=10
When c='b' Then c=11
When c='c' Then c=12
Otherwise Nop
End
example=example||c||','
End
exf=flips
example=strip(example,'T',',')
End
ex=ex+1
End
End
End
End
Call o 'max cnt.max:' max cnt.max
te=time('E')                         newV1 elapsed time
te=strip(format(te,8,1))
Call o te 'seconds'
Call o ''
Call o2 'p('n') = 'exf', example: {'example'} (of' cnt.max', 'te's)'
Return

flip: Procedure
Parse Arg s,k                        newV1 cf. flipStack in java
Return substr(s,k,1)reverse(left(s,k-1))||substr(s,k+1)

qadd:                                newV1 add an element to the queue
Parse Arg e
z=q.0+1
q.z=e
q.0=z
Return

qget:                                newV1 get top element from the queue
e=q.qp                               newV1 and remove it from the queue
qp=qp+1
Return e

o: newV1 investigation and debug output
Return
Say arg(1)
Return lineout('heureka.txt',arg(1))

o2: newV1 result to be shown in rosettacode
Say arg(1)
Call lineout 'heureka.out',arg(1)
Call lineout 'heureka.out'
Return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Pancake-numbers\pancake-numbers-2.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
