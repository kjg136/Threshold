function [DecayTimes,DecayStart]=GetDecayTimes(start,stop,t,d,RT)

[~,tidx]=min(abs(t-start(1,1)));
if sum((abs(d(1:tidx-1))>RT))==0
    N=1;
else
    N=0;
end
    
DecayTimes=zeros(length(start)-N,1);


for ii=1:length(start)-N
    [~,tidx]=min(abs(t-start(ii+N,1)));
    ttemp=tidx-1;
    while abs(d(ttemp))<RT
        ttemp=ttemp-1;
    end
    DecayTimes(ii)=t(tidx)-t(ttemp);
    DecayStart(ii,:)=[t(ttemp),d(ttemp)];
end