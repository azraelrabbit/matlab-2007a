function [obj, ind, reverse_ind] = unique(obj)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    names = cellstr(get(obj, 'Name'));
    [ignore, ind, reverse_ind] = unique(names);
    obj = obj(ind);
end % function
