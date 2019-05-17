% Covariance Matrix (or corellation matrix)
p = [1 , .58, .35; .58, 1 , .61; .35, .61, 1];

% li = sqrt(eigval_i) * eigvec_i 
% l1 = sqrt(2.03) * [.77, .90, .79];
% l2 = sqrt(0.65) * [.59, .03, .55];
% l3 = sqrt(0.27) * [.23, .43, .27];

% li = sqrt(eigval_i) * eigvec_i 
l1 = sqrt(2.03) * [.54, .63, .56];
l2 = sqrt(0.65) * [.73, -.03, -.68];
l3 = sqrt(0.31) * [.41, -.78, .48];

% Loading matrix
L = [l1; l2]';
% Communalities
commu = arrayfun(@(n) sumsqr(L(n,:)), 1:size(L,1))';
% Specific Variance
phi = diag(diag(p)- commu);
% Estimate of covariance
p1 = L * L' + phi;
% Error
error = p - p1;