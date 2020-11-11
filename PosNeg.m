function PN=PosNeg(t,start,stop,PH)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Input
% t:     Time 
% start: Time and dipole strength at start of each event
% stop:  Time and dipole strength at end of each event
% PH:    Prediction horizon (in given time units)
%
%      Output
% PN is of the same length as t. An entry of 0 indicates no event occurs
% within the prediction horizon (PH), 1 if it does. A 2 indicates and event
% is occuring and no prediction should be made.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

PN=zeros(size(t));

if start(:,1)==t(1)
    OnWatch=0;
else
    OnWatch=1;
end

Event=1;
for ii=1:size(t,1)
    if t(end)-t(ii)<PH
        PN(ii:end)=2;
        break
    elseif OnWatch==0
        if Event>size(stop,1)
                break
        elseif t(ii)>=stop(Event,1)
            Event=Event+1;
            if Event>size(start,1)
                break
            elseif start(Event,1)-t(ii)<=PH
                PN(ii)=1;
                OnWatch=1;
            else
                PN(ii)=0;
                OnWatch=1;
            end
        else
            PN(ii)=2;
        end
    else        
        if t(ii)==start(Event,1)
            PN(ii)=2;
            OnWatch=0;
        elseif start(Event,1)-t(ii)<=PH
            PN(ii)=1;
        end
    end
end
            
            
            
        
        
        
    
