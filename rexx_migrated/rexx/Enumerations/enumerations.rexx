/*�*REXX program illustrates a method of  enumeration  of  constants via  stemmed arrays. */
fruit.=0                              /*�*the default for all possible "FRUITS."  (zero). */
fruit.apple      =   65
fruit.cherry     =    4
fruit.kiwi       =   12
fruit.peach      =   48
fruit.plum       =   50
fruit.raspberry  =   17
fruit.tomato     = 8000
fruit.ugli       =    2
fruit.watermelon =    0.5  /*�*◄─────────── could also be specified as:   1/2  */

/*�*A method of using a list (of some fruits).*/
newV1= 'apple apricot avocado banana bilberry blackberry blackcurrant blueberry baobab',
'boysenberry breadfruit cantaloupe cherry chilli chokecherry citron coconut',
'cranberry cucumber currant date dragonfruit durian eggplant elderberry fig',
'feijoa gac gooseberry grape grapefruit guava honeydew huckleberry jackfruit',
'jambul juneberry kiwi kumquat lemon lime lingenberry loquat lychee mandarin',
'mango mangosteen nectarine orange papaya passionfruit peach pear persimmon',
'physalis pineapple pitaya pomegranate pomelo plum pumpkin rambutan raspberry',
'redcurrant satsuma squash strawberry tangerine tomato ugli watermelon zucchini'

/*�*╔════════════════════════════════════════════════════════════════════════════════════╗
║Parental warning: sex is discussed below: PG─13.  Most berries don't have "berry" in║
║their name.  A  berry  is a  simple fruit  produced from a single ovary.  Some true ║
║berries are: pomegranate, guava, eggplant, tomato, chilli, pumpkin, cucumber, melon,║
║and citruses.  Blueberry  is a  false  berry;  blackberry is an  aggregate  fruit;  ║
║and strawberry is an  accessory  fruit.  Most nuts are fruits.  The following aren't║
║true nuts: almond, cashew, coconut, macadamia, peanut, pecan, pistachio, and walnut.║
╚════════════════════════════════════════════════════════════════════════════════════╝*/

/*�*  ┌─◄── due to a Central America blight in 1922; it was*/
/*�*  ↓     called the Panama disease (a soil─borne fungus)*/
if fruit.banana=0  then say "Yes!  We have no bananas today."               /*�* (sic) */
if fruit.kiwi \=0  then say "We gots "   fruit.kiwi    ' hairy fruit.'      /*�*   "   */
if fruit.peach\=0  then say "We gots "   fruit.peach   ' fuzzy fruit.'      /*�*   "   */

maxL=length('  fruit   ')                        /*�*ensure this header title can be shown*/
maxQ=length(' quantity ')                        /*�*   "     "    "      "    "   "   "  */
say
do p    =0  for 2                           /*�*the first pass finds the maximums.   */
do j=1  for words(newV1)              /*�*process each of the names of fruits. */
newV2=word(newV1, j)                      /*�*obtain a fruit name from the list.   */
newV3=value('FRUIT.'newV2)                      /*�*   "   the quantity of a fruit.      */
if \p  then do                          /*�*is this the first pass through ?     */
maxL=max(maxL, length(newV2))   /*�*the longest (widest) name of a fruit.*/
maxQ=max(maxQ, length(newV3))   /*�*the widest width quantity of fruit.  */
iterate  /*�*j*/              /*�*now, go get another name of a fruit. */
end
if j==1  then say center('fruit', maxL)    center("quantity", maxQ)
if j==1  then say copies('─'    , maxL)    copies("─"       , maxQ)
if newV3\=0  then say  right( newV2     , maxL)     right( newV3        , maxQ)
end   /*�*j*/
end       /*�*p*/
/*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Enumerations\enumerations.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
