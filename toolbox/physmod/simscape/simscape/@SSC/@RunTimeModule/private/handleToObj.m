function obj = handleToObj(handle)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if isa(handle, 'double') || isa(handle, 'char')
        obj = get_param(handle, 'Object');
    else
        obj = handle;
    end % if
end % function
