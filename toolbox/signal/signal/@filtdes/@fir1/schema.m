function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('filtdes');
    % 8 11
    % 9 11
    c = schema.class(pk, 'fir1', findclass(pk, 'dynamicMinOrdMethod'));
    % 11 14
    % 12 14
    p = schema.prop(c, 'PassbandScale', 'on/off');
    p.FactoryValue = 'on';
    % 15 17
    [w, lw] = findallwinclasses;
    if isempty(findtype('signalwindowslist'))
        schema.EnumType('signalwindowslist', cellhorzcat(lw{1.0:minus(end, 1.0)}));
        % 19 21
    end % if
    p = schema.prop(c, 'Window', 'signalwindowslist');
    p.FactoryValue = 'Kaiser';
    p.SetFunction = @set_win;
    % 24 27
    % 25 27
    p = schema.prop(c, 'windowlistener', 'handle.listener');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 29 31
    findclass(findpackage('sigwin'), 'window');
    p = schema.prop(c, 'windowobject', 'sigwin.window');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
end % function
