function [normal, epan, x] = kernel(data, size_sample, plot_bool)
    % ******* Using Normal Kernel ********
    n = length(data);
    x = linspace(min(data),max(data),size_sample);
    fhat_normal = zeros(size(x));
    h_normal = 1.06*n^(-1/5)*std(data);

    % Using normal kernel function evaluated at centered at data
    for i=1:n
        fnorm = exp(-(1/(2*h_normal^2))*(x-data(i)).^2)/sqrt(2*pi)/h_normal;
        fhat_normal = fhat_normal+fnorm/(n);
    end

    % ******* Using Epanechnikov Kernel ********

    h_epan = h_normal*(30*sqrt(pi))^(1/5);
    fhatepan = zeros(size(x));
    fepan=zeros(1,n);


    for i=1:n
        domain=((x-data(i))/h_epan);
        for j=1:length(domain)

            if abs(domain(j))<=1
                fepan(j)=3*(1-((x(j)-data(i))/h_epan).^2)/(4*h_epan);
            else
                fepan(j)=0;
            end

        end
        fhatepan=fhatepan+fepan/(n);
    end

    if plot_bool
        hold on
        plot(x,fhatepan,x,fhat_normal);
        legend('Epan','Normal')
        title('Kernel Density Estimate with Exponential Distribution')
        hold off
    end
    
    normal = fhat_normal;
    epan = fhatepan;
    