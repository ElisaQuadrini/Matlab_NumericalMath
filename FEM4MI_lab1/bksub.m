function x = bksub(U, y)  
if (isequal (U, triu(U)) == 0)
    error('L non triang superiore'); % come disp ma stampa in rosso
end

nrighe = size (U,1);
ncolonne = size (U,2);

if (nrighe ~= ncolonne)
    error('U rettangolare');
end

x = zeros(nrighe, 1); 

x(nrighe) = y(nrighe)/U(nrighe,nrighe);

for ii = (nrighe - 1): -1 : 1 % a differenza del C, Matlab e inefficiente nei cicli for , meglio evitarli
  x(ii) = (y(ii) - U (ii, ii+1:nrighe)* x(ii+1:nrighe)) / U(ii,ii);
end

end