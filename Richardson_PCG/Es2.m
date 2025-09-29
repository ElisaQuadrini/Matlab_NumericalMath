A = [4.24 -4.32
    -4.32 6.76];
b = [4 8]';

x = linspace(-10,10,80);
y = linspace(-10,10,80);

[X, Y] = meshgrid(x,y);
Phi = 1/2*(A(1,1)*X.^2 + A(2,2)*Y.^2 + 2*A(1,2)*X.*Y) - b(1)*X - b(2)*Y;

figure();
subplot(1,2,1)

surf(X,Y,Phi,'Lines','no');
title ('phi - superficie')
subplot(1,2,2)
contour(X,Y,Phi,20)


title('phi - linee di livello')


%% a) usare richardson iterate

[xk, k] = richardson_iterate(A, b, eye(2), [-9;-9], 1e-7, 1000, 0.05)




%surf(X,Y,Phi2,'Lines','no');
figure()

contour(X,Y,Phi,20)
hold on
 
plot(xk(1,:),xk(2,:),'-or') 
title('phi - alpha 0.05')

hold off



[xk, k] = gradiente_iterate(A, b, eye(2), [-9;-9], 1e-7, 1000);


figure();

surf(X,Y,Phi,'Lines','no'); 
contour(X,Y,Phi,20)
axis([ -10, 10, -10, 10])

hold on
title('phi - alpha 0.24') 
plot(xk(1,:),xk(2,:),'-or') 

hold off



