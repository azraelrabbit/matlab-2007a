function cObj = doclick(cObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    cObj = doselect(cObj);
    figH = gcbf;
    selType = get(figH, 'SelectionType');
    figUnits = get(figH, 'Units');
    % 11 13
    items = cObj.Items;
    selectRect = Pos2Rect(rbbox);
    % 14 16
    for idx=1.0:length(items)
        anItem = items{idx};
        alreadySelected = get(anItem, 'IsSelected');
        % 18 20
        oldUnits = anItem.Units;
        anItem.Units = figUnits;
        anItemRect = Pos2Rect(anItem.Position);
        % 22 24
        inSelection = InSelectRect(anItemRect, selectRect);
        % 24 26
        switch selType
        case 'normal'
            if ne(inSelection, alreadySelected)
                set(anItem, 'IsSelected', inSelection);
            end % if
        case 'extend'
            if InSelectRect(anItemRect, selectRect)
                set(anItem, 'IsSelected', 1.0);
            end % if
        otherwise
        end % switch
        % 36 38
        anItem.Units = oldUnits;
    end % for
function rect = Pos2Rect(pos)
    % 40 44
    % 41 44
    % 42 44
    rect = plus(pos, horzcat(0.0, 0.0, pos(1.0:2.0)));
function hits = InSelectRect(objRect, selectRect)
    % 45 48
    % 46 48
    hits = or(and(ge(objRect(1.0:2.0), selectRect(1.0:2.0)), le(objRect(3.0:4.0), selectRect(3.0:4.0))), and(le(objRect(1.0:2.0), selectRect(1.0:2.0)), ge(objRect(3.0:4.0), selectRect(3.0:4.0))));
    % 48 51
    % 49 51
