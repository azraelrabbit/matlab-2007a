function isBuiltin = sldtype_is_builtin(dtype)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    isBuiltin = false;
    if strcmp(dtype, 'double') || strcmp(dtype, 'single') || strcmp(dtype, 'int8') || strcmp(dtype, 'uint8') || strcmp(dtype, 'int16') || strcmp(dtype, 'uint16') || strcmp(dtype, 'int32') || strcmp(dtype, 'uint32') || strcmp(dtype, 'boolean')
        % 8 16
        % 9 16
        % 10 16
        % 11 16
        % 12 16
        % 13 16
        % 14 16
        % 15 16
        isBuiltin = true;
    end % if
end % function
