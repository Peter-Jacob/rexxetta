#!/usr/bin/rexx
/*ª*REXX program to play:    Guess the number  */

number = random(1,10)
say "I have thought of a number. Try to guess it!"

guess=0    /*ª* We don't want a valid guess, before we start */

do while guess \= number
pull guess
if guess \= number then
say "Sorry, the guess was wrong. Try again!"
/*ª* endif - There is no endif in rexx. */
end

say "Well done! You guessed it!"
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Guess-the-number\guess-the-number-1.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
