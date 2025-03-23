/*ª*REXX program searches a collection of strings   (an array of periodic table elements).*/
hay.=0                                           /*ª*initialize the haystack collection.  */
hay._sodium       = 1
hay._phosphorous  = 1
hay._californium  = 1
hay._copernicium  = 1
hay._gold         = 1
hay._thallium     = 1
hay._carbon       = 1
hay._silver       = 1
hay._copper       = 1
hay._helium       = 1
hay._sulfur       = 1
/*ª*underscores (_) are used to NOT ...  */
/*ª*   ... conflict with variable names. */

needle  = 'gold'                                 /*ª*we'll be looking for the gold.       */

Xneedle = '_'needle                              /*ª*prefix an underscore (_)  character. */
upper Xneedle                                    /*ª*uppercase:  how REXX stores them.    */

/*ª*alternative version of above:        */
/*ª*       Xneedle=translate('_'needle)  */

found=hay.Xneedle                                /*ª*this is it, it's found (or maybe not)*/

if found  then return j                          /*ª*return the haystack  index  number.  */
else say  needle  "wasn't found in the haystack!"
return 0                                         /*ª*indicates the needle  wasn't  found. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Search-a-list\search-a-list-3.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
