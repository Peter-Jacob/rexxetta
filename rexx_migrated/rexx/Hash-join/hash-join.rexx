/*�*REXX program demonstrates the  classic hash join algorithm  for two relations.        */
S.  =                   ;         R.  =
S.1 = 27 'Jonah'        ;         R.1 = "Jonah Whales"
S.2 = 18 'Alan'         ;         R.2 = "Jonah Spiders"
S.3 = 28 'Glory'        ;         R.3 = "Alan Ghosts"
S.4 = 18 'Popeye'       ;         R.4 = "Alan Zombies"
S.5 = 28 'Alan'         ;         R.5 = "Glory Buffy"
hash.=                                           /*�*initialize the  hash  table (array). */
do newV1=1  while S.newV1\=='';   parse var  S.newV1  age  name          /*�*extract information*/
hash.name=hash.name newV1                      /*�*build a hash table entry with its idx*/
end   /*�*#*/                                /*�* [↑]  REXX does the heavy work here. */
newV1=newV1-1                                            /*�*adjust for the DO loop  (#)  overage.*/
do j=1  while R.j\==''                     /*�*process a nemesis for a name element.*/
parse var  R.j  x  nemesis                 /*�*extract the name  and  its nemesis.  */
if hash.x==''  then do;   newV1=newV1 + 1          /*�*Not in hash?  Then a new name; bump #*/
S.newV1=','  x       /*�*add a new name to the    S   table.  */
hash.x=newV1         /*�* "  "  "    "   "  "   hash    "     */
end                    /*�* [↑]  this  DO  isn't used today.    */
do k=1  for words(hash.x);   newV2=word(hash.x, k)          /*�*obtain the pointer.*/
S.newV2=S.newV2  nemesis                      /*�*add the nemesis ──► applicable hash. */
end   /*�*k*/
end        /*�*j*/
newV2='─'                                            /*�*the character used for the separator.*/
pad=left('', 4)                                  /*�*spacing used in header and the output*/
say  pad  center('age', 3)   pad   center("name", 20   )   pad    center('nemesis', 30   )
say  pad  center('───', 3)   pad   center(""    , 20, newV2)   pad    center(''       , 30, newV2)

do n=1  for newV1;      parse  var  S.n    age  name  nems       /*�*obtain information.*/
if nems==''  then iterate                                    /*�*No nemesis?  Skip. */
say pad right(age,3) pad center(name,20) pad center(nems,30) /*�*display an  "S".   */
end   /*�*n*/                                /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Hash-join\hash-join.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
