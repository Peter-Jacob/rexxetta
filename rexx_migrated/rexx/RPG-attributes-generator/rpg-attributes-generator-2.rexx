/*ª*REXX program generates values for six core attributes for a  RPG  (Role Playing Game).*/
do  until  m>=2 & newV1>=75;   newV1= 0;     list=  /*ª*do rolls until requirements are met. */
m= 0                                          /*ª*the number of values â‰¥ 15   (so far).*/
do 6;                  newV3= 0              /*ª*6 values (meet criteria); attrib. sum*/
do d=1  for 4;    newV2.d= random(1, 6) /*ª*roll four random dice (six sided die)*/
newV3= newV3 + newV2.d                          /*ª*also obtain their sum  (of die pips).*/
end   /*ª*d*/                         /*ª* [â†“]  use of MIN  BIF avoids sorting.*/
newV3= newV3  -  min(newV2.1, newV2.2, newV2.3, newV2.4)         /*ª*obtain the sum of the highest 3 rolls*/
list= list  newV3;         newV1= newV1 + newV3        /*ª*append $â”€â”€â–ºlist; add $ to overall $$.*/
newV1= newV1 + newV3                               /*ª*add the  $  sum  to the overall sum. */
m= m + (newV3>=15)                           /*ª*get # of rolls that meet the minimum.*/
end       /*ª*do 6*/                       /*ª* [â†‘]  gen six core attribute values. */
end            /*ª*until*/                      /*ª*stick a fork in it,  we're all done. */
say 'The total for '     list      "  is â”€â”€â–º "       newV1', '     m     " entries are â‰¥ 15."
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\RPG-attributes-generator\rpg-attributes-generator-2.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
