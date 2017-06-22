function cObj = mydoclick(cObj)
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
    children = cObj.Contents;
    selectRect = Pos2Rect(rbbox);
    % 13 15
    for i=1.0:length(children)
        aChild = children{i};
        alreadySelected = get(aChild, 'IsSelected');
        % 17 19
        oldUnits = aChild.Units;
        aChild.Units = figUnits;
        aChildRect = Pos2Rect(aChild.Position);
        % 21 23
        inSelection = InSelectRect(aChildRect, selectRect);
        % 23 25
        switch selType
        case 'normal'
            if ne(inSelection, alreadySelected)
                set(aChild, 'IsSelected', inSelection);
            end % if
        case 'extend'
            if InSelectRect(aChildRect, selectRect)
                set(aChild, 'IsSelected', 1.0);
            end % if
        otherwise
        end % switch
        % 35 37
        aChild.Units = oldUnits;
    end % for
function rect = Pos2Rect(pos)
    % 39 43
    % 40 43
    % 41 43
    rect = plus(pos, horzcat(0.0, 0.0, pos(1.0:2.0)));
function val = InSelectRect(objRect, selectRect)
    % 44 47
    % 45 47
    hits = or(and(ge(objRect(1.0:2.0), selectRect(1.0:2.0)), le(objRect(3.0:4.0), selectRect(3.0:4.0))), and(le(objRect(1.0:2.0), selectRect(1.0:2.0)), ge(objRect(3.0:4.0), selectRect(3.0:4.0))));
    % 47 51
    % 48 51
    % 49 51
    if hits
        val = 1.0;
    else
        val = 0.0;
    end % if
