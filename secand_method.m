syms x;
myfunction = input('Enter the function in terms of x:'); %function is taken by the user
 
 %To make the changes easier I will took interval and the power of the absolute error as an  
x_lower = input('Enter the value of lower bound x_lower: ');
x_upper = input('Enter the value of upper bound x_upper: ');
n = input('What is the absolute error power(n=?) 1.0E-n?');
 
%%Inline is used to be able to find roots of the any entered equation in terms of x  
f = inline(myfunction);  % basically myfunction is any function to be analysed in Secand Method
 
iter = 0; % I initialized the iteration as 0, to be able to count the num of iterations
xr = (x_lower*f(x_upper)-x_upper*f(x_lower))/(f(x_upper)-f(x_lower));
 
disp([x_lower f(x_lower) x_upper f(x_upper) xr f(xr)]);
 
%%%%% Loop starts 
 
while abs(f(xr)) > 1.0*10.^-n  %Absolute error criteria to stop the loop
    
    iter = iter + 1;
    x_upper = x_lower;
    x_lower = xr;
    xr = (x_lower*f(x_upper)-x_upper*f(x_lower))/(f(x_upper)-f(x_lower));
    
    % In each iteration I display to see how values changes
    disp('         Xn-1             f(Xn-1)               Xn               f(Xn)                Xn+1              f(Xn+1)');
    disp([x_lower f(x_lower) x_upper f(x_upper) xr f(xr)]);
end
 
display(['Root is x=' num2str(xr)]);
 
%%%%%%%%%%%%%%%%%%%%%%%%
