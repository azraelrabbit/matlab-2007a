function loadFromBlock(h)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    h.interGenTime = h.Block.interGenTime;
    h.distribution = h.Block.distribution;
    h.minUnif = h.Block.minUnif;
    h.maxUnif = h.Block.maxUnif;
    h.seed = h.Block.seed;
    h.mean = h.Block.mean;
    h.time = h.Block.time;
    h.sampleTime = h.Block.sampleTime;
    h.offsetTime = h.Block.offsetTime;
    h.trigger = h.Block.trigger;
    h.PriorityEntityGeneration = h.Block.PriorityEntityGeneration;
    h.genFirstEvtOpt = setOnOff(h.Block.genFirstEvtOpt);
    h.blockable = h.Block.blockable;
    h.entityType = h.Block.entityType;
    % 23 24
    h.statCountOpt = h.Block.statCountOpt;
    % 25 26
    h.schedule = h.Block.schedule;
    h.outPortStatus = h.Block.outPortStatus;
    h.avgGenTimeOpt = h.Block.avgGenTimeOpt;
    h.fcnCallOpt = h.Block.fcnCallOpt;
end % function
function boolVal = setOnOff(OnOff)
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    % 36 37
    switch OnOff
    case 'on'
        boolVal = 1.0;
    case 'off'
        boolVal = 0.0;
    end % switch
end % function
