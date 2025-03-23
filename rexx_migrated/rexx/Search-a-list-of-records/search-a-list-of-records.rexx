/*�*REXX program (when using criteria) locates values (indices)  from an associate array. */
newV2="Lagos=21,  Cairo=15.2,  Kinshasa-Brazzaville=11.3, Greater Johannesburg=7.55, Mogadishu=5.85,",
"Khartoum-Omdurman=4.98, Dar Es Salaam=4.7,  Alexandria=4.58,   Abidjan=4.4,  Casablanca=3.98"
newV1.= '(city not found)';    city.= "(no city)"       /*�*city search results for not found.*/
/*�* [↓]  construct associate arrays. */
do newV3=0  while newV2\='';  parse var newV2 c '=' p "," newV2;  c=space(c);  parse var c a 2;  newV1.c=newV3
city.newV3=c;  pop.newV3=p;  pop.c=newV3;  if newV1.a==newV1.  then newV1.a=c;  /*�*assign city, pop, indices.*/
end   /*�*#*/                                     /*�* [↑]  city array starts at 0 index*/
/*�*▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ task 1:  show the  INDEX  of a city.*/
town= 'Dar Es Salaam'                               /*�*the name of a city for the search.*/
say 'The city of ' town " has an index of: " newV1.town /*�*show (zero─based) index of a city.*/
say                     /*�*▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ task 2:  show 1st city whose pop<5 M*/
many=5                                              /*�*size of a city's pop in millions. */
do k=0  for newV3  until pop.k<many; end          /*�*find a city's pop from an index.  */
say '1st city that has a population less than '     many     " million is: "    city.k
say                     /*�*▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ task 3:  show 1st city with A* name.*/
c1= 'A'                                             /*�*1st character of a city for search*/
say '1st city that starts with the letter' c1 "is: " newV1.c1 /*�*stick a fork in it, all done*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Search-a-list-of-records\search-a-list-of-records.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
