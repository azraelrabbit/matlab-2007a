function cObj = doselect(cObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    figH = gcbf;
    selType = get(figH, 'SelectionType');
    figUnits = get(figH, 'Units');
    % 10 12
    items = cObj.Items;
    selectRect = Pos2Rect(rbbox);
    % 13 15
    for idx=1.0:length(items)
        anItem = items{idx};
        alreadySelected = get(anItem, 'IsSelected');
        % 17 19
        oldUnits = anItem.Units;
        anItem.Units = figUnits;
        anItemRect = Pos2Rect(anItem.Position);
        % 21 23
        inSelection = InSelectRect(anItemRect, selectRect);
        % 23 25
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
        % 35 37
        anItem.Units = oldUnits;
    end % for
function rect = Pos2Rect(pos)
    % 39 43
    % 40 43
    % 41 43
    rect = plus(pos, horzcat(0.0, 0.0, pos(1.0:2.0)));
function hits = InSelectRect(objRect, selectRect)
    % 44 47
    % 45 47
    hits = or(and(ge(objRect(1.0:2.0), selectRect(1.0:2.0)), le(objRect(3.0:4.0), selectRect(3.0:4.0))), and(le(objRect(1.0:2.0), selectRect(1.0:2.0)), ge(objRect(3.0:4.0), selectRect(3.0:4.0))));
    % 47 50
    % 48 50
