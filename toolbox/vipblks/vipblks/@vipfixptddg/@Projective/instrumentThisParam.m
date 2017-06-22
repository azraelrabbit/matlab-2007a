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
    case 'Accumulator 1'
        if any(strcmp(ParamName, {'A1Mode','A1WordLength'}))
            doThisOne = true;
        end % if
    case 'Accumulator 2'
        if any(strcmp(ParamName, {'A2Mode','A2WordLength'}))
            doThisOne = true;
        end % if
    case 'Accumulator 3'
        if any(strcmp(ParamName, {'A3Mode','A3WordLength'}))
            doThisOne = true;
        end % if
    case 'Product 1'
        if any(strcmp(ParamName, {'P1Mode','P1WordLength'}))
            doThisOne = true;
        end % if
    case 'Product 2'
        if any(strcmp(ParamName, {'P2Mode','P2WordLength'}))
            doThisOne = true;
        end % if
    case 'Product 3'
        if any(strcmp(ParamName, {'P3Mode','P3WordLength'}))
            doThisOne = true;
        end % if
    case 'Matrix'
        if any(strcmp(ParamName, {'MatrixMode','MatrixWordLength'}))
            doThisOne = true;
        end % if
    case 'Output'
        if any(strcmp(ParamName, {'outputMode','outputWordLength'}))
            doThisOne = true;
        end % if
    end % switch
