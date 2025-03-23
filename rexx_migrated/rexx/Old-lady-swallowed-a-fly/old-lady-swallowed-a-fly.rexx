/*ª*REXX program displays  song lyrics  for:   "I Know an Old Lady who Swallowed a Fly".  */
sw= 79                                           /*ª*the width of the terminal screen, -1.*/
newV1.=;            newV1.1 = "I don't know why she swallowed a fly,"
newV1.2 = "That wriggled and jiggled and tickled inside her.";    newV1.2.0=.
newV1.3 = "How absurd to swallow a bird!"
newV1.4 = "Imagine that, to swallow a cat!"
newV1.5 = "My, what a hog, to swallow a dog!"
newV1.6 = "Just opened her throat and swallowed a goat!"
newV1.7 = "I wonder how she swallowed a cow?!"
newV1.8 = "She's dead, of course!!"
newV3 = 'fly spider bird cat dog goat cow horse'
newV4= words(newV3)                                      /*ª*#:  number of animals to be swallowed*/

do j=1  for newV4;        say
say center('I know an old lady who swallowed a'     word(newV3, j)",",  sw)
if j\==1  then  say center(newV1.j, sw)
if j ==newV4  then leave                           /*ª*Is this the last verse?   We're done.*/
do k=j  to 2  by -1;      km= k-1;              newV2= word(newV3, km)','
say center('She swallowed the'   word(newV3,k)  "to catch the"   newV2, sw)
if newV1.km.0\==''  then say center(newV1.km, sw)
end   /*ª*k*/                /*ª* [â†‘]  display the lyrics of the song.*/
say center(newV1.1, sw)
say center("I guess she'll die.", sw)
end   /*ª*j*/                                    /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Old-lady-swallowed-a-fly\old-lady-swallowed-a-fly.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
