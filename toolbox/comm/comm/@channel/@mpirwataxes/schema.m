function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pk = findpackage('channel');
    % 9 11
    c = schema.class(pk, 'mpirwataxes', findclass(pk, 'mpiraxes'));
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    p = schema.prop(c, 'TimeDomain', 'mxArray');
    p.SetFunction = @setTimeDomain;
end % function
function t = setTimeDomain(h, t)
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    set(h.AxesHandle, 'ylim', horzcat(uminus(t(end)), 0.0));
end % function
