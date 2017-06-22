function registerRootType(name, enum)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    if isempty(findtype(name))
        schema.EnumType(name, enum);
    else
        warning(horzcat('A type named ', name, ' already exists.'));
    end % if
    return;
end % function
