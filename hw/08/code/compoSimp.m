function [ C, f_evals ] = compoSimp( funct, a, b, tol )
%COMPOSIMP Summary of this function goes here
%   Detailed explanation goes here

% decide on the size of the h value. since the error in composite simpsons
% rule scales as h^4, we can estimate the size of h using theorem 4.4.
% knowing the appropriate h value tell us the number of points we need to
% split our interval into 
hh=((1/(b-a))*tol)^(1/4);
%after this nn is the number of intervals
nn=ceil((b-a)/hh);
hh=(b-a)/nn;

num_points = nn+1;

% this code was inspired by dr. murakis simpdemo.m
% get simpsons coefficients
altSign = 1:num_points;
coeffs = ones(1,num_points)+(1/3)*(-1).^(altSign);
coeffs(1)=1/3; coeffs(end)=1/3;

% integrate by summing everything up
x_vals = [a:hh:b];
funct_vals= funct(x_vals);
C=sum(funct_vals.*coeffs)*hh;

% return number of function evaluations
f_evals=size(funct_vals,2);


end

