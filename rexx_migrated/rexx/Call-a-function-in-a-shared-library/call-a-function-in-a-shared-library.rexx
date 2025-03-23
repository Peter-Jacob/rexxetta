/*ª*REXX program calls a function  (sysTextScreenSize)  in a shared library  (regUtil).   */

/*ª*Note:  the  REGUTIL.DLL  (REGina UTILity Dynamic Link Library */
/*ª*       should be in the  PATH  or the current directory.      */

rca= rxFuncAdd('sysLoadFuncs', "regUtil", 'sysLoadFuncs')  /*ª*add a function library.    */
if rca\==0  then do                                        /*ª*examine the    return code.*/
say 'return code' rca "from rxFuncAdd"    /*ª*tell about bad    "     "  */
exit rca                                  /*ª*exit this program with RC. */
end

rcl= sysLoadFuncs()                                        /*ª*we can load the functions. */
if rcl\==0  then do                                        /*ª*examine the    return code.*/
say 'return code' rcl "from sysLoadFuncs" /*ª*tell about bad    "     "  */
exit rcl                                  /*ª*exit this program with RC. */
end
/*ª* [â†“]   call a function.    */
newV1= sysTextScreenSize()                                     /*ª*$  has 2 words:  rows cols */
parse var  newV1     rows  cols  .                             /*ª*get two numeric words in $.*/
say '    rows='  rows                                      /*ª*show number of screen rows.*/
say '    cols='  cols                                      /*ª*  "     "    "     "  cols.*/

rcd= SysDropFuncs()                                        /*ª*make functions inaccessible*/
if rcd\==0  then do                                        /*ª*examine the    return code.*/
say 'return code' rcd "from sysDropFuncs" /*ª*tell about bad    "     "  */
exit rcd                                  /*ª*exit this program with RC. */
end
exit 0                                           /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Call-a-function-in-a-shared-library\call-a-function-in-a-shared-library.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
