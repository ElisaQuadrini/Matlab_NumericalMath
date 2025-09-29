
% Build test problem: Poisson equation discretization
A = delsq(numgrid('B',50));        % system matrix (sparse Laplacian)
b = ones(size(A,1),1);             % right-hand side vector (all ones)

% Compute condition number estimate in 1-norm
condA = condest(A);

% Conjugate Gradient (PCG) without preconditioner
[x, flag, relres, iter1, resvec1] = pcg(A, b, 1e-12, 2000);

% In the command window:
% - "flag = 0" means convergence was achieved
% - "iter1" is the number of iterations performed

% Define a preconditioner P = tridiagonal part of A
P = diag(diag(A)) + ...             % main diagonal
    diag(diag(A,-1), -1) + ...      % sub-diagonal
    diag(diag(A, 1),  1);           % super-diagonal

% Check smallest eigenvalue of P (should be > 0 for SPD property)
eigs(P,1,'SA');

% Condition number estimate of the preconditioned system
condPreA = condest(P\A);

% Conjugate Gradient (PCG) with preconditioner P
[x, flag, relres, iter2, resvec2] = pcg(A, b, 1e-12, 2000, P);

% Notes:
% - resvec1 and resvec2 store the history of the residual norms
% - iter1 and iter2 show the difference in convergence speed
% - condPreA << condA indicates effective preconditioning



