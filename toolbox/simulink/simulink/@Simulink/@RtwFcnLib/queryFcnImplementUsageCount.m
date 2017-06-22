function result = queryFcnImplementUsageCount(hRtwFcnLib, mathName, dataType)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    switch mathName
    case '10^u'
        mathName = 'ten_u';
    case 'magnitude^2'
        mathName = 'mag_square';
    otherwise
        % 14 15
    end % switch
    % 16 17
    result = 0.0;
    if hRtwFcnLib.isValidProperty(mathName)
        entryObj = hRtwFcnLib.get(mathName);
        if not(isempty(entryObj)) && entryObj.isValidProperty(dataType)
            theImplFcn = entryObj.get(dataType);
            result = theImplFcn.UsageCount;
        end % if
    end % if
end % function
