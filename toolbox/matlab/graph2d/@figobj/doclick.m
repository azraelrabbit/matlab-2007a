function figObj = doclick(figObj)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    myHG = get(figObj, 'MyHGHandle');
    % 16 17
    selType = get(myHG, 'SelectionType');
    % 18 19
    if strcmp(selType, 'extend') || strcmp(selType, 'open')
        selection = get(figObj, 'Selection');
        if not(isempty(selection))
            hList = subsref(selection, substruct('.', 'HGHandle'));
            if iscell(hList)
                hList = horzcat(myHG, hList{:});
            else
                hList = horzcat(myHG, hList);
            end % if
        else
            hList = myHG;
        end % if
    else
        dragBin = figObj.DragObjects;
        for aObjH=dragBin.Items
            set(aObjH, 'IsSelected', 0.0);
        end % for
        hList = myHG;
    end % if
    % 38 39
    switch selType
    case 'open'
        propedit(hList, '-noselect');
    otherwise
        propedit(hList, '-noopen', '-noselect');
    end % switch
end % function
