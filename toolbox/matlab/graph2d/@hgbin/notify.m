function binObj = notify(binObj, caller, prop, value)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    otherItems = binObj.Items;
    otherItems = otherItems(find(ne(otherItems, caller)));
    % 9 11
    switch prop
    case 'position'
    case 'doclick'
        if strcmp(value, 'normal')
            if not(isempty(otherItems))
                otherItems.IsSelected = 0.0;
            end % if
        end % if
    end % switch
