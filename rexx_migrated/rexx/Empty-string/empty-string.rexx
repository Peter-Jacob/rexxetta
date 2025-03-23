/*�*REXX program shows how to assign an empty string, & then check for empty/not-empty str*/

/*�*─────────────── 3 simple ways to assign an empty string to a variable.*/
auk=''          /*�*uses two single quotes (also called  apostrophes);  easier to peruse. */
ide=""          /*�*uses two quotes,  sometimes called a  double quote.                   */
doe=            /*�*··· nothing at all   (which in this case, a null value is assigned.   */

/*�*─────────────── assigning multiple null values to vars, 2 methods are:*/
parse var doe emu pug yak nit moa owl pas jay koi ern ewe fae gar hob

/*�*where  emu, pug, yak, ···  (and the rest) are all set to a null value.*/

/*�*───or─── (with less clutter ─── or more, depending on your perception)*/
parse value 0 with . ant ape ant imp fly tui paa elo dab cub bat ayu
/*�*where the value of  zero  is skipped,  and  the rest are set to  null,*/
/*�*which is the next value  AFTER  the  0  (zero):   nothing (or a null).*/

/*�*─────────────── how to check that a string is empty, several methods: */
if cat==''         then say "the feline is not here."
if pig==""         then say 'no ham today.'
if length(gnu)==0  then say "the wildebeest's stomach is empty and hungry."
if length(ips)=0   then say "checking with   ==   instead of  =  is faster"
if length(hub)<1   then method = "this is rather obtuse,  don't do as I do ···"

nit=''                                           /*�*assign an empty string to a lice egg.*/
if cow==nit        then say 'the cow has no milk today.'

/*�*─────────────── how to check that a string isn't empty, several ways: */
if dog\==''        then say "the dogs are out!"
/*�*most REXXes support the ¬ character. */
if fox¬==''        then say "and the fox is in the henhouse."
if length(rat)>0   then say "the rat is singing" /*�*an obscure-ish (or ugly) way to test.*/

if elk==''         then nop; else say "long way obtuse for an elk to be tested."

if length(eel)\==0 then fish=eel                 /*�*a fast compare (than below), & quick.*/
if length(cod)\=0  then fish=cod                 /*�*a not-as-fast compare.               */

/*�*────────────────────────── anyway, as they say: "choose your poison." */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Empty-string\empty-string.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
