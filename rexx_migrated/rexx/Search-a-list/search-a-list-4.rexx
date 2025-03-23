/*�*REXX program searches a collection of strings   (an array of periodic table elements).*/
/*�*───────────────names of the first 200 elements of the periodic table.─────────────*/
newV1=  'hydrogen helium lithium beryllium boron carbon nitrogen oxygen fluorine neon sodium'
newV1=newV1 'magnesium aluminum silicon phosphorous sulfur chlorine argon potassium calcium'
newV1=newV1 'scandium titanium vanadium chromium manganese iron cobalt nickel copper zinc'
newV1=newV1 'gallium germanium arsenic selenium bromine krypton rubidium strontium yttrium'
newV1=newV1 'zirconium niobium molybdenum technetium ruthenium rhodium palladium silver cadmium'
newV1=newV1 'indium tin antimony tellurium iodine xenon cesium barium lanthanum cerium'
newV1=newV1 'praseodymium neodymium promethium samarium europium gadolinium terbium dysprosium'
newV1=newV1 'holmium erbium thulium ytterbium lutetium hafnium tantalum tungsten rhenium osmium'
newV1=newV1 'iridium platinum gold mercury thallium lead bismuth polonium astatine radon'
newV1=newV1 'francium radium actinium thorium protactinium uranium neptunium plutonium americium'
newV1=newV1 'curium berkelium californium einsteinium fermium mendelevium nobelium lawrencium'
newV1=newV1 'rutherfordium dubnium seaborgium bohrium hassium meitnerium darmstadtium'
newV1=newV1 'roentgenium copernicium nihonium flerovium moscovium livermorium tennessine'
newV1=newV1 'oganesson ununennium unbinilium unbiunium unbibium unbitrium unbiquadium'
newV1=newV1 'unbipentium unbihexium unbiseptium unbioctium unbiennium untrinilium untriunium'
newV1=newV1 'untribium untritrium untriquadium untripentium untrihexium untriseptium untrioctium'
newV1=newV1 'untriennium unquadnilium unquadunium unquadbium unquadtrium unquadquadium'
newV1=newV1 'unquadpentium unquadhexium unquadseptium unquadoctium unquadennium unpentnilium'
newV1=newV1 'unpentunium unpentbium unpenttrium unpentquadium unpentpentium unpenthexium'
newV1=newV1 'unpentseptium unpentoctium unpentennium unhexnilium unhexunium unhexbium unhextrium'
newV1=newV1 'unhexquadium unhexpentium unhexhexium unhexseptium unhexoctium unhexennium'
newV1=newV1 'unseptnilium unseptunium unseptbium unsepttrium unseptquadium unseptpentium'
newV1=newV1 'unsepthexium unseptseptium unseptoctium unseptennium unoctnilium unoctunium'
newV1=newV1 'unoctbium unocttrium unoctquadium unoctpentium unocthexium unoctseptium unoctoctium'
newV1=newV1 'unoctennium unennilium unennunium unennbium unenntrium unennquadium unennpentium'
newV1=newV1 'unennhexium unennseptium unennoctium unennennium binilnilium'

haystack= newV1                                      /*�*assign the elements ───►  haystack.  */
needle  = 'gold'                                 /*�*we'll be looking for the gold.       */
upper needle haystack                            /*�*in case some people capitalize stuff.*/
idx= wordpos(needle, haystack)                   /*�*use REXX's BIF:  WORDPOS             */
if idx\==0  then return idx                      /*�*return the haystack  index  number.  */
else say  needle  "wasn't found in the haystack!"
return 0                                         /*�*indicates the needle  wasn't  found. */
/*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Search-a-list\search-a-list-4.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
