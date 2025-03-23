/*�*REXX pgm performs deconvolution of two arrays:    deconv(g,f)=h   and   deconv(g,h)=f */
call make 'H',  "-8 -9 -3 -1 -6 7"
call make 'F',  "-3 -6 -1 8 -6 3 -1 -9 -9 3 -2 5 2 -2 -7 -1"
call make 'G',  "24 75 71 -34 3 22 -45 23 245 25 52 25 -67 -96 96 31 55 36 29 -43 -7"
call show 'H'                                    /*�*display the elements of array  H.    */
call show 'F'                                    /*�*   "     "     "      "   "    F.    */
call show 'G'                                    /*�*   "     "     "      "   "    G.    */
call deco 'G',  "F", 'X'                         /*�*deconvolution of  G  and  F  ───►  X */
call test 'X',  "H"                              /*�*test: is array  H  equal to array  X?*/
call deco 'G',  "H", 'Y'                         /*�*deconvolution of  G  and  H  ───►  Y */
call test 'F',  "Y"                              /*�*test: is array  F  equal to array  Y?*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
deco: parse arg newV1,newV2,newV3;   b= newV4.newV2.# + 1;   a= newV4.newV1.# + 1      /*�*get sizes of array 1&2*/
newV4.newV3.#= a - b                                             /*�*size of return array. */
do n=0  to a-b                                      /*�*define  return array. */
newV4.newV3.n= newV4.newV1.n                                      /*�*define RETURN element.*/
if n<b  then L= 0                                   /*�*define the variable L.*/
else L= n - b + 1                           /*�*   "    "     "     " */
if n>0  then do j=L  to n-1;                newV5= n-j  /*�*define elements > 0.  */
newV4.newV3.n= newV4.newV3.n - newV4.newV3.j * newV4.newV2.newV5       /*�*compute   "     " "   */
end   /*�*j*/                            /*�* [↑] subtract product.*/
newV4.newV3.n= newV4.newV3.n / newV4.newV2.0                             /*�*divide array element. */
end   /*�*n*/;                     return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
make: parse arg newV6,z;                     newV4.newV6.#= words(z) - 1    /*�*obtain args; set size.*/
do k=0  to newV4.newV6.#;            newV4.newV6.k= word(z, k + 1)  /*�*define array element. */
end   /*�*k*/;                     return             /*�*array starts at unity.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show: parse arg newV6,z,newV5;    do s=0  to newV4.newV6.#;  newV5= strip(newV5 newV4.newV6.s)  /*�*obtain the arguments. */
end   /*�*s*/                           /*�* [↑]  build the list. */
say 'array' newV6": " newV5;                   return             /*�*show the list;  return*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
test: parse arg newV1,newV2;    do t=0  to max(newV4.newV1.#, newV4.newV2.#)        /*�*obtain the arguments. */
if newV4.newV1.t= newV4.newV2.t  then iterate       /*�*create array list.    */
say "***error*** arrays"   newV1    ' and '    newV2   "aren't equal."
end   /*�*t*/;       return             /*�* [↑]  build the list. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Deconvolution-1D\deconvolution-1d.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
