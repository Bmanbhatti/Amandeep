


% rules.m
% Purpose of this script is to approximate value if integrals usings various rules

tic

clear all

format long

fun= input('Enter the function: ','s');
f=inline(fun,'x');%takes the prompt and use as function with respect to x
down= input('Enter the lower limit: ');
up= input('Enter the upper limit: ');

% ask user for the number of steps included
% Set the number of iterations
N = input('enter the value of n :');


% initialize the vector x=(x_1,x_2,...,x_N)  
%  where we will store the computed values
x=zeros(1,N);

dalx=(up-down)/N;
cpdown=down;

for i=1:(N)
  x(1,i)=down;
  down=down+dalx;
  x(2,i)=down;
  i=i+1;
end
fprintf("SubIntervals are....\n");
x'

fprintf("MidPoint Rule Starts here....\n");
fprintf("The Midpoints are....\n");


mid=zeros(1,N);

sm=0;
for i=1:N
  midd=(x(1,i)+x(2,i))/2;
  mid(1,i)=midd;
  sm=sm+(f(midd));
  i=i+1;
end
%mid'
aprroxmid=dalx*sm;
fprintf("The approximation is.... %i \n",aprroxmid);

fprintf("Trapoziod Rule Starts here....\n");
fprintf("The Points are are....\n");


tra=zeros(1,N);

smt=0;
for i=1:N+1
  
  %tra(1,i)=x(1,i);
  tra(1,i)=cpdown;
  cpdown=cpdown+dalx;
 
  smt=smt+(f(tra(1,i)));
  %smt=smt+(f(tra(1,i)));
   i=i+1;
   
  
   
end
tra'
aprroxtra=(dalx/2)*smt;
fprintf("The approximation is.... %i \n",aprroxtra);



fprintf("Simpsons Rule Starts here....\n");
fprintf("The Points are are....\n");


%tra'
aprroxtra=(dalx/3)*smt;
fprintf("The approximation is.... %i \n",aprroxtra);
toc
