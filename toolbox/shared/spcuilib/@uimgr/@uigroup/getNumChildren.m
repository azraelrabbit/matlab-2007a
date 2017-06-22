function N = getNumChildren(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    N = 0.0;
    h = h.down;
        while not(isempty(h))
        N = plus(N, 1.0);
        h = h.right;
    end % while
end % function
