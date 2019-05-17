function [] = mc_erros(sample_size, m_trials, bandwidths)
    average_absolute_error = 0; 
    for hi=1:length(bandwidths)
      %h = 0.1;         % <- an example bin width 
      h = bandwidths(hi); 
      % specify the bin widths: 
      xLimitLeft = -4;
      xLimitRight = +4;
      t0   = xLimitLeft;
      tm   = xLimitRight; 
      range  = tm-t0; 
      nbin = ceil(range/h); 
      bins = t0:h:(nbin*h+t0);       % <- the bin edges 
      bc  = bins(1:end-1)+0.5*h;     % <- the bin centers  
      % save each monte-carlo trial estimate of the probability distribution:
      all_fhats = zeros(m_trials,length(bins)-1); 
      % save each monte-carlo trial estimate of the mean square error (we evaluate the MSE on a grid):  
      xMSE = linspace(xLimitLeft,xLimitRight,100); 
      all_mse = zeros(m_trials,length(xMSE));
      for mci=1:m_trials
        x = randn(1,sample_size); 
        x(find(x < xLimitLeft)) = xLimitLeft;
        x(find(x > xLimitRight)) = xLimitRight;
        vk=histc(x,bins); 
        vk(end)=[];
        % normalize 
        fhat = vk/(sample_size*h);
        all_fhats(mci,:) = fhat; 
        % record the MSE of this approximate PDF    
        fhat_interp = interp1(bc,fhat,xMSE); 
        if( ~average_absolute_error )
          all_mse(mci,:) = (fhat_interp-normpdf(xMSE,0,1)).^2;
        else
          all_mse(mci,:) = abs(fhat_interp-normpdf(xMSE,0,1));
        end
      end

      % plot the last PDF estimate produced above
      if( 0 ) 
        fh = figure; 
        plot( bc, normpdf(bc,0,1), '-go' ); 
        hold on; 
        stairs( bins, [fhat,fhat(end)], '-r' );
        axis( [x_lim_left,x_lim_rght,0,0.45] ); 
        title( 'the last Monte-Carlo PDF estimate' ); 
      end

      % plot the mean PDF estimate and one standard deviation confidence intervals: 
      if( 1 )  
        mfh = mean(all_fhats); 
        sfh = std(all_fhats); 
        fh = figure; 
        plot( xMSE, normpdf( xMSE, 0, 1 ), '-go' ); 
        hold on; 
        stairs( bins, [mfh,mfh(end)], '-r' ); 
        tmp = max(mfh-sfh,0); stairs( bins, [tmp,tmp(end)], '-k' ); tmp=mfh+sfh; stairs( bins, [tmp,tmp(end)], '-k' ); grid on; 
        axis( [xLimitLeft,xLimitRight,0,1.0] ); 
        title( 'histogram estimate of the PDF with confidence intervals' ); 
      end

      % plot the expected MSE over all of these monte-carlo's:
      if( 1 ) 
        figure; plot( xMSE, mean(all_mse), '-r' ); grid on; 
        xlabel( 'x' ); ylabel( 'MSE value' ); 
        title( sprintf('mean MSE for h=%e; with %d MC trials',h,m_trials) ); 
        axis( [xLimitLeft,xLimitRight,0,0.1] );  
      end
    end
