figure(1)
subplot(3,1,1);                                                          %plot input signal

oytsig=sig(coeff(3,1)*8000:coeff(3,j-1)*8000);
[len,wid]=size(oytsig);
xaxis=linspace(coeff(3,1),coeff(3,j-1),len);

plot(xaxis,oytsig,'g')
hold on
%apk=coeff(3,a(:))

%%
vline(coeff(3,a(:)),'r');                                                 %plot calculated narrowband distances           
vline(coeff(3,b(:)),'r');                                                 %plot calculated wideband distances 
%vline(markings(:,1),'b');                                             %uncomment to plot real marking points 

%%
subplot(3,1,2);
                                                                          %plot narrowband distances   
plot(coeff(3,1:j-1),coeff(1,1:j-1))                                        
hold on
plot(coeff(3,1:j-1),c(1,1:j-1),'r--');                                    %plot threshold output for nb 
title('narrowband distance')
subplot(3,1,3);

plot(coeff(3,1:j-1),coeff(2,1:j-1),'g')                                   %plot wideband distances   
hold on
plot(coeff(3,1:j-1),d(1,1:j-1))                                           %plot threshold ouput for wb          
title('wideband distance')
