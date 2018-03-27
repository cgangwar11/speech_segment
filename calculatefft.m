function [ spectrogram1 ] = calculatefft( sig,starttime,endtime,windowtime,steptime )
%a=start time ,b=end time,c=window time ,d=step
% d<c  
%all times are in ms


fs=8000;
ts=starttime;  %%starting time
te=endtime*fs/1000;  %%end time
window=windowtime*fs/1000;
step=steptime*fs/1000;
spectre=zeros(window,1000);
traverse=starttime*fs/1000;
i=1;
tic
while traverse<te
    sample=sig(traverse:traverse+window-1);
    temp=abs(fft(sample));
    spectre(:,i)=temp;
    traverse=traverse+step;
    i=i+1;
    
end

spectrogram1=spectre(:,1:i);




end

