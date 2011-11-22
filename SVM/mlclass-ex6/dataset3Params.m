function [C, sigma] = dataset3Params(X, y, Xval, yval)
%function [C, sigma] = EX6PARAMS(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
%C = 1;
%sigma = .1;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%


C_vec = [0.01 0.03 0.1 0.3 1 3 10 30]';
sigma_vec = [0.01 0.03 0.1 0.3 1 3 10 30]';

% Enable the code below to find search over the parameters C and sigma.
min_err = 100000;
for i = 1:length(C_vec)
for j = 1:length(sigma_vec)
model = svmTrain(X, y, C_vec(i), @(x1, x2) gaussianKernel(x1, x2, sigma_vec(j)));
predictions = svmPredict(model, Xval);
if min_err > mean(double(predictions ~= yval))
min_err = mean(double(predictions ~= yval));
C = C_vec(i)
sigma = sigma_vec(j)
end
end
end



% =========================================================================

end
