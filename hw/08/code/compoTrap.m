function [ C, f_evals ] = compoTrap( funct,a,b, tol )
%COMPOTRAP Summary of this function goes here
%   Detailed explanation goes here

% use theorem 4.5 to decide the value of h. since the error scales as h^2.
% note that this gives an estimate for the value of h given the desired
% tolerance using only the scaling of the error
hh = (12*tol/(b-a))^(1/2);
nn=ceil((b-a)/hh);
hh=(b-a)/nn;

% num_points = nn+1;

x_vals = [a:hh:b];
funct_vals = funct(x_vals);

C = trapz(x_vals,funct_vals);
f_evals = size(funct_vals,2);

end

