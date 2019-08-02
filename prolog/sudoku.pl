% solve 4x4 sudoku puzzels naively
% --------------------------------
% 1 2 3 4
% 3 4 1 2
% 2 3 4 1
% 4 1 2 3

digit(1).
digit(2).
digit(3).
digit(4).

uniq(A, B, C, D) :-
    digit(A), digit(B),
    \+ A = B,
    digit(C),
    \+ A = C,
    \+ B = C,
    digit(D),
    \+ A = D,
    \+ B = D,
    \+ C = D.

solve(S11, S12, S13, S14,
      S21, S22, S23, S24,
      S31, S32, S33, S34,
      S41, S42, S43, S44) :-
    uniq(S11, S12, S13, S14), % row 1
    uniq(S11, S21, S31, S41), % col 1
    uniq(S21, S22, S23, S24), % row 2
    uniq(S12, S22, S32, S42), % col 2
    uniq(S11, S12, S21, S22), % NW
    uniq(S13, S14, S23, S24), % NE
    uniq(S31, S32, S33, S34), % row 3
    uniq(S13, S23, S33, S43), % col 3
    uniq(S41, S42, S43, S44), % row 4
    uniq(S14, S24, S34, S44), % col 4,
    uniq(S31, S32, S41, S42), % SW
    uniq(S33, S34, S43, S44). % SE

sudoku(S11, S12, S13, S14,
       S21, S22, S23, S24,
       S31, S32, S33, S34,
       S41, S42, S43, S44) :-
    solve(S11, S12, S13, S14,
          S21, S22, S23, S24,
          S31, S32, S33, S34,
          S41, S42, S43, S44),
    nl, nl,
    write('Solution: '), nl,
    write(S11), write(' '), write(S12), write(' '), write(S13), write(' '), write(S14), nl,
    write(S21), write(' '), write(S22), write(' '), write(S23), write(' '), write(S24), nl,
    write(S31), write(' '), write(S32), write(' '), write(S33), write(' '), write(S34), nl,
    write(S41), write(' '), write(S42), write(' '), write(S43), write(' '), write(S44), nl,
    nl, nl.
