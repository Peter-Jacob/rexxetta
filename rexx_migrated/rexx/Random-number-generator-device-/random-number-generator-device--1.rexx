/*�*REXX program  generates and displays a random  32-bit  number  using the  RANDOM  BIF.*/
numeric digits 10                                /*�*ensure REXX has enough decimal digits*/
newV1=2**16                                          /*�*a handy─dandy constant to have around*/
r#= random(0, newV1-1) * newV1    +    random(0, newV1-1)    /*�*generate an unsigned 32-bit random #.*/
say r#                                           /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Random-number-generator-device-\random-number-generator-device--1.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
