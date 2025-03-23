/*ª* REXX ---------------------------------------------------------------
* 20.02.2014 Walter Pachl  relying on 'prime decomposition'
* 21.02.2014 WP Clarification: I copied the algorithm created by
*            Gerard Schildberger under the task referred to above
* 21.02.2014 WP Make sure that factr is not called illegally
*--------------------------------------------------------------------*/
Call test 4
Call test 9
Call test 10
Call test 12
Call test 1679
Exit

test:
Parse Arg z
If is_semiprime(z) Then Say z 'is semiprime' fl
Else Say z 'is NOT semiprime' fl
Return

is_semiprime:
Parse Arg z
If z<1 | datatype(z,'W')=0 Then Do
Say 'Argument ('z') must be a natural number (1, 2, 3, ...)'
fl=''
End
Else
fl=factr(z)
Return words(fl)=2

/*ª*----------------------------------FACTR subroutine-----------------*/
factr: procedure; parse arg x 1 z,list /*ª*sets X&Z to arg1, LIST=''.  */
if x==1  then return ''             /*ª*handle the special case of X=1.*/
j=2;     call .factr                /*ª*factor for the only even prime.*/
j=3;     call .factr                /*ª*factor for the 1st  odd  prime.*/
j=5;     call .factr                /*ª*factor for the 2nd  odd  prime.*/
j=7;     call .factr                /*ª*factor for the 3rd  odd  prime.*/
j=11;    call .factr                /*ª*factor for the 4th  odd  prime.*/
j=13;    call .factr                /*ª*factor for the 5th  odd  prime.*/
j=17;    call .factr                /*ª*factor for the 6th  odd  prime.*/
/*ª* [?]   could be optimized more.*/
/*ª* [?]   J in loop starts at 17+2*/
do y=0  by 2;     j=j+2+y//4   /*ª*insure J isn't divisible by 3. */
if right(j,1)==5  then iterate /*ª*fast check for divisible by 5. */
if j*j>z          then leave   /*ª*are we higher than the v of Z ?*/
if j>Z            then leave   /*ª*are we higher than value of Z ?*/
call .factr                    /*ª*invoke .FACTR for some factors.*/
end   /*ª*y*/                    /*ª* [?]  only tests up to the v X.*/
/*ª* [?]  LIST has a leading blank.*/
if z==1  then return list           /*ª*if residual=unity, don't append*/
return list z         /*ª*return list,  append residual. */
/*ª*-------------------------------.FACTR internal subroutine----------*/
.factr:  do  while z//j==0          /*ª*keep dividing until we can't.  */
list=list j                /*ª*add number to the list  (J).   */
z=z%j                      /*ª*% (percent)  is integer divide.*/
end   /*ª*while zÂ·Â·Â· */      /*ª*  //   ?---remainder integer Ã·.*/
return                              /*ª*finished, now return to invoker*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Semiprime\semiprime-1.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
