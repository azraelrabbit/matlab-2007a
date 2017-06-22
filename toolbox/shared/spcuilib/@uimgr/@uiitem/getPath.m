function s = getPath(h)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    s = h.Name;
    h = h.up;
        while not(isempty(h))
        % 14 16
        % 15 16
        s = sprintf('%s/%s', h.Name, s);
        h = h.up;
    end % while
end % function
