elem(E,[E|_]).
elem(E,[_|L]):-elem(E,L).

elem2(E,[E|T],T).
elem2(E,[L1|T],[L1|TR]):-elem2(E,T,TR).

genereaza(L,1,[C1|T],Rez):-
    elem2(E,L,R),
    C1>E,
    genereaza(R,1,[E|[C1|T]],Rez).
genereaza(L,1,[C1|T],Rez):-
    elem2(E,L,R),
    C1<E,
    genereaza(R,0,[E|[C1|T]],Rez).
genereaza(L,0,[C1|T],Rez):-
    elem2(E,L,R),
    C1<E,
    genereaza(R,0,[E|[C1|T]],Rez).
genereaza(_,0,Rez,Rez).

genereazaSecventeVale(L,R):-
    elem2(E1,L,R1),
    elem2(E2,R1,R2),
    E1<E2,
    genereaza(R2,1,[E1,E2],R).

main(L,R):-findall(Rez,genereazaSecventeVale(L,Rez),R).


