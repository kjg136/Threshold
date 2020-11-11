function durations=EventDurations(start,stop)

if size(start,1)>size(stop,1)
    durations=stop(:,1)-start(1:end-1,1);
elseif size(stop,1)>size(start,1)
    durations=stop(2:end)-start(:,1);
else
    durations=stop(:,1)-start(:,1);
end