/*ͺ*βββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ
β The REXX language doesn't allow for the changing or overriding of β
β syntax per se,  but any of the built-in-functions (BIFs) can be   β
β overridden by just specifying your own.                           β
β                                                                   β
β To use the REXX's version of a built-in-function, you simply just β
β enclose the BIF in quotation marks (and uppercase the name).      β
β                                                                   β
β The intent is two-fold:  the REXX language doesn't have any       β
β reserved words,  nor reserved  BIFs  (Built-In-Functions).        β
β                                                                   β
β So, if you don't know that  VERIFY  is a BIF,  you can just code  β
β a subroutine (or function)  with that name (or any name), and not β
β worry about your subroutine being pre-empted.                     β
β                                                                   β
β Second:  if you're not satisfied how a BIF works, you can code    β
β your own.   This also allows you to front-end a BIF for debugging β
β or modifying the BIF's behavior.                                  β
βββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ */
yyy='123456789abcdefghi'

rrr =  substr(yyy,5)                   /*ͺ*returns  efghi                 */
mmm = 'SUBSTR'(yyy,5)                  /*ͺ*returns  56789abcdefgji        */
sss = "SUBSTR"(yyy,5)                  /*ͺ* (same as above)               */
exit                                   /*ͺ*stick a fork in it, we're done.*/

/*ͺ*ββββββββββββββββββββββββββββββββββSUBSTR subroutineβββββββββββββββββββ*/
substr: return right(arg(1),arg(2))

/*ͺ*βββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ
β Also, some REXX interpreters treat whitespace(s) as blanks   when β
β performing comparisons.    Some of the whitespace characters are: β
β                                                                   β
β           NL  (newLine)                                           β
β           FF  (formFeed)                                          β
β           VT  (vertical tab)                                      β
β           HT  (horizontal tab or TAB)                             β
β           LF  (lineFeed)                                          β
β           CR  (carriage return)                                   β
β           EOF (end-of-file)                                       β
β         and/or others.                                            β
β                                                                   β
β Note that some of the above are ASCII or EBCDIC specific.         β
β                                                                   β
β Some REXX interpreters use the   OPTIONS   statement to force     β
β REXX to only treat blanks as spaces.                              β
β                                                                   β
β (Both the  verb  and  option  may be in lower/upper/mixed case.)  β
β                                                                   β
β REXX interpreters which don't recognize any  option  won't treat  β
β the (below) statement as an error.                                β
βββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ */
options  strict_white_space_comparisons   /*ͺ*can be in lower/upper/mixed.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Metaprogramming\metaprogramming.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
