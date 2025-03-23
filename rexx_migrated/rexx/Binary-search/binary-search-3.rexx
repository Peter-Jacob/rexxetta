/*ª*REXX program finds a  value  in a  list of integers  using an iterative binary search.*/
newV1=  3   7  13  19  23  31  43  47  61  73  83  89 103 109 113 131 139 151 167 181,
193 199 229 233 241 271 283 293 313 317 337 349 353 359 383 389 401 409 421 433,
443 449 463 467 491 503 509 523 547 571 577 601 619 643 647 661 677 683 691 709,
743 761 773 797 811 823 829 839 859 863 883 887 911 919 941 953 971 983 1013
/*ª* [â†‘]  a list of some low weak primes.*/
parse arg newV2 .                                    /*ª*get a  #  that's specified on the CL.*/
if newV2==''  then do;    say;       say '***error***  no argument specified.';       say
exit 13
end
low= 1
high= words(newV1)
say  'arithmetic mean of the '   high    " values is: "   (word(newV1, 1) + word(newV1, high)) / 2
say
do  while  low<=high;     mid= (low + high) % 2;            y= word(newV1, mid)

if newV2=y  then do;  say newV2   ' is in the list, its index is: '    mid
exit            /*ª*stick a fork in it,  we're all done. */
end

if y>newV2  then high= mid - 1        /*ª*too high?                            */
else  low= mid + 1        /*ª*too low?                             */
end   /*ª*while*/

say  newV2   " wasn't found in the list."            /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Binary-search\binary-search-3.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
