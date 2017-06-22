function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    pkg = findpackage('MPlay');
    hDeriveFromClass = findclass(pkg, 'DialogBase');
    hThisClass = schema.class(pkg, 'Preferences', hDeriveFromClass);
    % 9 12
    % 10 12
    MPlay.RegisterDDGMethods(hThisClass, {'closedlg','getDialogSchema','validate'});
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    m = schema.method(hThisClass, 'reset');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 21 32
    % 22 32
    % 23 32
    % 24 32
    % 25 32
    % 26 32
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    p = schema.prop(hThisClass, 'GroupName', 'string');
    p.FactoryValue = 'MPlayPreferences';
    p.AccessFlags.PublicSet = 'off';
    % 34 40
    % 35 40
    % 36 40
    % 37 40
    % 38 40
    findclass(pkg, 'DataConnectSimulink');
    % 40 42
    if isempty(findtype('RecentSourcesListLengthType'))
        schema.UserType('RecentSourcesListLengthType', 'double', @check_RecentSourcesListLengthType);
    end % if
    % 44 49
    % 45 49
    % 46 49
    % 47 49
    y = MPlay.PrefsDefs;
    for i=1.0:size(y, 1.0)
        pname = y{i, 1.0};
        ptype = y{i, 2.0};
        p = schema.prop(hThisClass, pname, ptype);
        p.SetFunction = cellhorzcat(@local_save, pname);
    end % for
end % function
function S = local_save(h, S, prefName)
    % 57 59
    save(h, prefName, S);
end % function
