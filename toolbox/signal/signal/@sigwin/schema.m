function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    schema.package('sigwin');
    % 11 13
    % 12 13
    pk = findpackage('sigdatatypes');
    % 14 15
    if isempty(findtype('signalSignalwindowsWindowSampling_flag'))
        schema.EnumType('signalSignalwindowsWindowSampling_flag', {'symmetric','periodic'});
    end % if
    % 18 19
    if isempty(findtype('signalSignalwindowsExtendedWindowSampling_flag'))
        schema.EnumType('signalSignalwindowsExtendedWindowSampling_flag', {'none','symmetric','periodic'});
    end % if
end % function
