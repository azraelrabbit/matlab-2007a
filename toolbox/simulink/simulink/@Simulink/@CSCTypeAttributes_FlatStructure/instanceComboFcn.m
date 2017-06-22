function instanceComboFcn(hObj, widgetName, entries, entryIdx)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    if not(strcmp(class(entryIdx), 'double'))
        error(horzcat('Unexpected argument type: "', class(entryIdx), '".'));
    end % if
    % 8 10
    entryStr = entries{plus(entryIdx, 1.0)};
    % 10 12
    switch widgetName
    case 'Struct name:'
        if strcmp(entryStr, 'Instance specific')
            hObj.IsStructNameInstanceSpecific = true;
            hObj.StructName = '';
        else
            % 17 19
            hObj.IsStructNameInstanceSpecific = false;
        end % if
        % 20 22
    end % switch
