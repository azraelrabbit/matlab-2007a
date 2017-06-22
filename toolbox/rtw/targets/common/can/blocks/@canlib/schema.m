function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    schema.package('canlib');
    % 9 11
    % 10 11
    if isempty(findtype('storage_class'))
        schema.EnumType('storage_class', {'Daq_List_Signal_Processing'});
    else
        % 14 15
        warning('A type named ''storage_class'' already exists.');
    end % if
end % function
