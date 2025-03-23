/*ª*REXX program to demonstrates how to perform array concatenation.*/

p.=                                    /*ª*(below) a short list of primes.*/
p.1=2;    p.2=3;     p.3=5;     p.4=7;     p.5=11;   p.6=13
p.7=17;   p.8=19;    p.9=23;    p.10=27;   p.11=31;  p.12=37

f.=                                    /*ª*(below) a list of Fibonacci #s.*/
f.0=0;f.1=1;f.2=1;f.3=2;f.4=3;f.5=5;f.6=8;f.7=13;f.8=21;f.9=34;f.10=55

do j=1  while p.j\==''
c.j=p.j                   /*ª*assign C array with some primes*/
end   /*ª*j*/
n=j-1
do k=0  while f.k\=='';   n=n+1
c.n=f.k                   /*ª*assign C array with fib numbers*/
end   /*ª*k*/
say 'elements=' n
say
do m=1  for n
say 'c.'m"="c.m           /*ª*show a "merged"  C  array nums.*/
end   /*ª*m*/
/*ª*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Array-concatenation\array-concatenation-3.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
