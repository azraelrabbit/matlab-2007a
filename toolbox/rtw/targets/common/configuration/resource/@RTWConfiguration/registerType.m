function registerType(name, enum)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if isempty(findtype(name))
        % 11 12
        enum{plus(length(enum), 1.0)} = RTWConfiguration.deactivatedString;
        schema.EnumType(name, enum);
    else
        warning(horzcat('A type named ', name, ' already exists.'));
    end % if
    return;
end % function
