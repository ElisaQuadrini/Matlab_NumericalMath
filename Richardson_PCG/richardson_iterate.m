function [xk, k] = richardson_iterate(A, b, P, x0, tol, nmax, alpha)
% Implementation of the (preconditioned) Richardson method
% - Can be used with a fixed step (stationary Richardson)
% - Or with a dynamic step (alpha chosen optimally each iteration, i.e. gradient method)
%
% INPUT:
%   A     : system matrix
%   b     : right-hand side vector
%   P     : preconditioner (set P=I for no preconditioning)
%   x0    : initial guess
%   tol   : tolerance for stopping criterion (relative residual)
%   nmax  : maximum number of iterations
%   alpha : acceleration parameter; if not provided, dynamic Richardson is used
%
% OUTPUT:
%   xk    : matrix storing all iterates as columns [x0, x1, ..., xk]
%   k     : number of iterations performed

n = length(b);

% Initialization
x = x0;                     % initial guess
k = 0;                      % iteration counter
r = b - A*x;                % residual
res = norm(r)/norm(b);      % relative residual

xk = [x0];                  % store all iterates

% Iterative loop
while ((res > tol) && (k < nmax))
    
    % Preconditioning step
    z = P\r;    % solve P*z = r
    
    % Choice of alpha:
    % - If alpha is not provided, compute dynamic alpha (optimal step length)
    % - Otherwise, use the fixed alpha (stationary Richardson)
    if (nargin == 6)
        alpha = (z' * r) / (z' * A * z);  % dynamic Richardson
    end
    
    % Update the solution
    x = x + alpha*z;
    
    % Update the residual
    r = b - A*x;
    res = norm(r)/norm(b);
    
    % Increase iteration counter
    k = k + 1;
    
    % Store current iterate
    xk = [xk x];
end

% Print convergence status
if (res < tol)
    fprintf('Richardson converged in %d iterations \\n', k);
else
    fprintf('Richardson did not converge in %d iterations \\n', k);
end

end
