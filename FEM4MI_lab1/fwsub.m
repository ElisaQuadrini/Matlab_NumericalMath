function y = fwsub(L, b) % b vettore colonna 
if (isequal (L, tril(L)) == 0)
    error('L non triang inferiore'); % come disp ma stampa in rosso
end

nrighe = size (L,1);
ncolonne = size (L,2);

if (nrighe ~= ncolonne)
    error('L rettangolare');
end

y = zeros(nrighe, 1); % vettore colonna con dim compatibile con b

y(1) = b(1)/L(1,1);

for ii = 2:nrighe  % a differenza del C, Matlab e inefficiente nei cicli for , meglio evitarli
    y(ii) = (b(ii) - L (ii, 1 : ii - 1) * y(1 : ii - 1) )/ L(ii, ii)
end

end