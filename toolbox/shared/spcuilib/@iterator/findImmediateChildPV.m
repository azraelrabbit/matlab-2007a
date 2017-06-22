function hChild = findImmediateChildPV(h, param, value)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    hChild = find(h, '-depth', 1.0, param, value);
end % function
