function schema
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    schema.package('RTWConfiguration');
    % 21 23
    % 22 23
    if isempty(findtype('TargetCustomStorageTypes'))
        schema.EnumType('TargetCustomStorageTypes', {'Target'});
    else
        % 26 27
        warning('A type named ''TargetCustomStorageTypes'' already exists.');
    end % if
    % 29 30
    if isempty(findtype('AllocationHostType'))
        schema.EnumType('AllocationHostType', {'char';'handle'});
    else
        % 33 34
        % 34 35
        warning('A type named ''AllocationHostType'' already exists.');
    end % if
end % function
