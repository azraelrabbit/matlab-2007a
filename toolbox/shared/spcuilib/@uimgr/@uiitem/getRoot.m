function hTop = getRoot(h)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
        while not(isempty(h))
        hTop = h;
        h = h.up;
    end % while
end % function
