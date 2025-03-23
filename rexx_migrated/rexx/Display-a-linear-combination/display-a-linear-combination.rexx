/*ª*REXX program displays a   finite liner combination   in an   infinite vector basis.   */
newV1.= .;           newV1.1  =    '  1,  2,  3     '    /*ª*define a specific test case for build*/
newV1.2  =    '  0,  1,  2,  3 '    /*ª*   "   "     "      "    "   "    "  */
newV1.3  =    '  1,  0,  3,  4 '    /*ª*   "   "     "      "    "   "    "  */
newV1.4  =    '  1,  2,  0     '    /*ª*   "   "     "      "    "   "    "  */
newV1.5  =    '  0,  0,  0     '    /*ª*   "   "     "      "    "   "    "  */
newV1.6  =       0                  /*ª*   "   "     "      "    "   "    "  */
newV1.7  =    '  1,  1,  1     '    /*ª*   "   "     "      "    "   "    "  */
newV1.8  =    ' -1, -1, -1     '    /*ª*   "   "     "      "    "   "    "  */
newV1.9  =    ' -1, -2,  0, -3 '    /*ª*   "   "     "      "    "   "    "  */
newV1.10 =      -1                  /*ª*   "   "     "      "    "   "    "  */
do j=1  while  newV1.j\==.;        n= 0            /*ª*process each vector; zero element cnt*/
y= space( translate(newV1.j, ,',') )               /*ª*elide commas and superfluous blanks. */
newV2=                                             /*ª*nullify  output  (liner combination).*/
do k=1  for words(y);     newV3= word(y, k)   /*ª* â—„â”€â”€â”€â”€â”€ process each of the elements.*/
if newV3=0  then iterate;     a= abs(newV3 / 1)   /*ª*if the value is zero, then ignore it.*/
if newV3<0  then s= '- '                      /*ª*define the sign:   minus (-).        */
else s= '+ '                      /*ª*   "    "    "     plus  (+).        */
n= n + 1                                  /*ª*bump the number of elements in vector*/
if n==1  then s= strip(s)                 /*ª*if the 1st element used, remove blank*/
if a\==1    then s= s  ||  a'*'           /*ª*if multiplier is unity, then ignore #*/
newV2= newV2  s'e('k")"                           /*ª*construct a liner combination element*/
end   /*ª*k*/
newV2= strip( strip(newV2), 'L', "+")                  /*ª*strip leading plus sign (1st element)*/
if newV2==''  then newV2= 0                            /*ª*handle special case of no elements.  */
say right( space(newV1.j), 20)  ' â”€â”€â–º '   strip(newV2) /*ª*align the output for presentation.   */
end       /*ª*j*/                                /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Display-a-linear-combination\display-a-linear-combination.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
