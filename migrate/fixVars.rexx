/* --------------------------------------------------------------------
 * Pick up all rexxes from a sub directory
 * --------------------------------------------------------------------
 */
home="C:\Users\PeterJ\rexxetta"
targetDIR=home"\rexx\"
/* Ensure the directory path ends with a backslash */
if substr(targetDir, length(targetDir), 1) <> '\' then targetDir = targetDir || '\'
/* Create a temporary file name */
tempFile = home || '\migrate\temp_dir.txt'  /* You can change the name as needed */
command = 'dir 'targetDir'*.rexx /S /B > 'tempfile   
/* Execute the command and capture the output */
address SYSTEM command
lnr=0 
time0=time('e')
allvars=0
 do while lines(Tempfile) > 0
    lnr=lnr+1
 	mrex=strip(linein(tempfile))
	time1=time('e')
    rc=RXMigrate(mrex)
	time1=time('e')-time1
	say right(lnr,4,'0')' 'mrex' converted with rc='rc', variables changed='changed_vars', elapsed time='time1' seconds'
	allvars=allvars+changed_vars
  end
  	time0=time('e')-time0
  say 'converted modules='lnr' variables changed='allvars', elapsed time='time0' seconds'
exit 
/* --------------------------------------------------------------------
 * REXX to change weird variable names into usual names.
 * It changes variable names which start with non alphabetic names
 * --------------------------------------------------------------------
 */
RXMigrate: Procedure expose changed_vars
parse arg filename
  call init
  solid=1         /* switch on the xref of valid names */ 
  linc=import_rexx(filename)
  call initial_rexx                           /* output initial REXX */
  call cipher_strings                         /* cipher comments and strings */
	do lnr=1 to file.0
   	   line = file.lnr
       do while line\=""    /* a rexx line may contain several statements, they must be analysed independently */
		  parse var line statement';'line
       /* Look for assignment (left-hand side) */
		  statement=dropkeywords(statement,'if','then')
          posSt = pos("=", statement)
          if posSt > 0 then do
             varName = strip(substr(statement, 1, posSt - 1))  /* Extract left-hand side */
		     call varbucket varName,lnr        /* Ensure it is a valid variable name then keep it */
          end
		  posSt = posI("parse ", statement)
          if posSt > 0 then Call ParseST strip(substr(statement, posSt)),lnr  /* Analyse parse statement */
        end
    end
    if solid=1 then call xref_solid    /* in case you want to see a xref of the solid variable names */
	call weird_sort                    /* depending on their length to avoid unwanted changes: $9 and $$9 */
	call change_weird_names
    call final_rexx
return 0
/* --------------------------------------------------------------------
 * Output the final REXX
 * --------------------------------------------------------------------
 */
final_rexx:
  inBlockComment=0
  CommentDepth=0
  do j=1 to file.0
     line=mask_strings(file.j)
	 line=mask_comments(line)
	 call lineout outrexx,line
  end
  call lineout outrexx,'/* 'copies('-',73)
  call lineout outrexx,' * REXX 'filename' was migrated on 'date()' at 'time()
  call lineout outrexx,' * 'copies('-',73)
  call lineout outrexx,'*/ '
return
/* --------------------------------------------------------------------
 * Output the initial REXX
 * --------------------------------------------------------------------
 */
initial_rexx:
  call lineout outlog,copies('-',73)
  call lineout outlog,'Initial REXX 'infile' on 'date()' at 'time()
  call lineout outlog,copies('-',73)
  do j=1 to file.0
     line=file.j
	 call lineout outlog,right(j,4,'0') line
  end
return
/* --------------------------------------------------------------------
 * Cipher strings and comments to avoid changes in them
 * --------------------------------------------------------------------
 */
cipher_strings:
  do lnr=1 to file.0
	 file.lnr = mask_comments(file.lnr)     /* mask comments to avoid change of var-names inside it */
	 file.lnr = mask_strings(file.lnr)      /* mask strings to avoid change of var-names inside it */
  end
return
/* --------------------------------------------------------------------
 * XREF solid variable names
 * --------------------------------------------------------------------
 */
