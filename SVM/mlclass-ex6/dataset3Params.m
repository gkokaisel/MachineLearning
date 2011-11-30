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


fprintf('********************************************************************************\n');
fprintf('Start searching parameters [C, sigma] to find optimum values. Relax, this will take a few moments.\n');
error_min = inf;
values = [0.01 0.03 0.1 0.3 1 3 10 30];

for C_vec = values
  for sigma_vec = values
    fprintf('Train and evaluate (on cross validation set) for\n[_C, _sigma] = [%f %f]\n', C_vec, sigma_vec);
    model = svmTrain(X, y, C_vec, @(x1, x2) gaussianKernel(x1, x2, sigma_vec));
    err = mean(double(svmPredict(model, Xval) ~= yval));
    fprintf('prediction error: %f\n', err);
    if( err <= error_min )
      fprintf('error_min updated!\n');
      C = C_vec;
      sigma = sigma_vec;
      error_min = err;
      fprintf('[C, sigma] = [%f %f]\n', C, sigma);
    end
    fprintf('--------\n');
  end
end

fprintf('\nSearch completed.\nOptimum value for [C, sigma] = [%f %f] with prediction error = %f\n\n', C, sigma, error_min);
fprintf('********************************************************************************\n');




% =========================================================================

end
