function [X_poly] = polyFeatures(X, p)
%POLYFEATURES Maps X (1D vector) into the p-th power
%   [X_poly] = POLYFEATURES(X, p) takes a data matrix X (size m x 1) and
%   maps each example into its polynomial features where
%   X_poly(i, :) = [X(i) X(i).^2 X(i).^3 ...  X(i).^p];
%


% You need to return the following variables correctly.
X_poly = zeros(numel(X), p);

% ====================== YOUR CODE HERE ======================
% Instructions: Given a vector X, return a matrix X_poly where the p-th 
%               column of X contains the values of X to the p-th power.
%
% 

% All three solutions work, but bsxfun produces a different figure. Also, bsxfun seems more accurate.
% The Polynomial regression fit with bsxfun continues to climb instead of immediately drop off,
% which is what the next two methods do. 
i = 1:(numel(X));
p = (1:p);
X_poly(i, :) = bsxfun(@power, X(i), p);
end
 
%for i = 1:p
%X_poly(:, i) = X.^i;
%end
 
%for i = 1:p
%X_poly(:, i) = power(X, i);
%end


% =========================================================================

end
