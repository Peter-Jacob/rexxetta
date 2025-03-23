/*�*REXX program mimics a bind operation when trying to perform addition upon arguments.  */
call add 1, 2
call add 1, 2.0
call add 1, 2.0, -6
call add self, 2
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
add:   void= 'VOID';                       f=    /*�*define in terms of a function&binding*/
do j=1  for arg()           /*�*process, classify, bind each argument*/
call bind( arg(j) );  f= f arg(j)
end   /*�*j*/
say
say 'adding'  f;    call sum f            /*�*telegraph what's being performed next*/
return                                    /*�*Note: REXX treats INT & FLOAT as num.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
bind:  arg a;  type.a= datatype(a);  return      /*�*bind argument's kind with its "type".*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sum:   parse arg a;  newV1= 0                        /*�*sum all arguments that were specified*/
do k=1  for words(a);  newV2= word(a, k)
if type.newV2==num & newV1\==void  then newV1= (newV1 + word(a, k)) / 1
else newV1= void
end   /*�*k*/
say 'sum='  newV1
return newV1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Monads-Maybe-monad\monads-maybe-monad.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
