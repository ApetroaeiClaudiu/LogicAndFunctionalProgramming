sumList([], 0,1).
sumList([H|T], S, I):-
    A is mod(I,2),
    A=:=0 ->sumList(T,S1,I+1),
    S is S1+H,
    fail;
    sumList(T,S1,I+1),
    S is S1 - H.



predicat(N,A) :-
    N > 0,
    succ(N0,N),
    succ(A,A1),
    write("a\n"),
    predicat(N0,A1).

functie(M):-
    M > 5;M<2,write("mai mare ca 5"),!.
functie(M):-
    M < 5,write("mai mic ca 5"),!.
functie(M):-
    M =:= 5,write("e 5!!!!!!!!"),!.


%problema 11 b
%daca elementul e pe pozitie impara , il adunam
suma([H|T],S,I):-
    I =:=1,!,
    suma(T,S1,0),
    S is S1+H.
%daca elementul e pe pozitie para , in scadem
suma([H|T],S,I):-
    I=:=0,!,
    suma(T,S1,1),
    S is S1-H.
suma([],0,_):-!.
%apelam cu prima pozitie impara
suma_alternanta(T,S):-
    suma(T,S,1).


%problema 11 a
vale([],O):-
    O is 0.
    %write("nu e vale").
vale([H|T],O):-
    vale1(T,H,1,0,O).
%descreste , e la inceput
vale1([H|T],A,1,_,O):-
    H < A,
    vale1(T,H,1,1,O),!.
%descreste si intalneste punctul in care creste , deci gaseste vale
vale1([H|T],A,1,1,O):-
    H > A,
    vale1(T,H,0,1,O),!.
%creste dupa ce a gasit valea
vale1([H|T],A,0,1,O):-
    H > A,
    vale1(T,H,0,1,O),!.
%urca si gaseste munte sau egalitate
vale1([H|_],A,0,1,O):-
    H =< A,
    O is 0,
    write("nu e vale"),!.
%scade si gaseste egalitate
vale1([H|_],A,1,_,O):-
     H =:= A,
     O is 0,
     write("nu e vale"),!.
% doar scade
vale1([],_,1,1,O):-
    O is 0,
    write("nu e vale"),!.
%doar urca
vale1(_,_,1,0,O):-
    O is 0,
    write("nu e vale"),!.
%cazul bun , lista e vida , si a respectat conditiile de vale
vale1([],_,0,1,O):-
    O is 1,
    write("e vale"),!.










