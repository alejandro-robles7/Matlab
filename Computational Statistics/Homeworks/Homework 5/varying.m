%
% epage 325
% 
% Written by:
% -- 
% John L. Weatherwax                2008-02-20
% 
% email: wax@alum.mit.edu
% 
% Please send comments and especially bug reports to the
% above email address.
% 
%-----

clear all; 
close all; 
clc; 

%load snowfall; x=snowfall; n=length(x); 

n = 1000;
x = normrnd(0,1,1,n);
snowfall = x;

% do a quick study to determine an array of reasonable bin widths: 
ss  = sort(snowfall); 
ssd = sort(diff(ss)); 
% visually inspecting the above array "ssd" we have the smallest bin width of ~ 0.1 

%hArray = 0.1:0.1:6; maxHeight=-Inf; 
hArray = 1:1:200; maxHeight=-Inf; 
fh=figure; set(gca,'nextplot','replacechildren'); 
for hi=1:length(hArray),
  % specify the bin width from our several choices: 
  h = hArray(hi); 

  % create a histogram with the width "h":
  % 
  % get the limits, bins, bin centers etc:
  x_lim_left = min(x)-1; 
  x_lim_rght = max(x)+1;
  t0   = x_lim_left;
  tm   = x_lim_rght; 
  rng  = tm-t0; 
  nbin = ceil(rng/h); 
  bins = t0:h:(nbin*h+t0);       % <- the bin edges ... 
  bc   = bins(1:end-1)+0.5*h;    % <- the bin centers ... 

  x(find(x<x_lim_left))=x_lim_left;
  x(find(x>x_lim_rght))=x_lim_rght;
  vk=histc(x,bins); vk(end)=[];
  % normalize: 
  fhat = vk/(n*h);

  figure(fh); stairs( bins, [fhat,fhat(end)], '-r' ); grid on; 
  xlabel( '' ); 
  %axis( [x_lim_left, x_lim_rght, 0, +Inf] );
  axis( [x_lim_left, x_lim_rght, 0, 0.05 ] ); % <- this max y height makes a nice plot 
  title( ['h value = ',num2str(h)] ); 
  F(hi) = getframe; 
  
  if( max(fhat)>maxHeight ), maxHeight=max(fhat); end
end
movie(F,1,1); 

fprintf('the maximum height we saw was = %10.5f\n', maxHeight); % <- gives ~ 0.4 

% compute h based on sturges' rule: 
nbins = 1 + log2(n); 
hS = (x_lim_rght-x_lim_left)/nbins; 
fprintf( 'h from Sturges = %10.5f\n', hS ); 
% compute h based on freedman-diaconis rule: 
hFD = 2*iqr(x)*n^(-1/3); 
fprintf( 'h from the Freedman-Diaconis rule = %10.5f\n', hFD ); 