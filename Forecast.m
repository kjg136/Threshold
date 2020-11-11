function Prediction=Forecast(t,d,WT,PN)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Input
% t : Time in kyr
% d : Dipole
% WT: Warning threshold (as % of mean dipole magnitude)
%
%      Output
% Prediction is 1 when an event is predicted and zero otherwise
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Prediction=zeros(size(t));

for ii=1:length(t)
    if PN(ii)~=2
        if abs(d(ii))<=WT
          Prediction(ii)=1;
        end
    end
end
        