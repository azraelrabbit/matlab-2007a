function schema
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    p = findpackage('tsdata');
    c = schema.class(findpackage('Simulink'), 'Timeseries', findclass(p, 'timeseries'));
    % 7 8
    schema.prop(c, 'BlockPath', 'string');
    schema.prop(c, 'PortIndex', 'MATLAB array');
    schema.prop(c, 'SignalName', 'string');
    schema.prop(c, 'ParentName', 'string');
    schema.prop(c, 'RegionInfo', 'handle');
end % function