xref_solid:
  call lineout outlog,copies('-',73)
  call lineout outlog,'Cross Reference Table Solid Variable Names'
  call lineout outlog,copies('-',73)
  do i=1 to vi
     call lineout outlog,right(i,3,'0') left(word(normal.i,1),16)' 'subword(normal.i,2)
  end
return
/* --------------------------------------------------------------------
 * Change weird variable names
 * --------------------------------------------------------------------
 */
change_weird_names:
  call lineout outlog,copies('-',73)
  call lineout outlog,'Cross Reference Table Bizarre Variable Names'
  call lineout outlog,copies('-',73)
  do i=1 to vj
	 vname=word(strange.i,1)
   	 newvar='newV'i
     if substr(vname,length(vname),1)='.' then newvar=newvar'.'
	 call lineout outlog,right(i,3,'0') left(vname,16)' -> 'left(newvar,16)' 'subword(strange.i,2)
	 do j=1 to lnr
	    if pos(vname,file.j)=0 then iterate
	    file.j = CHANGEISTRING(vname, file.j,newvar)
     end
	 changed_vars=changed_vars+1
  end
 return
 /* --------------------------------------------------------------------
 * Analyse the PARSE statement, and find its variable names
 * --------------------------------------------------------------------
 */
parseSt:
 parse arg vparse,linenr
  vparm=subword(vparse,2)
  vparm=translate(vparm,'',',')   /* drop parm separators */
  vparm=dropinDelim(vparm,"/*","*/")
  vparm=dropinDelim(vparm,"'")
  vparm=dropinDelim(vparm,'"')
  vi=pos(' WITH ',translate(vparm))       /* problem might be variables called WITH */ 
  if vi>0 then vparm=substr(vparm,vi+6)   /* set behind with, any preceeding information is not relevant */ 
  do pi=1 to words(vparm)     /* to do build complex PARSE structure, this is just, well it works */
     wrd=translate(word(vparm,pi))
	 if wrd='UPPER' then iterate
	 if wrd='ARG'   then iterate
	 if wrd='WITH'  then iterate
	 if wrd='VAR'   then iterate
	 prm=word(vparm,pi)
	 if prm='.' then iterate   /* it's just a placeholder */
	 if datatype(prm)='NUM' then iterate
	 call varbucket prm,linenr
  end
return
/* --------------------------------------------------------------------
 * Place found variable names into solid or weird bucket
 * --------------------------------------------------------------------
 */
varbucket:
parse arg varname,li
  varname=strip(varname)
  if varName == "" then return
  ppi=pos('*/',varname)
  if ppi>0 then varname=substr(varname,ppi+2)
  varname=strip(varname)
  if words(varname)>1 then do
     if word(translate(varname),1)='DO' then varname=word(varname,2)
	 else return
  end
  parse var varname stem'.'ct
  if stem\=varname then varname=stem'.'
  if verify(substr(varName,1,1), "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz", "M") = 0 then do
	 vx=findstrange(varname)
	 if vx>0 then strange.vx=strange.vx' 'li
	 else do
	    vj=vj+1
		strange.0=vj
        strange.vj=varName' 'li
	 end
  end
  else do
     vx=findNormal(varname)
	 if vx>0 then normal.vx=normal.vx' 'li
	 else do
	    vi=vi+1
        normal.0=vi
        normal.vi=varName' 'li
	 end
  end
return
/* --------------------------------------------------------------------
 * is the weird variable already in the list?
 * --------------------------------------------------------------------
 */
findstrange:
  parse arg varname
  do ai=1 to vj
     if word(strange.ai,1)=varname then return ai
  end
return 0
/* --------------------------------------------------------------------
 * is the solid variable already in the list?
 * --------------------------------------------------------------------
 */
findNormal:
  parse arg varname
  do ai=1 to vi
    if word(normal.ai,1)=varname then return ai
  end
return 0
/* --------------------------------------------------------------------
 * Mask quoted strings to avoid unwanted changes of variable names
 * --> technique shift each char into non printable range by XOR 80x
 * --> call it a second time transfers it back
 * --------------------------------------------------------------------
 */
