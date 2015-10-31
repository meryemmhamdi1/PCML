clear all;
load('Mumbai_regression.mat');
load('catClusters.mat');

catVar = [9, 10, 12, 15, 31, 35, 39, 48, 49, 59, 65, 68];
A = (1:73);
nonCatVar = A(~ismember(A,catVar));

% Normalize the non-categorical variables and dummy encode categorical
% variables
Xtr_nonCat = normalize(X_train(:, nonCatVar));
Xtr = [Xtr_nonCat, dummyEncode(X_train)];
Xte_nonCat = normalize(X_test(:, nonCatVar));
Xte = [Xte_nonCat, dummyEncode(X_test)];

% Compute betas in order to classify X_test into one of the three clusters
alpha = 0.001;
[beta1, beta2, beta3] = clustersRegression(Xtr, alpha, clusters);

% Probabilities for X_test's to belong to one of the three clusters
tXte = [ones(length(Xte), 1) Xte];
p1 = sigmoid(tXte * beta1);
p2 = sigmoid(tXte * beta2);
p3 = sigmoid(tXte * beta3);

% classify X_test

for i = 1:length(X_test)
%     model = 0;
%     if p1(i,1) > p2(i,1)
%     elseif p2
end