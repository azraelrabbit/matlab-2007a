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
    pk = findpackage('sigwin');
    % 11 12
    c = schema.class(pk, 'samplingflagwin', pk.findclass('variablelength'));
    c.Description = 'abstract';
    % 14 16
    % 15 16
    schema.prop(c, 'SamplingFlag', 'signalSignalwindowsWindowSampling_flag');
    % 17 18
    p = schema.prop(c, 'sampling_flag', 'signalSignalwindowsWindowSampling_flag');
    set(p, 'Visible', 'Off', 'AccessFlags.Init', 'Off', 'AccessFlags.AbortSet', 'Off', 'AccessFlags.Serialize', 'Off', 'AccessFlags.Copy', 'Off', 'AccessFlags.Init', 'Off', 'SetFunction', @setsampling_flag, 'GetFunction', @getsampling_flag);
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
end % function
function sf = setsampling_flag(this, sf)
    % 28 31
    % 29 31
    % 30 31
    warning(generatemsgid('DeprecatedProperty'), 'sampling_flag has been deprecated, use SamplingFlag instead.');
    % 32 34
    % 33 34
    set(this, 'SamplingFlag', sf);
end % function
function sf = getsampling_flag(this, sf)
    % 37 39
    % 38 39
    warning(generatemsgid('DeprecatedProperty'), 'sampling_flag has been deprecated, use SamplingFlag instead.');
    % 40 42
    % 41 42
    sf = get(this, 'SamplingFlag');
end % function
