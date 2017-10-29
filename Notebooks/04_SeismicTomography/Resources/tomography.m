
clear
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simple example to illustrate linear inversion: acoustic tomography
% Problem similar to the one given in Aster et al., Parameter estimation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Dimension of the quadratic Earth model
n=3;

% True Earth model initialization (slowness)
m=ones(n);
m(5)=1.3;

% Plot Earth model
figure
imagesc(m)
xlabel('x')
ylabel('y')
title(' Earth model ')
colorbar

% Generate true data
% Data are the travel times across the domains according to specific paths

% Vertical paths
l=1;
for i=1:n,
    t(i)=l*(sum([m(i) m(i+3) m(i+6) ]));
end

% Horizontal paths
l=1;
for i=1:n,
    t(i+3)=l*(sum([m((i-1)*n+1) m((i-1)*n+2) m((i-1)*n+3) ]));
end

% Diagonal paths
l2=sqrt(2)*l;
t(7)=l2*(m(1)+m(5)+m(9));
t(8)=l2*m(9);

% t now is the data vector
%%%%%%%% End of generating true data %%%%%%%%%%%%%%%%%%%%%%%

% Setting up the inverse problem

% System matrix G
s=sqrt(2);

G = [ 1 0 0 1 0 0 1 0 0;
      0 1 0 0 1 0 0 1 0;
      0 0 1 0 0 1 0 0 1;
      1 1 1 0 0 0 0 0 0;
      0 0 0 1 1 1 0 0 0;
      0 0 0 0 0 0 1 1 1;
      s 0 0 0 s 0 0 0 s;
      0 0 0 0 0 0 0 0 s];
  
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
t'

% Attempt to solve the inverse problem

mest = inv(G'*G)*G'*t';


% Plot Earth model
figure
imagesc(reshape(mest)
xlabel('x')
ylabel('y')
title(' Earth model estimated')
colorbar
