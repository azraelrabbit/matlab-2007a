function enableChildren(h, ena)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hChild = h.down;
        while not(isempty(hChild))
        hChild.Enable = ena;
        hChild = hChild.right;
    end % while
end % function
