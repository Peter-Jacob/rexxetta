/*ª*REXX program computes and displays a specified range of happy numbers.         */
Call time 'R'
linesize=80
Parse Arg low high                        /*ª* obtain range of happy numbers       */
If low='?' Then Call help
If low='' Then low=10
If high='' Then
Parse Value 1 low With low high
Do i=0 To 9                               /*ª*build a squared decimal digit table. */
square.i=i*i
End
happy.=0                                  /*ª* happy.m=1 - m is a happy number     */
unhappy.=0                                /*ª* unhappy.n=1 - n is an unhappy number*/
hapn=0                                    /*ª* count of the happy numbers          */
ol=''
Do n=1 While hapn<high                    /*ª* test integers starting with 1       */
If unhappy.n Then                       /*ª* if n  is unhappy,                   */
Iterate                               /*ª* then try next number                */
work=n
suml=''                                 /*ª* list of computed sums               */
Do Forever
sum=0
Do length(work)                       /*ª* compute sum of squared digits       */
Parse Var work digit +1 work
sum=sum+square.digit
End
Select
When unhappy.sum |,                 /*ª* sum is known to be unhappy          */
wordpos(sum,suml)>0 Then Do    /*ª* or was already encountered          */
--     If wordpos(sum,suml)>0 Then say 'Loop' n':' suml sum
--     If n<7 Then say n':' suml sum
unhappy.n=1                       /*ª* n is unhappy                        */
Call set suml                     /*ª* amd so are all sums so far          */
Iterate n
End
When sum=1 Then Do                  /*ª* we reached sum=1                    */
hapn+=1                           /*ª* increment number of happy numbers   */
happy.n=1                         /*ª* n is happy                          */
If hapn>=low Then                 /*ª* if it is in specified range         */
Call out n                      /*ª* output it                           */
If hapn=high Then                 /*ª* end of range reached                */
Leave n                         /*ª* we are done                         */
Iterate n                         /*ª* otherwise proceed                   */
End
Otherwise Do                        /*ª* otherwise                           */
suml=suml sum                     /*ª* add sum to list of sums             */
work=sum                          /*ª* proceed with the new sum            */
End
End
End
End
If ol>'' Then                             /*ª* more output data                    */
Say strip(ol)                           /*ª* write to console                    */
-- Say time('E')
Exit

set:                                      /*ª* all intermediate sums are unhappy   */
Parse Arg list
Do While list<>''
Parse Var list s list
unhappy.s=1
End
Return

out:                                      /*ª* output management                   */
Parse Arg hn                            /*ª* the happy number                    */
If length(ol hn)>linesize Then Do       /*ª* if it does not fit                  */
Say strip(ol)                         /*ª* output the line                     */
ol=hn                                 /*ª* and start a new line                */
End
Else                                    /*ª* otherwise                           */
ol=ol hn                              /*ª* append is to the output line        */
Return

help:
Say 'rexx hno n compute and show the first n happy numbers'
Say 'rexx hno low high      show happy numbers from index low to high'
Exit
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Happy-numbers\happy-numbers.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
