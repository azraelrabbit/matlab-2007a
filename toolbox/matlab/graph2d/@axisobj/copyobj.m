function newA = copyobj(A, HGParent)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    newA = A;
    HGObj = newA.scribehgobj;
    newA.scribehgobj = copyobj(HGObj, HGParent);
    % 12 13
    newHG = get(newA, 'MyHGHandle');
    % 14 16
    % 15 16
    deleteProxy = findall(newHG, 'Tag', 'LegendDeleteProxy');
    if not(isempty(deleteProxy))
        set(deleteProxy, 'DeleteFcn', '');
        delete(deleteProxy);
    end % if
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    newA = set(newA, 'Draggable', 1.0);
    % 26 28
    % 27 28
    labels = get(newHG, {'Title','XLabel','YLabel','ZLabel'});
    children = horzcat(ctranspose(allchild(newHG)), horzcat(labels{:}));
    % 30 31
    newFig = HGParent;
    for aChild=children
        try
            aH = getobj(aChild);
            if not(isempty(aH))
                myUIContextMenu = getscribecontextmenu(aH.HGHandle);
                UIContextMenuTag = get(myUIContextMenu, 'Tag');
                % 38 39
                newObj = set(aH.Object, 'MyHGHandle', aChild);
                newH = scribehandle(newObj);
                % 41 42
                newUIContextMenu = findall(newFig, 'Tag', UIContextMenuTag);
                if isempty(newUIContextMenu)
                    newUIContextMenu = copyobj(myUIContextMenu, newFig);
                end % if
                if not(isempty(newUIContextMenu))
                    setscribecontextmenu(aChild, newUIContextMenu(1.0));
                end % if
            end % if
        catch
            warning('MATLAB:copyobj:CopyError', horzcat('Error copying axes: ', lasterr));
        end % try
    end % for
end % function
