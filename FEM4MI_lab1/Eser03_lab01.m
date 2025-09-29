
TestName = 'Test1';
nRef = 5;
[errors,solutions,femregion,Dati]=Eser03_main1D(TestName,nRef);

%% risolvere sistema lineare non con / ma con lu e chol

% ci impiega meno backslash
% cholensky o piccolo n^2 