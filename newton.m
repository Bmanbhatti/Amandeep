% newton.m
% Purpose of this script is to approximate roots using basic Newton iteration.

tic

clear all

format long

% Define the function whose root is to be approximated
result= input('enter the function(use x as variables) : ', 's');

f=inline(result,'x');%takes the prompt and use as function with respect to x

%f=inline('4*x.^7 - 3*x.^3+ 5*x','x');

% promp for the derivative of the above function

derv = input('enter the derivative of function :','s');
fp=inline(derv,'x');

%fp=inline('28*x.^6+ 9*x.^2 + 5','x');

% Set the number of iterations
N=5

% initialize the vector x=(x_1,x_2,...,x_N)  
%  where we will store the computed values
x=zeros(1,N);

%  prompt for  initial guess 
guess= input('enter your intital guess : ')
x(1,1)= guess;

%x(1,1)=0.5; test guess

% Compute the values n_new=x_old-f/fpdf

for i=1:N-1
  x(1,i+1)=x(1,i)-f(x(1,i))/fp(x(1,i));
  end

x'

toc



