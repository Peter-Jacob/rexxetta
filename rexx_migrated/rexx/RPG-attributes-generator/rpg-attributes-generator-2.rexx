/*�*REXX program generates values for six core attributes for a  RPG  (Role Playing Game).*/
do  until  m>=2 & newV1>=75;   newV1= 0;     list=  /*�*do rolls until requirements are met. */
m= 0                                          /*�*the number of values ≥ 15   (so far).*/
do 6;                  newV3= 0              /*�*6 values (meet criteria); attrib. sum*/
do d=1  for 4;    newV2.d= random(1, 6) /*�*roll four random dice (six sided die)*/
newV3= newV3 + newV2.d                          /*�*also obtain their sum  (of die pips).*/
end   /*�*d*/                         /*�* [↓]  use of MIN  BIF avoids sorting.*/
newV3= newV3  -  min(newV2.1, newV2.2, newV2.3, newV2.4)         /*�*obtain the sum of the highest 3 rolls*/
list= list  newV3;         newV1= newV1 + newV3        /*�*append $──►list; add $ to overall $$.*/
newV1= newV1 + newV3                               /*�*add the  $  sum  to the overall sum. */
m= m + (newV3>=15)                           /*�*get # of rolls that meet the minimum.*/
end       /*�*do 6*/                       /*�* [↑]  gen six core attribute values. */
end            /*�*until*/                      /*�*stick a fork in it,  we're all done. */
say 'The total for '     list      "  is ──► "       newV1', '     m     " entries are ≥ 15."
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\RPG-attributes-generator\rpg-attributes-generator-2.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
