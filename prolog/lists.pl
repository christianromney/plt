person(tom).
person(dick).
person(harry).

person_list([]).
person_list([H|T]) :-
    person(H),
    person_list(T).