mask_strings: procedure
  parse arg line
  maskedLine = ""
  inString = 0
  quoteChar = ""
  llen=length(line)
  do i = 1 to llen
      char = substr(line, i, 1)
      if inString = 0 then do
          /* Detect start of string (single or double quotes) */
          if char = "'" | char = '"' then do
	         inString = 1
             quoteChar = char
          end
          maskedLine = maskedLine || char  /* Normal character or quote */
      end
      else do
          /* Inside string: replace char with char+80x */
          if char = quoteChar then do
		      maskedLine = maskedLine || quotechar
              inString = 0
              quoteChar = ""
          end
          else maskedLine = maskedLine || bitxor(char,'80'x)
      end
  end
return maskedLine
/* --------------------------------------------------------------------
 * Mask comments to avoid unwanted changes of variable names
 * --> technique shift each char into non printable range by XOR 80x
 * --> call it a second time transfers it back
 * --------------------------------------------------------------------
 */
/* Function to mask out nested block comments and inline comments */
mask_comments: procedure expose commentDepth
  parse arg line
  maskedLine = ""
  i = 1
  llen=length(line)
  do while i <= llen
     char = substr(line, i, 1)
     nextChar = substr(line, i+1, 1)
  /* Detect start of block comment (nested) */
     if char = "/" & nextChar = "*" then do
        commentDepth = commentDepth + 1
        maskedLine = maskedLine || "/*"
        i = i + 1  /* Skip next char */
        iterate
     end
  /* Detect end of block comment */
     if char = "*" & nextChar = "/" then do
        if commentDepth > 0 then commentDepth = commentDepth - 1
        maskedLine = maskedLine || "*/"
        i = i + 2  /* Skip next char */
        iterate
     end
     if commentDepth > 0 then maskedLine = maskedLine || bitxor(char,'80'x) /* Inside a comment: mask with '!' */
     else maskedLine = maskedLine || char   								 /* Normal character (outside comments) */
     i = i + 1
  end
return maskedLine
/* --------------------------------------------------------------------
 * DROPinDELIM - Function to remove parts of a string between specified delimiters
 *
 * Usage: result = dropindelIM(inputString, startDelim, endDelim)
 *
 * Parameters:
 *   inputString - String to process
 *   startDelim  - Starting delimiter character or string
 *   endDelim    - Ending delimiter character or string (defaults to startDelim if not provided)
 *
 * Returns:
 *   String with all content between the specified delimiters removed
 * --------------------------------------------------------------------
 */
dropinDelim: procedure
  parse arg inputString, startDelim, endDelim
  /* If end delimiter not provided, use the same as start delimiter */
  if endDelim = '' then endDelim = startDelim
  result = ""
  remaining = inputString
  inDelimited = 0
  do while remaining \= ""
    if inDelimited = 0 then do
      startPos = pos(startDelim, remaining)   /* Find the next start delimiter */
      if startPos = 0 then do    /* If no start delimiter found, add remaining text and exit */
        result = result' 'remaining
        leave
      end
      /* Add text before the start delimiter */
      result = result' 'substr(remaining, 1, startPos - 1)
      /* Remove processed part and the start delimiter */
      remaining = substr(remaining, startPos + length(startDelim))
      inDelimited = 1
    end
    else do
      endPos = pos(endDelim, remaining)   /* Find the end delimiter */
      if endPos = 0 then leave            /* If no end delimiter found, we're done */
      /* Skip the delimited content and the end delimiter */
      remaining = substr(remaining, endPos + length(endDelim))
      inDelimited = 0
    end
  end
  /* Clean up result by removing extra spaces */
return strip(space(result))
/* --------------------------------------------------------------------
 * WeirdSORT  Sort weird names by length (Bubble sort algorithm)
 * --------------------------------------------------------------------
 */
weird_sort: procedure expose strange.
  if strange.0=0 then return
  do i = 1 to strange.0
     len.i=length(word(strange.i,1))
  end
  do i = 1 to strange.0 - 1
     do j = 1 to strange.0 - i
        len1 = len.j  /* Get the lengths to compare */
	    k=j+1
        len2 = len.k
        if len1<len2 then do    /* Compare and swap if needed */
           temp = strange.j   /* Swap the elements */
           strange.j=strange.k
           strange.k=temp
		   temp = len.j   /* Swap the elements */
           len.j= len.k
           len.k=temp
        end
     end
  end
