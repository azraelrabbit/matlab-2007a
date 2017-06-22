function obj = Alloc(num)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    obj = dependencies.DirReference;
    % 13 15
    % 14 15
    obj = repmat(obj, horzcat(num, 1.0));
end % function
