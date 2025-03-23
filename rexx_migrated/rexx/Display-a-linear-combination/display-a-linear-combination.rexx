/*�*REXX program displays a   finite liner combination   in an   infinite vector basis.   */
newV1.= .;           newV1.1  =    '  1,  2,  3     '    /*�*define a specific test case for build*/
newV1.2  =    '  0,  1,  2,  3 '    /*�*   "   "     "      "    "   "    "  */
newV1.3  =    '  1,  0,  3,  4 '    /*�*   "   "     "      "    "   "    "  */
newV1.4  =    '  1,  2,  0     '    /*�*   "   "     "      "    "   "    "  */
newV1.5  =    '  0,  0,  0     '    /*�*   "   "     "      "    "   "    "  */
newV1.6  =       0                  /*�*   "   "     "      "    "   "    "  */
newV1.7  =    '  1,  1,  1     '    /*�*   "   "     "      "    "   "    "  */
newV1.8  =    ' -1, -1, -1     '    /*�*   "   "     "      "    "   "    "  */
newV1.9  =    ' -1, -2,  0, -3 '    /*�*   "   "     "      "    "   "    "  */
newV1.10 =      -1                  /*�*   "   "     "      "    "   "    "  */
do j=1  while  newV1.j\==.;        n= 0            /*�*process each vector; zero element cnt*/
y= space( translate(newV1.j, ,',') )               /*�*elide commas and superfluous blanks. */
newV2=                                             /*�*nullify  output  (liner combination).*/
do k=1  for words(y);     newV3= word(y, k)   /*�* ◄───── process each of the elements.*/
if newV3=0  then iterate;     a= abs(newV3 / 1)   /*�*if the value is zero, then ignore it.*/
if newV3<0  then s= '- '                      /*�*define the sign:   minus (-).        */
else s= '+ '                      /*�*   "    "    "     plus  (+).        */
n= n + 1                                  /*�*bump the number of elements in vector*/
if n==1  then s= strip(s)                 /*�*if the 1st element used, remove blank*/
if a\==1    then s= s  ||  a'*'           /*�*if multiplier is unity, then ignore #*/
newV2= newV2  s'e('k")"                           /*�*construct a liner combination element*/
end   /*�*k*/
newV2= strip( strip(newV2), 'L', "+")                  /*�*strip leading plus sign (1st element)*/
if newV2==''  then newV2= 0                            /*�*handle special case of no elements.  */
say right( space(newV1.j), 20)  ' ──► '   strip(newV2) /*�*align the output for presentation.   */
end       /*�*j*/                                /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Display-a-linear-combination\display-a-linear-combination.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
