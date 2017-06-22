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
    case 'Input-squared product'
        if any(strcmp(ParamName, {'prodOutputMode','prodOutputWordLength'}))
            doThisOne = true;
        end % if
    case 'Input-sum-squared product'
        if any(strcmp(ParamName, {'memoryMode','memoryWordLength'}))
            doThisOne = true;
        end % if
    end % switch
