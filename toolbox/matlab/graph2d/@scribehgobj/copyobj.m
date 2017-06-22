function newObj = copyobj(hgObj, HGParent)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    HG = get(hgObj, 'MyHGHandle');
    % 10 11
    try
        myUIContextMenu = getscribecontextmenu(HG);
        UIContextMenuTag = get(myUIContextMenu, 'Tag');
        newHG = copyobj(HG, HGParent);
        % 15 17
        % 16 17
        UD = getscribeobjectdata(HG);
        setscribeobjectdata(newHG, UD);
        % 19 21
        % 20 21
        parentType = get(HGParent, 'Type');
        switch parentType
        case 'axes'
            newFig = get(HGParent, 'Parent');
        case 'figure'
            newFig = HGParent;
        end % switch
        % 28 29
        newUIContextMenu = findobj(allchild(newFig), 'flat', 'Tag', UIContextMenuTag);
        % 30 31
        if isempty(newUIContextMenu)
            newUIContextMenu = copyobj(myUIContextMenu, newFig);
        end % if
        if not(isempty(newUIContextMenu))
            setscribecontextmenu(newHG, newUIContextMenu(1.0));
        end % if
        % 37 38
        newObj = set(hgObj, 'MyHGHandle', newHG);
    catch
        % 40 41
        newObj = [];
    end % try
end % function
