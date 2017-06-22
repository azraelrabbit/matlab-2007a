function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('filtresp');
    % 9 10
    c = schema.class(pk, 'coefficients', findclass(findpackage('sigresp'), 'listboxanalysis'));
    % 11 12
    findclass(pk, 'filterutils');
    p = schema.prop(c, 'FilterUtils', 'filtresp.filterutils');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 15 16
    p = schema.prop(c, 'Format', 'string');
    set(p, 'GetFunction', @get_format, 'SetFunction', @set_format, 'AccessFlags.Init', 'Off');
end % function
function fmt = get_format(this, fmt)
    % 20 23
    % 21 23
    % 22 23
    h = getparameter(this, 'coefficient');
    fmt = get(h, 'Value');
end % function
function fmt = set_format(this, fmt)
    % 27 29
    % 28 29
    h = getparameter(this, 'coefficient');
    fmt = setvalue(h, fmt);
end % function
