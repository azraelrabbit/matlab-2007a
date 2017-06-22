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
    c = schema.class(pk, 'mpiraxes', findclass(pk, 'mpanimateaxes'));
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    p = schema.prop(c, 'PathDelays', 'mxArray');
    % 17 19
    p = schema.prop(c, 'ChannelIRTimeDomain', 'mxArray');
    % 19 21
    p = schema.prop(c, 'ChannelSmoothIRTimeDomain', 'mxArray');
    p.SetFunction = @setChannelSmoothIRTimeDomain;
end % function
function t = setChannelSmoothIRTimeDomain(h, t)
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    set(h.AxesHandle, 'xlim', horzcat(t(1.0), t(end)));
end % function
