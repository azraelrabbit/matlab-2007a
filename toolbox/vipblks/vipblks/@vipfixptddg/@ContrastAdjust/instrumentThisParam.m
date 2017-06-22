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
    case 'Product 1'
        if any(strcmp(ParamName, {'prod1Mode','prod1WordLength'}))
            doThisOne = true;
        end % if
    case 'Product 2'
        if any(strcmp(ParamName, {'prod2Mode','prod2WordLength'}))
            doThisOne = true;
        end % if
    end % switch
