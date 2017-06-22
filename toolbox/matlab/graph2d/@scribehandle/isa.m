function val = isa(hndl, type)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if strcmpi(class(hndl), type)
        val = 1.0;
    else
        val = builtin('isa', hndl, type);
    end % if
end % function
