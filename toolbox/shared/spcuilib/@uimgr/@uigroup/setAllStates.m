function setAllStates(h, val)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    h = h.down;
        while not(isempty(h))
        % 12 13
        hWidget = h.hWidget;
        if not(isempty(hWidget)) && ishandle(hWidget)
            set(hWidget, h.StateName, val);
        end % if
        h = h.right;
    end % while
    % 19 20
end % function
