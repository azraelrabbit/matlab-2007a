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
    case 'Centroid output'
        if any(strcmp(ParamName, {'outputMode','outputWordLength'}))
            doThisOne = true;
        end % if
    case 'Equiv Diam^2 output'
        if any(strcmp(ParamName, {'memoryMode','memoryWordLength'}))
            doThisOne = true;
        end % if
    case 'Extent output'
        if any(strcmp(ParamName, {'firstCoeffMode','firstCoeffWordLength'}))
            doThisOne = true;
        end % if
    case 'Perimeter output'
        if any(strcmp(ParamName, {'secondCoeffMode','secondCoeffWordLength'}))
            doThisOne = true;
        end % if
    end % switch
