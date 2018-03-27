%%   
clc; clear all;

[sig,fs]=audioread('NDTV_22_12_2015_1.wav');   %READ THE FILE
%%
ts=500*1000;                         %START TIME
te=1000*1000;                        %END TIME
step=100;                             %step time after every loop  
traverse=ts;
coeff=zeros(3,100000);               %storage variable 1st row narrowband distance    
j=1;                                 %second is wideband and 3rd is sample time   
tic;
while traverse<te
    
    nb1=calculatefft(sig,traverse-2000,traverse,20,10);  %calculatefft gives stft matrix for given window and time period
    wb1=calculatefft(sig,traverse-2000,traverse,5,2.5);
    nb2=calculatefft(sig,traverse,traverse+2000,20,10);
    wb2=calculatefft(sig,traverse,traverse+2000,5,2.5);
    k1=kmeans([nb1'; nb2'],6,'emptyaction','drop');      %clustering   
    k2=kmeans([wb1';wb2'],3,'emptyaction','drop');
    [papa,ppap]=size(k1);
    histnb1=k1(1:papa/2);                                %histogram    
    histnb2=k1(papa/2+1:papa );
    [papa,ppap]=size(k2);
    histwb1=k2(1:papa/2);
    histwb2=k2(papa/2+1:papa );
    coeff(1,j)=bhattacharyya(histnb1,histnb2);           %bhattacharya distance    
    coeff(2,j)=bhattacharyya(histwb1,histwb2);
    coeff(3,j)=traverse/1000;
    
    if mod(j,100)==0
        j
    end
    j=j+1;
    
    traverse=traverse+step;
end
toc;
%%
j=j-1;

[a,b,c,d]=outputdo(coeff,j,22,6.0);                     %outputdo thresholding function 
%[coeff(3,a(1:60)) ;coeff(3,a(2:61))]'
%%
plotthis                                                %ploting tools 

%%
%%coeff=coeff(1:3,double(600*27678/2700):double(800*27678/2700));         %uncomment to set the time period of analysis manually and run plotthis to see the output after thresholding
%%j=length(coeff(1,:));

 
    