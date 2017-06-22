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
    case {'A','K'}
        if any(strcmp(ParamName, {'firstCoeffMode','firstCoeffWordLength'}))
            doThisOne = true;
        end % if
    case 'P'
        if any(strcmp(ParamName, {'outputMode','outputWordLength'}))
            doThisOne = true;
        end % if
    end % switch