return
/* --------------------------------------------------------------------
 * CHANGEISTRING - Case-insensitive version of the CHANGESTR function
 *
 * Usage: result = changistri(needle, haystack, replacement)
 *
 * Parameters:
 *   needle      - String to find (case-insensitive)
 *   haystack    - String to search in
 *   replacement - String to replace with
 *
 * Returns:
 *   String with all occurrences of needle replaced with replacement,
 *   regardless of case
 * --------------------------------------------------------------------
 */
changeistring: procedure
  parse arg needle, haystack, replacement

  /* If needle is empty, return haystack unchanged */
  if needle = '' then return haystack

  /* Initialize variables */
  result = ''
  remaining = haystack
  needleLen = length(needle)

  /* Loop until no more occurrences are found */
  do forever
   /* Find the next case-insensitive occurrence using posi() */
     pos_found = posi(needle, remaining)
    /* If no occurrence found, add remaining text and exit */
     if pos_found = 0 then do
        result = result || remaining
       leave
     end
    /* Add text before the occurrence */
     result = result || substr(remaining, 1, pos_found - 1)
    /* Add the replacement */
     result = result || replacement
     /* Remove processed part */
     remaining = substr(remaining, pos_found + needleLen)
  end
return result
/* --------------------------------------------------------------------
 * DROPKEYWORDS - Function to remove content between specified keywords
 *
 * Usage: result = dropkeywords(inputString, beginKeyword, endKeyword)
 *
 * Parameters:
 *   inputString  - String to process
 *   beginKeyword - Beginning keyword to search for
 *   endKeyword   - Ending keyword to search for
 *
 * Returns:
 *   String with all content between (and including) the keywords removed
 *
 * --------------------------------------------------------------------
 */
dropkeywords: procedure
  parse arg inputString, beginKeyword, endKeyword
  do forever
	 beginPos=beginWord()        /* keywords must a word, not a substring */
     if beginPos = 0 then return inputstring /* If no begin keyword found, return remaining input string */
     searchFrom  = beginPos + length(beginKeyword)
     endPos = EndWord(searchFrom)
    /* If no end keyword found, we're done */
    if endPos = 0 then return substr(inputString,1,beginPos-1) /* no end found, drop remaining parts */
    inputString = overlay(' ',inputString,beginPos,endPos+length(endKeyword)-beginPos+1)
  end
return inputString
/* --------------------------------------------------------------------
 * Find the begin keyword, it must be a word
 * --------------------------------------------------------------------
 */
BeginWord:
  wpos=0
  wrd=word(inputString,1)                      /* Find the next begin keyword */
  if posi(beginKeyword,wrd)=1 then wpos=posi(beginKeyword,inputString) /* shot in the blue, it's first word */
  if wpos=0 then wpos= posi(' 'beginKeyword, inputString)     /* Find the next begin keyword */
  if wpos=0 then do
	 wpos= posi(beginKeyword, inputString)     /* then check if it is it at the beginning of the line ? */
	 if wpos\=1 then wpos=0                 /* no then it's in the middle of a string */
  end
  if wpos=0 then do
     wpos= posi('*/'beginKeyword, inputString) /* then check if it follows a comment end */
	 if wpos>0 then wpos=wpos+2         /* skip behind comment end */
  end
return wpos
/* --------------------------------------------------------------------
 * Find the end keyword, it must be a word
 * --------------------------------------------------------------------
 */
EndWord:
parse arg sfrom
  wpos= posi(' 'endKeyword' ', inputString,sfrom)  /* Find the next endn keyword */
  if wpos=0 then wpos= posi(' 'endKeyword'/*', inputString) /* then check if it follows a comment end */
return wpos
/* --------------------------------------------------------------------
 * POSi function case insensitive
 * --------------------------------------------------------------------
 */
 posi: procedure
  parse arg needle, haystack, start
  if start = '' then start = 1  /* Default start position to 1 if not provided */
  upNeedle = translate(needle)  /* Convert both strings to uppercase for case-insensitive comparison */
  upHaystack = translate(haystack)
/* Use the standard pos() function on the uppercase strings */
  return pos(upNeedle, upHaystack, start)
