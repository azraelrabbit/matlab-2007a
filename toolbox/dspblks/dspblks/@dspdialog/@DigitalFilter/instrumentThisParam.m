function doThisOne = instrumentThisParam(this, SignalName, ParamName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    doThisOne = false;
    % 8 10
    switch SignalName
    case 'Accumulator'
        if any(strcmp(ParamName, {'accumMode','accumWordLength'}))
            doThisOne = true;
        end % if
    case 'Product output'
        if any(strcmp(ParamName, {'prodOutputMode','prodOutputWordLength'}))
            doThisOne = true;
        end % if
    case 'Output'
        if any(strcmp(ParamName, {'outputMode','outputWordLength'}))
            doThisOne = true;
        end % if
    case {'State','Input state','Output state'}
        if any(strcmp(ParamName, {'memoryMode','memoryWordLength'}))
            doThisOne = true;
        end % if
    case 'Tap sum'
        if any(strcmp(ParamName, {'tapSumMode','tapSumWordLength'}))
            doThisOne = true;
        end % if
    case 'Multiplicand'
        if any(strcmp(ParamName, {'multiplicandMode','multiplicandWordLength'}))
            doThisOne = true;
        end % if
    case {'Section input','Section output'}
        if any(strcmp(ParamName, {'stageIOMode','stageIOWordLength'}))
            doThisOne = true;
        end % if
    end % switch
