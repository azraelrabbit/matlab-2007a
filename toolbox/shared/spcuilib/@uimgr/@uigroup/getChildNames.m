function v = getChildNames(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    v = {};
    h = h.down;
        while not(isempty(h))
        v{plus(end, 1.0)} = h.Name;
        h = h.right;
    end % while
end % function
