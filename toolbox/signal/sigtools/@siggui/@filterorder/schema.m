function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    % 9 11
    % 10 11
    c = schema.class(pk, 'filterorder', pk.findclass('abstractfilterorder'));
    % 12 13
    p = schema.prop(c, 'mode', 'SignalFdatoolFilterOrderMode');
    set(p, 'SetFunction', @setmode, 'FactoryValue', 'minimum');
end % function
function mode = setmode(h, mode)
    % 17 20
    % 18 20
    % 19 20
    modeOpts = set(h, 'mode');
    % 21 22
    if not(get(h, 'isMinOrd')) && strmatch(lower(mode), modeOpts{2.0})
        error('Internal error. Cannot set mode to ''minimum'', the minimum order option is disabled.');
    end % if
end % function
