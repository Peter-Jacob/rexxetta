/*�*REXX program simulates the  "shaking"  of a  "Magic 8-ball"  and displaying an answer.*/
newV1="It is certain ÷It is decidedly so ÷Without a doubt÷Yes, definitely÷Signs point to yes",
"÷You may rely on it÷ As I see it, yes÷My reply is no÷Outlook good÷Outlook not so good",
"÷Yes÷Ask again later÷Better not tell you now÷Cannot predict now÷Reply hazy, try again",
"÷Concentrate and ask again÷Don't bet on it÷Most likely÷My sources say no÷Very doubtful"

say space(translate(word(translate(translate(newV1, '┼', " "), , '÷'), random(1, 20)), ,"┼")).
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Magic-8-ball\magic-8-ball-2.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
