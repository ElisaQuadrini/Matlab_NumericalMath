function [xk, x] = gradiente_iterate (A, b, P, x0, tol, nmax)
% Implementation of the preconditioned gradient (steepest descent) method
% to solve the linear system A*x = b.

n = length(b);

% Initialization
x = x0;                     % initial guess
k = 0;                      % iteration counter
r = b - A*x;                % residual: how far A*x is from b
res_norm = norm(r)/norm(b); % relative residual (stopping criterion)

xk = [x0];                  % store all iterates (columns)

% Iterative process
while ((res_norm > tol) && (k < nmax))
    
    % Preconditioning step: solve P*z = r
    % (z is the preconditioned residual)
    z = P\r;
    
    % Compute the step length alpha
    % This chooses the optimal step size along z
    alpha = (z' * r) / (z' * A * z);
    
    % Update the solution
    x = x + alpha * z;
    
    % Update the residual (can also be done incrementally)
    r = b - A*x;   % equivalent to r = r - alpha*A*z
    
    % Recompute relative residual
    res_norm = norm(r)/norm(b);
    
    % Update iteration counter
    k = k + 1;
    
    % Store current iterate
    xk = [xk x];
end

% Output:
% - x   : final approximation of the solution
% - xk  : matrix collecting all iterates [x0, x1, ..., xk]

end
