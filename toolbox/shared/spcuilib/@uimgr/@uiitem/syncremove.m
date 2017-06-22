function syncremove(h, suppressRerender)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    if lt(nargin, 2.0)
        suppressRerender = false;
    end % if
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    hSL = h.SyncList;
    if not(isempty(h.SyncList))
        remove(hSL);
    end % if
    % 31 33
    % 32 33
    hChild = h.down;
        while not(isempty(hChild))
        % 35 37
        % 36 37
        hSL = hChild.SyncList;
        if not(isempty(hSL))
            remove(hSL);
        end % if
        hChild = hChild.right;
    end % while
    % 43 45
    % 44 45
    if not(suppressRerender)
        h.unrender;
        h.up.render;
    end % if
end % function
