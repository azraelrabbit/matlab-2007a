function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('hdlgui');
    c = schema.class(pk, 'vhdldlg', findclass(findpackage('siggui'), 'actionclosedlg'));
    % 10 11
    p = schema.prop(c, 'Filter', 'mxArray');
    set(p, 'SetFunction', @lclsetfilter, 'GetFunction', @getprivfilter);
    % 13 15
    % 14 15
    p = schema.prop(c, 'privFilter', 'mxArray');
    set(p, 'Visible', 'off');
    % 17 18
    m = schema.method(c, 'updatefilter');
    s = m.Signature;
    % 20 21
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {'bool','string'};
    % 23 24
    p = schema.prop(c, 'DialogCancelledListener', 'handle.listener');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
end % function
function filtobj = lclsetfilter(this, filtobj)
    % 28 30
    % 29 30
    filtobj = this.setfilter(filtobj);
end % function
function filtobj = getprivfilter(this, filtobj)
    % 33 35
    % 34 35
    filtobj = get(this, 'privFilter');
end % function
