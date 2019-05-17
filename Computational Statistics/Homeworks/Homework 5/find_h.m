function [freedman_diaconis, sturges] = find_h(data, plot_bool)
    % the freedman-diaconis rule is:
    n = length(data); 
    hFD = 2*iqr(data)*n^(-1/3); 
    h = hFD; 

    % get the limits, bins, bin centers etc:
    x_lim_left = min(data)-1; 
    x_lim_rght = max(data)+1;

    t0   = x_lim_left;
    tm   = x_lim_rght; 
    rng  = tm-t0; 
    nbin = ceil(rng/h); 
    bins = t0:h:(nbin*h+t0);       % <- the bin edges ... 
    bc   = bins(1:end-1)+0.5*h;    % <- the bin centers ... 

    vk=histc(data,bins); vk(end)=[];
    fhat = vk/(n*h); % normalize: 

    if plot_bool
        fh=figure; 
        ah1=stairs( bins, [fhat,fhat(end)], '-r' ); grid on; %axis( [x_lim_left, x_lim_rght, 0, +Inf] );
        xlabel('spatial variable'); ylabel('probability distribution'); 
        %title('histogram approximation to the PDF using the freedman-diaconis rule'); 
        %saveas(gcf,'prob_8_7_fd_rule','epsc'); 
    end
    % now use Sturge's rule: 
    % 
    nbin = 1 + log2(n); 
    hS   = rng/nbin;           % <- compute the width depending on the number of bins
    h    = hS; 
    bins = t0:h:(nbin*h+t0);       % <- the bin edges ... 
    bc   = bins(1:end-1)+0.5*h;    % <- the bin centers ... 

    vk=histc(data,bins); vk(end)=[];
    fhat = vk/(n*h); % normalize: 
    if plot_bool
        figure(fh); hold on; 
        ah2=stairs( bins, [fhat,fhat(end)], '-b' ); grid on; %axis( [x_lim_left, x_lim_rght, 0, +Inf] );
        %xlabel('spatial variable'); ylabel('probability distribution'); 
        %title('histogram approximation to the PDF using Sturge''s rule'); 
        %saveas(gcf,'prob_8_7_sturges_rule','epsc'); 
        legend( [ah1,ah2], {'freedman-diaconis rule','sturges rule'}, 'location', 'best' ); 
        %saveas(gcf,'prob_8_7_pdf_hists','epsc'); 
    end

    %fprintf('freedman-diaconis h = %10.5f; sturges h = %10.5f\n',hFD,hS); 
    freedman_diaconis = hFD;
    sturges = hS;