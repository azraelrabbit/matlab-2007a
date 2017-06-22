function doThisOne = instrumentThisParam(this, SignalName, ParamName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    doThisOne = false;
    % 8 12
    % 9 12
    % 10 12
    switch SignalName
    case 'Intermediate product'
        if any(strcmp(ParamName, {'interProdMode','interProdWordLength'}))
            doThisOne = true;
        end % if
    end % switch
