if2(  some-expression-that-results-in-a-boolean-value,   some-other-expression-that-results-in-a-boolean-value)


/*�*this part is a REXX comment*/         /*�*could be a DO structure.*/
select      /*�*↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓*/         /*�*↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓*/

when if.11  /*�*{condition 1 & 2  are true}*/   then    perform-a-REXX-statement
when if.10  /*�*{condition 1       is true}*/   then       "    "   "      "
when if.01  /*�*{condition 2       is true}*/   then       "    "   "      "
when if.00  /*�*{no condition      is true}*/   then       "    "   "      "

end

/*�*an example of a  DO  structure for the first clause: */

when if.11  /*�*{condition 1 & 2  are true}*/   then do;  x=12;  y=length(y);  end
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Extend-your-language\extend-your-language-1.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
