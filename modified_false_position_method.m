myfunction = @(x) x.^3+2*x.^2+10*x-20;  %FUNCTION HANDLING
 
 %To make the changes easier I will took interval and the power of the absolute error as an input: 
 
x_lower = input('Enter the value of lower bound x_lower: ');
x_upper = input('Enter the value of upper bound x_upper: ');
n = input('What is the absolute error power(n=?) 1.0E-n?');
 
%I calculated the end points on the function.
f_lower = myfunction(x_lower);
f_upper = myfunction(x_upper);
x0= x_lower;
iter = 0;  % I counted the num of iterations 
Nmax = 30;
%Loop starts 
while iter < Nmax
   xr = (f_upper*x_lower - f_lower*x_upper)/(f_upper-f_lower);
   fr = myfunction(xr);
   f0 = myfunction(x0);
   iter = iter + 1;
   
   if sign(fr) == sign(f0) %if both negative or positive
       x_upper = xr;
       f_upper = fr;
       f_lower = f_lower /2; 
   else 
       x_lower = xr;
       f_lower = fr;
       f_upper = f_upper / 2;
   end
disp([x_lower x_upper fr f0])  %I just checked the values 
 
%Absolute error criteria is checked to finish the loop
if (abs((xr-x0)/xr) < 1.0*10^-n) || (fr == f0)  %I checked the absolute error here
    break;
else
    x0 = xr; %to keep the previous iteration
end
end
 
fprintf('The root: %f\nThe number of iterations:%d\n', xr, iter);
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
