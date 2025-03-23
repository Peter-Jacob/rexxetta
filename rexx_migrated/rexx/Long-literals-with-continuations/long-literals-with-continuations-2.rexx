/*�*REXX pgm illustrates how to code a list of words  (named chemical elements  */
/*�*──────────────────────── ordered by their atomic number)  in a list format. */

newV1=  'hydrogen     helium        lithium     beryllium   boron        carbon'
newV1=newV1 'nitrogen     oxygen        fluorine    neon        sodium       magnesium'
newV1=newV1 'aluminum     silicon       phosphorous sulfur      chlorine     argon'
newV1=newV1 'potassium    calcium       scandium    titanium    vanadium     chromium'
newV1=newV1 'manganese    iron          cobalt      nickel      copper       zinc'
newV1=newV1 'gallium      germanium     arsenic     selenium    bromine      krypton'
newV1=newV1 'rubidium     strontium     yttrium     zirconium   niobium      molybdenum'
newV1=newV1 'technetium   ruthenium     rhodium     palladium   silver       cadmium'
newV1=newV1 'indium       tin           antimony    tellurium   iodine       xenon'
newV1=newV1 'cesium       barium        lanthanum   cerium      praseodymium neodymium'
newV1=newV1 'promethium   samarium      europium    gadolinium  terbium      dysprosium'
newV1=newV1 'holmium      erbium        thulium     ytterbium   lutetium     hafnium'
newV1=newV1 'tantalum     tungsten      rhenium     osmium      iridium      platinum'
newV1=newV1 'gold         mercury       thallium    lead        bismuth      polonium'
newV1=newV1 'astatine     radon         francium    radium      actinium     thorium'
newV1=newV1 'protactinium uranium       neptunium   plutonium   americium    curium'
newV1=newV1 'berkelium    californium   einsteinium fermium     mendelevium  nobelium'
newV1=newV1 'lawrencium   rutherfordium dubnium     seaborgium  bohrium      hassium'
newV1=newV1 'meitnerium   darmstadtium  roentgenium copernicium nihonium     flerovium'
newV1=newV1 'moscovium    livermorium   tennessine  oganesson'

/*�* [↑]  element list using abutments*/

update= '29Feb2020'                       /*�*date of the last revision of list.*/
say 'revision date of the list: '  update /*�*show the date of the last update. */
elements= space(newV1)                        /*�*elide excess  blanks   in the list*/
newV2= words(elements)                        /*�*the  number of elements "  "   "  */
say 'number of elements in the list: ' newV2  /*�*show   "     "    "     "  "   "  */
say 'the last element is: '    word(newV1, newV2) /*�*stick a fork in it, we're all done*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Long-literals-with-continuations\long-literals-with-continuations-2.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
