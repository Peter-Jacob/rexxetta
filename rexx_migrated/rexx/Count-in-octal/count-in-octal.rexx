/*�*REXX program counts in octal until the number exceeds the number of program statements*/

/*�*┌────────────────────────────────────────────────────────────────────┐
│ Count all the protons  (and electrons!)  in the universe.          │
│                                                                    │
│ According to Sir Arthur Eddington in 1938 at his Tamer Lecture at  │
│ Trinity College (Cambridge),  he postulated that there are exactly │
│                                                                    │
│                              136 ∙ 2^256                           │
│                                                                    │
│ protons in the universe,  and the same number of electrons,  which │
│ is equal to around  1.57477e+79.                                   │
│                                                                    │
│ [Although, a modern estimate is around  10^80.]                    │
└────────────────────────────────────────────────────────────────────┘*/

numeric digits 100000                            /*�*handle almost any sized big numbers. */
numIn= right('number in', 20)                    /*�*used for indentation of the output.  */
w= length( sourceline() )                        /*�*used for formatting width of numbers.*/

do newV1=0  to 136 * (2**256)                      /*�*Sir Eddington, here we come !        */
newV2= x2b( d2x(newV1) )
newV3= right(newV2,  3 * (length(newV3) % 3 + 1),  0)
o=
do k=1  to length(newV3)  by 3
o= o'0'substr(newV3, k, 3)
end   /*�*k*/

say numIn  'base ten = '   right(newV1,w) numIn    "octal = "   right( b2x(o) + 0, w + w)
if newV1>sourceline()  then leave                  /*�*stop if # of protons > pgm statements*/
end   /*�*#*/
/*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Count-in-octal\count-in-octal.rexx was migrated on 23 Mar 2025 at 10:43:09
 * -------------------------------------------------------------------------
*/ 
