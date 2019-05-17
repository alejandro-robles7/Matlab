 

% Data such that y is the population and t is the given year.
y = [76212168, 92228496, 106021537, 123202624, 132164569, 151325798, 179323175, 203302031, 226542199, 248709873 ,281421906];
t = 1900 :10:2000;

% Part A
A = zeros(11);
t = 1900;
for i = 1 : 11
    for j = 1 : 11
        A(i, j ) = t ^ (j - 1);
    end
    t = t + 10;
end

c1 = cond(A);

% Part B
B = zeros(11);
t = 1900;
for i = 1 : 11
    for j = 1 : 11
        B(i, j ) = ((t - 1900)) ^ (j - 1);
    end
    t = t + 10;
end

c2 = cond(B);

% Part C
C = zeros(11);
t = 1900;
for i = 1 : 11
    for j = 1 : 11
        C(i, j ) = ((t - 1950)) ^ (j - 1);
    end
    t = t + 10;
end

c3 = cond(C);




% Part D
D = zeros(11);
t = 1900;
for i = 1 : 11
    for j = 1 : 11
        D(i, j ) = ((t - 1950)/50) ^ (j - 1);
    end
    t = t + 10;
end

c4 = cond(D);


% Matrix ranks from the most well-conditioned to the most ill-conditioned.

% D, C, B, A


% 
% % Part A
% t = 1900 :10:2000;
% A = fliplr(vander(t));
% c1 = cond(A);
% 
% % Part B
% t = (1900 :10:2000) - 1900;
% B = fliplr(vander(t));
% c2 = cond(B);
% 
% % Part C
% t = (1900 :10:2000) - 1950;
% C = fliplr(vander(t));
% c3 = cond(C);
% 
% % Part D
% t = ((1900 :10:2000) - 1950)/50;
% D = fliplr(vander(t));
% c4 = cond(D);


