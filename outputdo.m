function [ narrow,wide,timenib,timewib] = outputdo( coeff,j,N,pha )

   narrow=[];
   wide=[];
   thresnb=0.6;
   threshwb=0.6;
   timenib=[0.6 0.6];
   timewib=[0.6 0.6];
    for k= 3:j-1
        thresnb;
        if k>N+1
            thresnb=pha*mean(coeff(1,k-N:k));
            threshwb=pha*mean(coeff(2,k-N:k));
        end
        timenib=[timenib thresnb];
        timewib=[timewib threshwb];
            
        if coeff(1,k)>coeff(1,k-1) && coeff(1,k)>coeff(1,k+1) && coeff(1,k)>thresnb
            narrow=[narrow,k];
        end
            
        if coeff(2,k)>coeff(2,k-1) && coeff(2,k)>coeff(2,k+1) && coeff(2,k)>threshwb
            wide=[wide,k];

        end
    end
    
    

end

