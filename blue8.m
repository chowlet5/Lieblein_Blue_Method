 function [speed, mu, sigma] = blue8(V, M)

% Given a time series of annual wind speed max V of length n years, 
% blue8 estimates extreme wind speeds for mean return intervals MRI = M(i). 
% M(i) does not have to be an integer, but n does. 
% Written by Dat Duthinh 2_6_2017.
% References: 1)Julius Lieblein "Efficient Methods of Extreme-Value
% Methodology" NBSIR 74-602 OCT 1974 for n = 4:16
% 2)Nicholas John Cook "The designer's guide to wind loading of
% building structures" part 1, British Research Establishment 1985 Table C3
% pp. 321-323 for n = 17:24. Extension to n=100 by Adam Pintar Feb 12 2016.
% version 7: calls bluecoeff(n)to obtain [ai,bi].
% version 8: MRI
% V = vector of time series of interest (annual wind speed max) 
% M = vector of MRI
% n = number of years of annual wind speed max data, 4 <= n <= 100
% speed = vector of estimated extreme wind speed with MRI M.
% mu, sigma = location and scale parameters of Gumbel distribution.

n = length(V); % number of years of annual wind speed max
k = length(M); % number of MRI to estimate
[ai,bi]= bluecoeff(n); % read coefficients of BLUE
speed = zeros(1,k);
% Organize values in ascending order
x_max = sort(V);

u = 0; % location parameter
b = 0; % scale parameter
% 
% % Calculates parameter of location and scale
for j = 1:n    
    u = u + ai(j)*x_max(j);
    b = b + bi(j)*x_max(j);
end
mu = u;
sigma = b;
% speed = u-b*log(-log(1-1/M));
for i = 1:k 
    speed(i) = u-b*log(-log(1-1/M(i)));
end



