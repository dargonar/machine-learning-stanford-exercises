function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


 
s         = sigmoid(X*theta);
% J       = (1/m) * (-y' * log(s) - (1-y)' * log(1-s));
J         = (1/m) * (-y' * log(s) - (1-y)' * log(1-s)) + (lambda/(2*m)) * sum(theta(2:size(theta)).^2);


% grad = (X' * (sig - y) ./ m) + theta_reg * lambda / m;
% fprintf('***size(theta):')
% size(theta)
% fprintf('***************#1 size(grad):')
% size(grad)
% grad     = ((1/m) .* ((s-y)' * X))'  + (lambda/(m)) * theta;

grad     = ((1/m) .* (X' * (s-y)))  + (lambda/(m)) * theta;

% fprintf('*************** reg grad:')
% grad


% fprintf('***************#3 size(grad):')
% size(((1/m) .* ((s-y)' * X)))
grad(1)  = ((1/m) .* ((s-y)' * X))(1);
% fprintf('***************#4 size(grad):')
% size(grad)

% fprintf('*************** full grad:')
% grad

% =============================================================

end
