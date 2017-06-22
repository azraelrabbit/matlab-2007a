function schema
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    schema.package('ECoderDemos');
    % 19 21
    % 20 21
    if isempty(findtype('AdvStructFields'))
        schema.EnumType('AdvStructFields', {'INPUT';'GAIN';'OUTPUT'});
    else
        % 24 26
        % 25 26
        % 26 27
        warning('A type named ''AdvStructFields'' already exists.');
    end % if
    % 29 30
    if isempty(findtype('BiasStorageClass'))
        schema.EnumType('BiasStorageClass', {'BiasVariant';'Invariant'});
    else
        % 33 34
        % 34 35
        warning('A type named ''BiasStorageClass'' already exists.');
    end % if
    % 37 38
    if isempty(findtype('AmplifyStorageClass'))
        schema.EnumType('AmplifyStorageClass', {'AmplifyVariant';'Invariant'});
    else
        % 41 42
        % 42 43
        warning('A type named ''AmplifyStorageClass'' already exists.');
    end % if
    % 45 46
    if isempty(findtype('MyCustomStorageClasses'))
        schema.EnumType('MyCustomStorageClasses', {'BasicStruct';'AdvancedStruct';'Mutex';'PriorityCeiling'});
    else
        % 49 52
        % 50 52
        % 51 52
        % 52 53
        warning('A type named ''MyCustomStorageClasses'' already exists.');
    end % if
end % function
