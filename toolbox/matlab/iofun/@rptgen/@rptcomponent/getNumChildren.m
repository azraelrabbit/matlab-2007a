function n = getNumChildren(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    c = h.down;
    n = 0.0;
        while not(isempty(c))
        n = plus(n, 1.0);
        c = c.right;
    end % while
end % function
