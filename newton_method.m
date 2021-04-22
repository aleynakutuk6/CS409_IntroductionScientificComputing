f = @(x)x.^3+2*x.^2+10*x-20;  %equation definition
f_derivative = @(x)3*x.^2+4*x+10;  %first order derivative of f
 
% We use Newton's iteration with a starting value in that range to approximate the root. 
x0 = 1;
Nmax = 10; %maximum number of iterations
n = input('What is the absolute error power(n=?) 1.0E-n?');
x = zeros(Nmax +1,1); %each iteration solution will be shown
x(1) = x0;
 
iter=2;
final_iteration = 1 + Nmax;
 
%%%%% Loop starts 
 
while (iter <= Nmax + 1)  
    fold = f(x(iter -1));
    fnext = f_derivative(x(iter-1));
    x(iter) = x(iter-1) - fold/fnext; %new point is founded
    
    %Absolute error criteria to stop the loop
    if (abs(fe) <= 1.0*10.^-n)  
        final_iteration = iter;
        disp('The root is: ')
        disp(x)
        break;
    end
    iter = iter + 1;
end
 
%%%%%%%%%%%%%%%%%%%%%%%%
