/*ª*REXX program implements  main step   GOST 28147-89   based on a Feistel network.      */
numeric digits 12                          /*ª*  â”Œâ”€â”€ a list of 4â”€bit Sâ”€box values used by */
/*ª*  â†“ the Central Bank of Russian Federation.*/
newV1.0  =     4  10   9   2  13   8   0  14   6  11   1  12   7  15   5   3
newV1.1  =    14  11   4  12   6  13  15  10   2   3   8   1   0   7   5   9
newV1.2  =     5   8   1  13  10   3   4   2  14  15  12   7   6   0   9  11
newV1.3  =     7  13  10   1   0   8   9  15  14   4   6  12  11   2   5   3
newV1.4  =     6  12   7   1   5  15  13   8   4  10   9  14   0   3  11   2
newV1.5  =     4  11  10   0   7   2   1  13   3   6   8   5   9  12  15  14
newV1.6  =    13  11   4   1   3  15   5   9   0  10  14   7   6   8   2  12
newV1.7  =     1  15  13   0   5   7  10   4   9   2   3  14   6  11   8  12
/*ª* [â†“]  build the sub-keys array from above. */
do r=0  for 8;     do c=0  for 16;        newV2.r.c=word(newV1.r, c + 1);     end;    end
z=0
newV3=x2d( 43b0421 );     newV4=x2d( 4320430 );                         k=newV3 + x2d( 0e2c104f9 )
do  while  k > x2d( 7ffFFffF );       k=k - 2**32;     end
do  while  k < x2d( 80000000 );       k=k + 2**32;     end

do j=0  for 4;   jj=j + j;        jjp=jj + 1   /*ª*calculate the array'a  "subscripts". */
newV5=x2d( right( d2x( k % 2 ** (j * 8) ),  2) )
cm=newV5 // 16;       cd=newV5 % 16        /*ª*perform modulus and integer division.*/
z=z + (newV2.jj.cm  +  16 * newV2.jjp.cd)  *  2**(j*8)
end   /*ª*i*/                                    /*ª* [â†‘]  encryption algorithm for S-box.*/
/*ª* [â†“]  encryption algorithm round.    */
k = c2d( bitxor( bitor( d2c(z * 2**11,  4),    d2c(z % 2**21,  4) ),     d2c(newV4, 4) ) )
say  center(d2x(k)     ' '    d2x(newV3), 79)       /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Main-step-of-GOST-28147-89\main-step-of-gost-28147-89.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
