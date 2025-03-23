/*�*REXX pgm illustrates how to code a list of words  (named chemical elements  */
/*�*──────────────────────── ordered by their atomic number)  in a list format. */

newV1= 'hydrogen     helium        lithium     beryllium   boron        carbon'    ,
'nitrogen     oxygen        fluorine    neon        sodium       magnesium' ,
'aluminum     silicon       phosphorous sulfur      chlorine     argon'     ,
'potassium    calcium       scandium    titanium    vanadium     chromium'  ,
'manganese    iron          cobalt      nickel      copper       zinc'      ,
'gallium      germanium     arsenic     selenium    bromine      krypton'   ,
'rubidium     strontium     yttrium     zirconium   niobium      molybdenum',
'technetium   ruthenium     rhodium     palladium   silver       cadmium'   ,
'indium       tin           antimony    tellurium   iodine       xenon'     ,
'cesium       barium        lanthanum   cerium      praseodymium neodymium' ,
'promethium   samarium      europium    gadolinium  terbium      dysprosium',
'holmium      erbium        thulium     ytterbium   lutetium     hafnium'   ,
'tantalum     tungsten      rhenium     osmium      iridium      platinum'  ,
'gold         mercury       thallium    lead        bismuth      polonium'  ,
'astatine     radon         francium    radium      actinium     thorium'   ,
'protactinium uranium       neptunium   plutonium   americium    curium'    ,
'berkelium    californium   einsteinium fermium     mendelevium  nobelium'  ,
'lawrencium   rutherfordium dubnium     seaborgium  bohrium      hassium'   ,
'meitnerium   darmstadtium  roentgenium copernicium nihonium     flerovium' ,
'moscovium    livermorium   tennessine  oganesson'

/*�* [↑]  element list using continuation  (commas).*/

updated= 'February 29th, 2020'            /*�*date of the last revision of list.*/
say 'revision date of the list: ' updated /*�*show the date of the last update. */
elements= space(newV1)                        /*�*elide excess  blanks   in the list*/
newV2= words(elements)                        /*�*the  number of elements "  "   "  */
say 'number of elements in the list: ' newV2  /*�*show   "     "    "     "  "   "  */
say 'the last element is: '    word(newV1, newV2) /*�*stick a fork in it, we're all done*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Long-literals-with-continuations\long-literals-with-continuations-1.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
