% Based on a rising or fallign edge trigger, cut the signals out of a
% vector
function signalSets = cutSignal( signal, command, triggerType )
% Cuts the signals based on commandvec
[rows, cols] = size(command);

if(rows == 1)
    trigger = [0, diff(command)];
elseif (cols == 1)
    trigger = [0;diff(command)];
end

rising = find(trigger == 1);
falling = find(trigger == -1);
nrise = length(rising);
nfall = length(falling);


if( strcmp(triggerType,'rising') )
    
    for i=1:nfall
        signalSets{i} = signal(rising(i):falling(i));
    end
    
elseif( strcmp(triggerType,'falling'))
    for i=1:nrise
        signalSets{i}= signal(falling(i):falling(i)); 
    end
else
    sprintf('Error: Edge not specifified correctly')
    return;
end



end