
clear
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simple example to illustrate linear inversion: acoustic tomography
% Problem similar to the one given in Stein and Wysession p426ff
% This version to illustrate the use of SVD
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% Dimension of the quadratic Earth model
n=2;

% True Earth model initialization (slowness)
m=zeros(n);
m(3)=1;
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
% t(5) = l*(m(1) + m(2));
% t(6) = l*(m(3) + m(4));
t=t'
% t now is the data columnn vector

%%%%%%%% End of generating true data %%%%%%%%%%%%%%%%%%%%%%%

% Setting up the inverse problem

% System matrix G


G = l*[ 1 0 1 0;
        0 1 0 1;
        0 s s 0;
        s 0 0 s]
  
% reshape m
ii=0;
for i=1:n,
    for j=1:n,
        ii=ii+1;
      s(ii)=m(ii);
    end
end
      
% Test forward operator
disp(' Forward operator to generate data ')
G*s'
disp(' Explicit calculation of data ')
t

% Attempt to solve the inverse problem

[U,S,V] = svd(G)

% Find the number of non-zero eigenvalues
in=0;
lambda=diag(S);
eps=1e-5;

for i = 1:length(lambda);
    if abs(lambda(i)) > eps, in=in+1; end
end
disp(sprintf(' Found %i non-zero eigenvalues ',in)) 
    
Gp = V(:,1:in)*inv(S(1:in,1:in))*U(:,1:in)';

mest = Gp*t;

% Plot Earth model
figure
imagesc(reshape(mest,n,n))
xlabel('x')
ylabel('y')
title(' Inverted Earth model ')
colorbar

% Calculation of model resolution matrix

mres= V(:,1:in)*V(:,1:in)';

% Plot Earth model
figure
imagesc(mres)
xlabel('x')
ylabel('y')
title(' Model resolution matrix ')
colorbar
