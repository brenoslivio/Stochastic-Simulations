pkg load statistics

% Considering arrival rate as lambda = 1, service time as mu = 0.5 and servers c = 2:

lambda = 1

mu = 0.5

c = 2

% We have the following transition rate matrix

Q = [-lambda lambda 0 0 0 0 0 0 0 0 ; 

    c*mu -(c*mu + lambda) lambda 0 0 0 0 0 0 0 ; 

    0 c*mu -(c*mu + lambda) lambda 0 0 0 0 0 0 ; 
    
    0 0 c*mu -(c*mu + lambda) lambda 0 0 0 0 0 ; 
          
    0 0 0 c*mu -(c*mu + lambda) lambda 0 0 0 0 ; 
    
    0 0 0 0 c*mu -(c*mu + lambda) lambda 0 0 0 ;

    0 0 0 0 0 c*mu -(c*mu + lambda) lambda 0 0 ; 
    
    0 0 0 0 0 0 c*mu -(c*mu + lambda) lambda 0 ; 
        
    0 0 0 0 0 0 0 c*mu -(c*mu + lambda) lambda; 
    
    0 0 0 0 0 0 0 0 c*mu -(c*mu)];

% We have an initial distribution as follows, considering the queue starts empty
    
pi0 = [1 0 0 0 0 0 0 0 0 0];

% Let's find the moment that the system enters the regime. 
% To do this we can change the number of servers and varying the time 
% to find which time no longer changes the probabilities

tRegime = 80

pit = pi0*expm(Q*tRegime)

% For 1 server, 40 minutes goes into regime; For 2 servers, 
% 80 minutes; For 3 servers, 60 minutes;

for N = 1:1000,

% Simulating until the system goes live for 2 servers, with 80 minutes

t = 0; i = 1; X = 1; 

while t < tRegime,

  T(i) = exprnd(-1/Q(X,X), 1, 1);  % arrival time between i and i-1

  t = t + T(i); % time of i-th arrival

  if X < 10, X = X + 1; 

    else X = 1;

  endif

  i = i + 1;

endwhile

% Let's now calculate the waiting time considering the system in regime

T = 0; 

while X < 10,

  T = T + exprnd(-1/Q(X, X), 1, 1);  % arrival time between i and i-1

  X = X + 1;

endwhile

T = T + exprnd( -1/Q(X, X), 1, 1);


T_waiting(N) = T;

endfor

%  With the 1000 simulations, we find the following waiting value in the system

sum(T_waiting)/1000