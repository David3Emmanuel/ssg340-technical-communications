fprintf('\n--- 17.7: Heat Conduction (Crank-Nicolson) ---\n');
L = 1; T = 0.5;
nx = 20; nt = 100;
dx = L/nx; dt = T/nt;
alpha = dt/(2*dx^2);   % assuming diffusivity = 1

x = linspace(0, L, nx+1);
u = zeros(nt+1, nx+1);

% Initial condition
for i = 1:nx+1
    if x(i) <= 0.5
        u(1,i) = 2*x(i);
    else
        u(1,i) = 2*(1 - x(i));
    end
end

A = diag(1+2*alpha*ones(nx-1,1)) + diag(-alpha*ones(nx-2,1),1) + diag(-alpha*ones(nx-2,1),-1);
B = diag(1-2*alpha*ones(nx-1,1)) + diag(alpha*ones(nx-2,1),1) + diag(alpha*ones(nx-2,1),-1);

for n = 1:nt
    b = B * u(n, 2:nx)';
    u(n+1, 2:nx) = (A \ b)';
    u(n+1, 1) = 0;    % boundary u(0,t) = 0
    u(n+1, end) = 0;  % boundary u(1,t) = 0
end

figure;
surf(x, linspace(0,T,nt+1), u);
xlabel('x'); ylabel('t'); zlabel('u(x,t)');
title('Heat Conduction: Crank-Nicolson Method');
shading interp;