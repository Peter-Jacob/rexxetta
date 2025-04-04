/*ͺ*REXX program  demonstrates  array usage:   sparse and disjointed.     */
yyy = -55                            /*ͺ*REXX must use this mechanismΒ·Β·Β·*/
a.yyy = 1e9                            /*ͺ*Β·Β·Β· when assigning neg indices.*/

a.1 = 1000
a.2 = 2000.0001
a.7 = 7000
a.2012 = 'out here in left field.'
a.cat = 'civet, but not a true cat βββ belonging to the family Viverridae'
a.civet = "A.K.A.: toddycats"
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ
β Array elements need not be continuous (nor even defined).   They   β
β can hold any manner of numbers,  or strings (which can include any β
β characters,  including    null    or    '00'x   characters).       β
β                                                                    β
β Array elements need not be numeric, as the above code demonstrates.β
β Indeed, the element "name" can be ANYTHING,  even non-displayable  β
β characters.    To illustrate  [β]:                                 β
ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
stuff=')g.u.t.s(  or  Β½ of an intestine!'
a.stuff=44
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ
β where the element name has special characters:  blanks,  and the   β
β glyph of  one-half (Β½),  as well as the symbol used in REXX to     β
β identify stemmed arrays (the period).                              β
ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
/*ͺ*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Arrays\arrays-6.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
