for n=[50, 100, 200];
    % Get several values for the mean under the alternative
    mualt = 40:60;
    % Note the critical value:
    cv = 1.645;
    % Note the standard deviation for x-bar:
    sig = 15/sqrt(n);
    % It's easier to use the unstandardized version, 
    % so convert:
    ct = cv*sig + 45;

    % Get a vector of ct values that is 
    % the same size as mualt.
    ctv = ct*ones(size(mualt));
    % Now get the probabilities to the left of this value.
    % These are the probabilities of the Type II error.
    beta = normcdf(ctv,mualt,sig);

    % To get the power: 1-beta
    pow = 1 - beta;

    % Plot both Power and Type II error
    figure;
    plot(mualt,pow,'*-',mualt,beta,'ro-')
    xlabel('True Mean \mu')
    legend('Power','TypeII error')
    title(sprintf('For n = %d\n',n));
end
