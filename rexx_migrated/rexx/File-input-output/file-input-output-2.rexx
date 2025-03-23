/*ª*REXX program to read a file and write contents to an output file*****
* 03.09.2012 Walter Pachl (without erase string would be appended)
**********************************************************************/
ifid='input.txt'                        /*ª*name of the  input file.   */
ofid='output.txt'                       /*ª*name of the output file.   */
'erase' ofid                            /*ª* avoid appending           */
s=charin(ifid,,1000000)                 /*ª* read the input file       */
Call charout ofid,s                     /*ª* write to output file      */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\File-input-output\file-input-output-2.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
