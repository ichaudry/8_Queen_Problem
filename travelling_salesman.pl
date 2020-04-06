flight(sfo,dallas,250). 
flight(sfo,atlanta,320). 
flight(sfo,toronto,400).
flight(sfo,detroit,430). 
flight(sfo,london,1600). 
flight(sfo,paris,1850).
flight(dallas,london,450). 
flight(dallas,paris,700). 
flight(atlanta,toronto,250).
flight(atlanta,london,420). 
flight(atlanta,paris,730). 
flight(toronto,london,300).
flight(toronto,paris,480). 
flight(detroit,london,480). 
flight(detroit,paris,666).
flight(london,paris,130).
% The total cost of travel from X to Y

cost(X,Y,Cost) :- flight(X,Y,Cost).


cost(X,Y,Cost) :- flight(X,T,C1), cost(T,Y,C2), Cost is C1+C2.

mincost(X,Y) :- findall(C, cost(X,Y,C), L), sort(L,[Min|T]),
write('Travel from '), write(X),
write(' to '), write(Y),nl,
write('All possible costs: '), write([Min|T]), nl,
write('Minimum cost = '), write(Min), nl.

cost1(X,Y) :- flight(X,T1,C1),flight(T1,Y,C2),
Cost is C1+C2, write(X-T1-Y: Cost).

cost2(X,Y) :- flight(X,T1,C1),flight(T1,T2,C2),flight(T2,Y,C3),
Cost is C1+C2+C3, write(X-T1-T2-Y: Cost).