/* --------------------------------------------------------------------
 * REXX function to get the path of a file 
 * --------------------------------------------------------------------
 */
getPath: procedure
   parse arg inputPath  /* Get the input path */
    /* Check if the input path is empty */
	inputPath=translate(inputPath,'/','\') 
    if inputPath = '' then return ''  /* Return an empty string if no path is provided */
    /* Remove trailing backslash if present */
    if substr(inputPath, length(inputPath), 1) = '/' then inputPath = substr(inputPath, 1, length(inputPath) - 1)
    /* Find the last backslash in the path */
    lastSlashPos = lastpos('/', inputPath)
    /* If there is no backslash, return an empty string (no parent directory) */
    if lastSlashPos = 0 then return ''
    /* Get the parent directory by taking the substring up to the last backslash */
    parentDir = substr(inputPath, 1, lastSlashPos - 1)
return parentDir  /* Return the parent directory */
/* --------------------------------------------------------------------
 * REXX function to get the file name without extension and path 
 * --------------------------------------------------------------------
 */
getBaseName: procedure
    parse arg fullPath  /* Get the full file path */
	FullPath=translate(fullPath,'/','\') 
    /* Check if the input path is empty */
    if fullPath = '' then return ''  /* Return an empty string if no path is provided */
    /* Find the last backslash to get the file name */
    lastSlashPos = lastpos('/', fullPath)
    /* Extract the file name from the path */
    if lastSlashPos > 0 then fileNameWithExtension = substr(fullPath, lastSlashPos + 1)
    else fileNameWithExtension = fullPath  /* No path, return the full name */
    /* Find the last dot to remove the extension */
    lastDotPos = lastpos('.', fileNameWithExtension)
    if lastDotPos > 0 then fileNameWithoutExtension = substr(fileNameWithExtension, 1, lastDotPos - 1)
    else fileNameWithoutExtension = fileNameWithExtension  /* No extension, return the full name */
return fileNameWithoutExtension  /* Return the file name without extension */
/* --------------------------------------------------------------------
 * REXX function to create a subdirectory and any necessary parent directories
 * --------------------------------------------------------------------
 */
createSubdirectory: procedure
    parse arg subDirPath  /* Get the subdirectory path from the argument */
    if subDirPath = '' then return -12   /* Check if the input path is empty */
    subDirPath=translate(subDirPath,'\','/')    /* stupid mkdir needs \ */ 
 /* Create the directory and any necessary parent directories */
    address SYSTEM "if not exist "subDirPath" mkdir "subDirPath"\"  
    if rc = 0 then return 0   /* Check the return code */
return -8                     /* Failed to create subdirectory */ 
/* --------------------------------------------------------------------
 * Init some variables
 * --------------------------------------------------------------------
 */
init:
  solid=0           /* no XREF for solid variable names */
  lino=0
  inBlockComment=0  /* variables to handle comments */
  CommentDepth=0
  vi=0              /* solid name count */
  vj=0              /* weird name count */
  changed_vars=0
  strange.0=0
  normal.0=0
  cpath=getPath(filename)
  rxhome=getPath(getPath(getPath(filename)))
  subdir=substr(cpath,length(rxhome)+1)             /* just take the dir/subdir path which needs to be copied */
  targetDir=rxhome'/rexx_migrated'subdir
  if createSubdirectory(targetDir)\=0 then do 
     say "failed to create sub directories"
     exit 8
  end   
  outrexx=targetdir'/'getBaseName(filename)'.rexx' 
  call lineout outrexx,,1 /* truncation */
  outlog=targetDir'/'getBaseName(filename)'.log' 
  call lineout outlog,,1 /* truncation */
 return
/* --------------------------------------------------------------------
 * Import REXX
 * --------------------------------------------------------------------
 */
import_rexx:
  parse arg filename
if filename = "" then do
    say "Usage: rexx extract_vars.rexx <filename>"
    exit 1
end

  if stream(filename, "c", "open") <> "READY:" then exit 8
  lnr=0
  do while lines(filename) > 0
     lnr=lnr+1
     file.lnr = strip(linein(filename))
  end
  file.0=lnr
  call stream filename, "c", "close"   /* Close file */
return lnr