syms x;
myfunction = input('Enter the function in terms of x:'); %function is taken by the user
 
n = input('What is the absolute error power(n=?) 1.0E-n?');
 
%%Inline is used to be able to find roots of the any entered equation in terms of x  
f = inline(myfunction);  % basically myfunction is any function to be analysed in Secand Method
 
%three approximation for muller method
x1 = input('What is the first initial guess x1?');
x2 = input('What is the second initial guess x2?');
x3 = input('What is the third initial guess x3?');
 
%evaluates each point on the function: f(x1), f(x2), f(x3)
y1 = f(x1);
y2 = f(x2);
y3 = f(x3);
delta0 = (y2-y1)/(x2-x1);
 
%Loop starts
 
while ( true )
   delta1=(y3-y2)/(x3-x2);
    a= (delta1-delta0)/(x3-x1);
    b=delta1 + (x3-x2)*a;
    c=f(x3);
    x4=x3-2*c/(b+sign(b)*sqrt(b*b-4.0*a*c));   %-2c/b(+or-)root of(b^2-4ac) formula
    y4=f(x4);
   
     if ( abs( x4 - x3 ) < 1.0*10.^-n  || abs( y4 ) < 1.0*10.^-n  )  %absolute error criteria to break loop
        break;
     end
     x1=x2;
     x2=x3;
     x3=x4;
     y1=y2;
     y2=y3;
     y3=y4;
     delta0=delta1;
end
 
disp('            X1                   X2                X3                      Y4');
disp([x1 x2 x3 y4])
 
%%%%%%%%%%%%%%%%%%%%%%

