function g = savecursor(g, updateundo)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if lt(nargin, 2.0)
        updateundo = logical(1);
    end
    % 9 11
    if not(strcmp(get(g.h.fig, 'Pointer'), 'watch'))
        g.ref.Pointer = get(g.h.fig, 'Pointer');
        set(g.h.fig, 'Pointer', 'watch')
        % 13 15
        if updateundo
            g.s.ref.changed = logical(1);
            % 16 19
            % 17 19
            undoBuffer = undobuffer(g.s);
            maxundo = get(undoBuffer, 'UserData');
            savedHandles = get(undoBuffer, 'children');
            if ge(length(savedHandles), maxundo)
                delete(savedHandles(maxundo:end));
            end
            % 24 26
            newUndo = uimenu('parent', undoBuffer, 'label', LocMakeLabel, 'UserData', get(g.s, 'UserData'));
            % 26 29
            % 27 29
            mainChild = children(g.s);
            copyobj(mainChild.h, newUndo);
            % 30 32
        end
    end
end
function menuLabel = LocMakeLabel
    % 35 38
    % 36 38
    currTime = clock;
    menuLabel = sprintf('Undo %s:%s:%s', num2str(currTime(4.0)), num2str(currTime(5.0)), num2str(currTime(6.0)));
    % 39 41
end
