function [T W H]= RungeFehl(f,tspan,y0, TOL, hmax, hmin)
%N = floor((tspan(2) - tspan(1))/hmin);

%T=linspace(tspan(1),tspan(2),N);

T = tspan(1);
b = tspan(2);

%W = zeros(numel(y0),N);
W=y0;
%i=2;

H =hmax;
FLAG = 1;

fprintf('T =  %d\n', T);
fprintf('W =  %d\n', W);

while(FLAG == 1)
    K1 = H*f(T, W );
    K2 = H*f(T + (1/4)*H, W+ (1/4)*K1);
    K3 = H*f(T + (3/8)*H,  W + (3/32)*K1 + (9/32)*K2);
    K4 = H*f(T + (12/13)*H,  W + (1932/2197)*K1 - (7200/2197)*K2 + (7296/2197)*K3);
    K5 = H*f(T + H,  W + (439/216)*K1 - (8)*K2 + (3680/513)*K3 - (845/4104)*K4);
    K6 = H*f(T + (1/2)*H,  W - (8/27)*K1 + (2)*K2 - (3544/2565)*K3 + (1859/4104)*K4 - (11/40)*K5);

    R = (1/H)*abs((1/36)*K1 - (128/4275)*K3 - (2197/75240)*K4 + (1/50)*K5 + (2/55)*K6);
   
    if(R <= TOL)
        T = T + H;
        W =  W + (25/216)*K1 + (1408/2565)*K3 + (2197/4104)*K4 - (1/5)*K5;
        fprintf('T =  %d\n', T);
        fprintf('W =  %d\n', W);
        fprintf('H =  %d\n', H);
    end
    
    delta = 0.84*(TOL/R)^(1/4);
    
    if(delta <= 0.1) H = 0.1*H;
        
    elseif(delta >= 4) H = 4*H;
            
        else H = delta*H;
       
      
    
    if(H > hmax) H = hmax; end
        
        
    if(T >= b) FLAG = 0; 
        
        
    elseif(T + H > b) H = b - T;
                
                
    elseif(H < hmin) FLAG = 0;
                    
                    
                fprintf('minimum h exceeded'); %Procedure not succesful
                
               
                
                
    end
    end
end
   


end
