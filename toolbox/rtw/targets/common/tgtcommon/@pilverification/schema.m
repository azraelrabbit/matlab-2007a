function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    schema.package('pilverification');
end % function
function i_registerEnum(name, enum)
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    if isempty(findtype(name))
        schema.EnumType(name, enum);
    else
        warning(horzcat('A type named ', name, ' already exists.'));
    end % if
end % function
