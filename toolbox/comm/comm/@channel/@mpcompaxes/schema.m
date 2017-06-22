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
    c = schema.class(pk, 'mpcompaxes', findclass(pk, 'mpanimateaxes'));
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
    set(h.AxesHandle, 'xlim', horzcat(uminus(minus(mtimes(2.0, t(end)), t(minus(end, 1.0)))), 0.0));
end % function
