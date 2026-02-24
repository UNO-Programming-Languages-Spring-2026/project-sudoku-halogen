% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...

% Define grid size.
#const g = 9.
#const n = 3.

% Create all possible boards.
grid(1..g,1..g).
value(1..g).

% One value per "cell". where X,Y is value(1..n)
{ sudoku(X,Y,N) : value(N) } = 1 :- grid(X,Y).

% Define subgrid

subgrid(X,Y,1+(((X-1)/n)*n+(Y-1)/n)) :- grid(X,Y).


% achieved: Make sure that all generations follow given state. Without this, we generate all possible correct boards.
% NOTE: this should always be in front of other rules

sudoku(X,Y,N) :- initial(X,Y,N).

% achieved: colwise values are distinct.
:- sudoku(X,Y,N), sudoku(X1,Y,N), X != X1.

% achieved: rowwise values are distinct.
:- sudoku(X,Y,N), sudoku(X,Y1,N), Y != Y1.

:- sudoku(X,Y,N), sudoku(X1,Y1,N), subgrid(X,Y,S), subgrid(X1,Y1,S), X != X1, Y != Y1.

#show sudoku/3.
