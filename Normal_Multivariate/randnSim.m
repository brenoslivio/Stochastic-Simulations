pkg load statistics

% Let's start by graphically simulating what happens in a 100-stroke match; 
% then let's simulate it for 1000 such matches.

% The hole forming a polygon that we will represent graphically
xv = [78 79.5 110 108 78];
yv = [73 62 109 122 73];

% Equal mean for both

mu = [100 100];

% First plot
figure(1);

Sigma = [125 150; 150 425]; % Covariance matrix

% 100 random points following the random multivariate distribution
R = chol(Sigma);

% repmat will create copies of mu to sum with the array 
% formed by multiplying randn with Sigma factored by chol

z = repmat(mu, 100, 1) + randn(100, 2)*R;

x = z(:,1);
y = z(:,2);

[in,on] = inpolygon(x, y, xv, yv); % This fuction returns if the points are in the polygon
% created by the hole
inside = in & ! on;

% Let's plot all the balls from the strokes with the hole
plot (xv, yv);
hold on;
plot (x(inside), y(inside), "obk");
plot (x(!in), y(!in), "om");
plot (x(on), y(on), "ob");
hold off;

pointsNoUpgrade = length(x(inside));
profit = pointsNoUpgrade*2;

title(["100-Stroke Match, without upgrade; ", num2str(pointsNoUpgrade),' balls in the hole; ', 'Profit: $', num2str(profit)]);
legend("Hole", "Balls in", "Balls out");

print -djpg WithoutUpgrade.jpg

% Second plot for when we have the upgrade, with a different covariance matrix
figure(2)

Sigma = [200 300; 300 500];

R = chol(Sigma);
z = repmat(mu, 100, 1) + randn(100, 2)*R;

x = z(:,1);
y = z(:,2);

[in,on] = inpolygon(x, y, xv, yv);
inside = in & ! on;

plot (xv, yv);
hold on;
plot (x(inside), y(inside), "obk");
plot (x(! in), y(! in), "om");
plot (x(on), y(on), "ob");
hold off;

pointsUpgrade = length(x(inside));
profit = pointsUpgrade*2;

title(["100-Stroke Match, with the upgrade; ", num2str(pointsUpgrade),' balls in the hole; ', 'Profit: $', num2str(profit)]);
legend("Hole", "Balls in", "Balls out");

print -djpg WithUpgrade.jpg

% Let's make a thousand simulations for each to see the average 
% profit considering that we earn $ 2.00 for each ball that falls into the hole

xv = [78 79.5 110 108 78];
yv = [73 62 109 122 73];

mu = [100 100];

% 1 - Simulations without the upgrade

Sigma = [125 150; 150 425];

totalProfit = 0;

% Repeat 1000 times
for i = 1:1000, 
  
R = chol(Sigma);
z = repmat(mu, 100, 1) + randn(100, 2)*R;

x = z(:,1);
y = z(:,2);
  
[in,on] = inpolygon(x, y, xv, yv);
inside = in & ! on;

pointsNoUpgrade = length(x(inside));

totalProfit += pointsNoUpgrade*2;

end; 

% We get the expected profit
expProfitNoUpgrade = totalProfit/1000

% 2 - Simulations with the upgrade

Sigma = [200 300; 300 500];

totalProfit = 0;

% Repeat 1000 times
for i = 1:1000, 
  
R = chol(Sigma);
z = repmat(mu, 100, 1) + randn(100, 2)*R;

x = z(:,1);
y = z(:,2);
  
[in,on] = inpolygon(x, y, xv, yv);
inside = in & ! on;

pointsUpgrade = length(x(inside));

totalProfit += pointsUpgrade*2;

end; 

% Expected profit with the upgrade
expProfitUpgrade = totalProfit/1000