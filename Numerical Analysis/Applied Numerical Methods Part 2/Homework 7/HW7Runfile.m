% ******** Homework 7 Runfile *******

% ***** Problem 1(a), Section 9.1 ******

A = [2 , -3, 6; 0 , 3, -4; 0 , 2, -3];
[u, v, d] = eig(A);

% ***** Problem 1(d), Section 9.1 ******
A = [2 ,1, -1; 0, 2, 1; 0, 0 , 3];
[u2, v2, d2] = eig(A);

% ***** Problem 1(d), Section 9.2 ******
A = [1, 2, 1; -3, 2 ,2; 0, 1, 2];
B = [1 ,2, 0; 0, 1, 2; -3, 2, 2];

ea = eig(A);
eb = eig(B);

% ***** Problem 7(a), Section 9.2 ******
A = [2, 1; 1, 2];
[u3, v3, d3] = eig(A);

% ***** Problem 7(a), Section 9.2 ******
A = [2, 0 , 1; 0, 2, 0; 1, 0, 2];
[u4, v4, d4] = eig(A);


% ***** Problem 11, Section 9.2 ******
A = [1.59, 1.69, 2.13; 1.69, 1.31, 1.72; 2.13, 1.72, 1.85];
[u5, v5, d5] = eig(A);

