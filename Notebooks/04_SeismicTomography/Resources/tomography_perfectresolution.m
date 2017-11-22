
clear
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simple example to illustrate linear inversion: acoustic tomography
% Problem similar to the one given in Stein and Wysession p426ff
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Dimension of the quadratic Earth model
n=2;

% True Earth model initialization (slowness)
m=ones(n);
m(3)=2;
l=1;    % side length

s=sqrt(2);

% Plot Earth model
figure
imagesc(m)
xlabel('x')
ylabel('y')
title(' True Earth model ')
colorbar

% Generate true data
% Data are the travel times across the domains according to specific paths

t(1) = l*(m(1) + m(3));
t(2) = l*(m(2) + m(4));
t(3) = l*s*(m(2) + m(3));
t(4) = l*s*(m(1) + m(4));
t(5) = l*(m(1) + m(2));
t(6) = l*(m(3) + m(4));
t=t';
% t now is the data columnn vector

%%%%%%%% End of generating true data %%%%%%%%%%%%%%%%%%%%%%%

% Setting up the inverse problem

% System matrix G


G = l*[ 1 0 1 0;
        0 1 0 1;
        0 s s 0;
        s 0 0 s;
        1 1 0 0;
        0 0 1 1]
  
% reshape m
ii=0;
for i=1:n,
    for j=1:n,
        ii=ii+1;
      s(ii)=m(i,j);
    end
end
      
% Test forward operator
disp(' Forward operator to generate data ')
G*s'
disp(' Explicit calculation of data ')
t

% Attempt to solve the inverse problem

mest = inv(G'*G)*G'*t;

% Plot Earth model
figure
imagesc(reshape(mest,n,n))
xlabel('x')
ylabel('y')
title(' Inverted Earth model ')
colorbar

% Calculation of model resolution matrix

mres= inv(G'*G)*G'*G;

% Plot Earth model
figure
imagesc(mres)
xlabel('x')
ylabel('y')
title(' Model resolution matrix ')
colorbar
