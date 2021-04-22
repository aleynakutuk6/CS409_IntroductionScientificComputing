myfunction = @(x) x.^3+2*x.^2+10*x-20;  %FUNCTION HANDLING
 
%I took interval boundaries and the absolute error as an input so that I
%can try for different values easily
 
x_lower = input('Enter the value of lower bound x_lower: ');
x_upper = input('Enter the value of upper bound x_upper: ');
n = input('What is the absolute error power(n=?) 1.0E-n?');
 
% I calculated my end_points on my function
f_lower = myfunction(x_lower);
f_upper = myfunction(x_upper);
x0 = x_lower;
iter = 0; % I count the num of iterations
 
%I would like to see myfunction visual on that interval so that I can come
%up with an prediction on my root
s = linspace(x_lower,x_upper,100);
f = myfunction(s);
fig = figure();
plot(s,f)
 
%Loop starts here and it continues until the absolute error criteria
%becomes less than the tolerance
 
while true
   xr = x_upper-f_upper*(x_upper - x_upper)/(f_upper-f_lower);
   fr = myfunction(xr);
   iter = iter + 1;
   
   if sign(fr) == sign(f_lower)  %I checked signs so that I can update my boundaries accordingly
       x_lower = xr;
       f_lower = fr;
   else 
       x_upper = xr;
       f_upper = fr;
   end
if (abs((xr-x0)/xr) < 1.0*10^-n)  %I checked the absolute error here
    break;
else
    x0 = xr;
end
end
 
fprintf('The root: %f\nThe number of iterations: %d\n', xr, iter);
 
roots([1 2 10 -20])  %I just wanted to check whether my method is close enough for prediction of the root

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
