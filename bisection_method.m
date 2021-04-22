myfunction = @(x) x.^3+2*x.^2+10*x-20;   %FUNCTION HANDLING
 
x_lower = input('Enter the value of lower bound x_lower: ');
x_upper = input('Enter the value of upper bound x_upper: ');
n = input('What is the absolute error power(n=?) 1.0E-n?');
 
% In any case I checked that no root exist or end_points are roots of the
% myfunction, if so I do not have do any loop iterations
if myfunction(x_lower)*myfunction(x_upper) > 0   
    fprintf('No roots exist within the given interval\n');
    return 
end
 
if myfunction(x_lower) == 0
    fprintf('x_lower is a root of equation\n');
    return 
elseif myfunction(x_upper) == 0
    fprintf('x_upper is a root of equation\n');
    return 
end
 
 
% I calculated my end points on the myfunction
f_lower = myfunction(x_lower);
f_upper = myfunction(x_upper);
 
%%%%%%%%  MAIN LOOP %%%%%%%
 
%% To avoid too many iterations we can set a max. num of iteration %%%
for i = 1:1000 
    
    x_mid = (x_lower+x_upper)/2; % In each iteration we check the mid point
    f_mid = myfunction(x_mid);
    
    if f_lower*f_mid < 0
        x_upper = x_mid;  % x_upper is now the mid point
        f_upper = f_mid;
    else 
        x_lower = x_mid;  % x_lower is now the mid point
        f_lower = f_mid;
    end
    if abs(myfunction(x_mid)) < 1.0*10^-n  % absolute error criteria 
        break
    end
end
 
%%%%%%%% LOOP ENDS %%%%%%%%%
 
fprintf('The root: %f\nThe number of iterations: %d\n', x_lower,i);
roots([1 2 10 -20])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
