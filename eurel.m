% euler.m
% 
% Purpose of this script is to use basic euler method to approximate 
% solutions of first order odes, y'=F(y,t).
% It's good practice to set a timer for your program.
tic

clear all


% Define the function F
fun= input('Enter the function: ','s');

inp=input('what is dependent variable : ','s');
inp2=input('what is independent variable : ','s');
F=inline(fun,inp,inp2);%takes the prompt and use as function with respect to x



%  Set the number of values to compute

N=1500


% Set the width of each subinterval
dt=.001;

% Initialize the vector t=(t_1,t_2,...,t_N) of independent variables
% and the vector y=(y_1,y_2,...,y_n) 
%  where we will store the computed values

t=zeros(1,N);
y=zeros(1,N);

% Set our initial condition, y(t_1)=y_1
t(1)=input('what is intital value of t: ');
y(1)=input('Enter the intial value of y: ');

% Compute the values y_(i+1)=y_i+dt*F(y_i,t_i)

for i=1:N-1
  y(i+1)=y(i)+dt*F(y(i),t(i));
  t(i+1)=t(i)+dt;
  end
 
 
%plot the exact solution versus approximated solution 

t1= 0:dt:t(N);
%yexact is going to be the acutal solution of the problem make sure to take care of your vectors.

yexact= input('Enter the function(calulated by hand in for of t1): ');

%example entery exp(-t1).*(19*t1-1)/361+0.0027*exp(-20*t1)-70;
plot(t1,yexact)


hold on

plot(t,y,'o')

toc