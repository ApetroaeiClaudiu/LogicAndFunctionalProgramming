%main(list,list) : (i,o)-nedet.
main([],[]):-!.
main([H|T],Rez):-
    minim(T,H,Min),
    pozitii([H|T],Min,1,Rez).

%minim(list,integer) : (i,o) - nedet.
minim([],Ex,Ex):-!.
minim([H|T],Ex,Min):-
    H=<Ex,
    Ex1 is H,
    minim(T,Ex1,Min),!.
minim([H|T],Ex,Min):-
    H>Ex,
    minim(T,Ex,Min).


%pozitii(list,integer,integer,list) : (i,i,i,o) - nedet.
pozitii([],_,_,[]):-!.
pozitii([H|T],Min,Poz,[Poz|Rez]):-
    Poz1 is Poz+1,
    H=:=Min,
    pozitii(T,Min,Poz1,Rez),!.
pozitii([H|T],Min,Poz,Rez):-
    Poz1 is Poz+1,
    H=\=Min,
    pozitii(T,Min,Poz1,Rez),!.

% model matematic :
% pozitiimin(l1...ln,poz,x1....,xn)=
% 1. multime vida , daca l = multime vida,
% 2. (poz+1) + pozitiimin(l2...ln,poz+1,x1..xn) , daca l1 =
% min(x1...xn),
% 3. pozitiimin(l2...ln,poz+1,x1...xn) , daca l1 != min(x1...xn).






