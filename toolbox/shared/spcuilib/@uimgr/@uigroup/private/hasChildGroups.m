function y = hasChildGroups(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    y = false;
    h = h.down;
        while not(isempty(h))
        if h.isGroup
            y = true;
            return;
        end % if
        h = h.right;
    end % while
end % function
