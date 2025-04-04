/*ͺ*REXX program  calculates and displays a   N-step   Fibonacci   sequence(s). */
parse arg FibName values               /*ͺ*allows a Fibonacci name, starter vals*/
if FibName\=''  then do;  call nStepFib  FibName,values;    signal done;    end
/*ͺ* [β]  no args specified, show a bunch*/
call  nStepFib  'Lucas'       ,   2 1
call  nStepFib  'fibonacci'   ,   1 1
call  nStepFib  'tribonacci'  ,   1 1 2
call  nStepFib  'tetranacci'  ,   1 1 2 4
call  nStepFib  'pentanacci'  ,   1 1 2 4 8
call  nStepFib  'hexanacci'   ,   1 1 2 4 8 16
call  nStepFib  'heptanacci'  ,   1 1 2 4 8 16 32
call  nStepFib  'octonacci'   ,   1 1 2 4 8 16 32 64
call  nStepFib  'nonanacci'   ,   1 1 2 4 8 16 32 64 128
call  nStepFib  'decanacci'   ,   1 1 2 4 8 16 32 64 128 256
call  nStepFib  'undecanacci' ,   1 1 2 4 8 16 32 64 128 256 512
call  nStepFib  'dodecanacci' ,   1 1 2 4 8 16 32 64 128 256 512 1024
call  nStepFib  '13th-order'  ,   1 1 2 4 8 16 32 64 128 256 512 1024 2048
done:  exit                            /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
nStepFib:  procedure;  parse arg Fname,vals,m;    if m==''  then m=30;      L=
N=words(vals)
do pop=1  for N        /*ͺ*use  N  initial values. */
newV1.pop=word(vals,pop)   /*ͺ*populate initial numbers*/
end   /*ͺ*pop*/
do j=1  for m                               /*ͺ*calculate M Fib numbers.*/
if j>N  then do;  newV1.j=0                     /*ͺ*initialize the sum to 0.*/
do k=j-N  for N    /*ͺ*sum the last  N numbers.*/
newV1.j=newV1.j+newV1.k        /*ͺ*add the  [N-j]th number.*/
end   /*ͺ*k*/
end
L=L  newV1.j                                    /*ͺ*append Fib numberβββΊlist*/
end   /*ͺ*j*/

say right(Fname,11)'[sum'right(N,3)    "terms]:"     strip(L)    'Β·Β·Β·'
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Fibonacci-n-step-number-sequences\fibonacci-n-step-number-sequences.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
