%P2:9:
% a) Dandu-se o lista liniara numerica , sa se stearga toate secventele
% de valori consecutive.
consecutive(X,Y):-
    X is Y-1.

stergeConsecutive([],[]).
stergeConsecutive([H],[H]):-!.
%sta vida daca lista dorita are doar 2 elem consecutive
stergeConsecutive([H,A],[]):-
    consecutive(H,A),!.

stergeConsecutive([H,A|T],[H|L]):-
    not(consecutive(H,A)),
    stergeConsecutive([A|T],L),!.
stergeConsecutive([H,A,B|T],L):-
    consecutive(H,A),
    not(consecutive(A,B)),
    stergeConsecutive([B|T],L),!.
stergeConsecutive([H,A,B|T],L):-
    consecutive(H,A),
    consecutive(A,B),
    stergeConsecutive([A,B|T],L),!.

% b) Se da o lsita eterogena, formata din numere intregi si liste de
% numere intregi. Din fiecare sublista sa se stearga toate secventele de
% valori consecutive.
stergeDinSublista([],[]).
stergeDinSublista([H|T],[H|L]):-
    number(H),!,
    stergeDinSublista(T,L).
stergeDinSublista([H|T],[L1|L]):-
    is_list(H),!,
    stergeConsecutive(H,L1),
    stergeDinSublista(T,L).
%stergeDinSublista([_|T],L):-stergeDinSublista(T,L).
