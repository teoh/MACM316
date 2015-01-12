%{
MACM 316 Assignment 8
Name: Mathew Teoh
Student #: 301165239
Email: mteoh@sfu.ca
Date: Nov 7th 2014
%}

% err_tols = [0.01:-0.0001:0.001];
err_tols = [10^-2 10^-3 10^-4 10^-5 10^-6 10^-7 10^-8 10^-9 10^-10 ...
    10^-11 10^-12 10^-13 10^-14];
num_errs = size(err_tols,2);

% for each value in the err_tols, compute the integral of the lift using
% composite trapezoidal, composite simpsons, quad, and quadl

% my airfoil takes in arguments mu = 0.1+0.1*1i, and alpha=pi/6
mu=0.1+0.1*1i;alpha=pi/6;
wingPlot(mu,alpha);

% we'll use this for the integration 
lift_integrand = @(t) lift(t,mu,alpha);

funct_evals = zeros(4,num_errs);

for ii = 1:num_errs
    tol = err_tols(ii);
    display(['Computing for tolerance = ' num2str(tol)]);
%     do for trap
    display('Composite Trapezoid:');
    [ct, ct_n_evals] = compoTrap(lift_integrand,0,2*pi,tol)
    funct_evals(1,ii) = ct_n_evals;

%     do for simpson
    display('Composite Simpson:');
    [cs, cs_n_evals] = compoSimp(lift_integrand,0,2*pi,tol)
    funct_evals(2,ii) = cs_n_evals;

%     do for quad
    display('quad:');
    [q, q_n_evals] = quad(lift_integrand,0,2*pi,tol)
    funct_evals(3,ii) = q_n_evals;

%     do for quadl
    display('quadl:');
    [ql, ql_n_evals] = quadl(lift_integrand,0,2*pi,tol)
    funct_evals(4,ii) = ql_n_evals;
    
end

%% plotting

figure(1);
hold on
plot(log10(err_tols),log10(funct_evals(1,:)), 'bo')
plot(log10(err_tols),log10(funct_evals(2,:)), 'go')
plot(log10(err_tols),log10(funct_evals(3,:)), 'ro')
plot(log10(err_tols),log10(funct_evals(4,:)), 'ko')
title('Plot of log10 of number of function evaluations vs required tolerance');
xlabel('log10 of required tolerance');
ylabel('log10 of number of function evaluations')
legend('Composite Trapezoid','Composite Simpson','Quad','Quadl');

