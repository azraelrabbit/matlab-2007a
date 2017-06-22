function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('sigio');
    pk1 = findpackage('siggui');
    c = schema.class(pk, 'export', pk1.findclass('actionclosedlg'));
    % 10 12
    pk2 = findpackage('sigutils');
    findclass(pk2, 'vector');
    p = schema.prop(c, 'Data', 'mxArray');
    set(p, 'SetFunction', @lclsetdata, 'GetFunction', @getdata, 'AccessFlags.Init', 'Off');
    % 15 19
    % 16 19
    % 17 19
    p = schema.prop(c, 'privData', 'sigutils.vector');
    set(p, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off', 'SetFunction', @setprivdata);
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    p = schema.prop(c, 'DefaultLabels', 'string vector');
    set(p, 'SetFunction', @setdefaultlabels);
    % 26 28
    p = schema.prop(c, 'AvailableDestinations', 'MATLAB array');
    % 28 31
    % 29 31
    set(p, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off', 'SetFunction', @setavaildes, 'GetFunction', @getavaildes, 'AccessFlags.AbortSet', 'Off');
    % 31 34
    % 32 34
    schema.prop(c, 'ExcludeItem', 'string');
    % 34 36
    findclass(pk, 'abstractxpdestination');
    % 36 38
    p = horzcat(schema.prop(c, 'PreviousState', 'mxArray'), schema.prop(c, 'privAvailableDestinations', 'mxArray'), schema.prop(c, 'privAvailableConstructors', 'mxArray'), schema.prop(c, 'VectorChangedListener', 'handle.listener'));
    % 38 44
    % 39 44
    % 40 44
    % 41 44
    % 42 44
    set(p, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 44 46
    p = schema.prop(c, 'AvailableConstructors', 'MATLAB array');
    set(p, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off', 'SetFunction', @setavailconstr, 'GetFunction', @getavailconstr);
    % 47 51
    % 48 51
    % 49 51
    p = schema.prop(c, 'CurrentDestination', 'string');
    set(p, 'SetFunction', @setcurrentdest);
    % 52 54
    p = schema.prop(c, 'Destination', 'sigio.abstractxpdestination');
    set(p, 'SetFunction', @setdestination, 'AccessFlags.PublicSet', 'off', 'AccessFlags.Init', 'Off');
    % 55 57
    p = schema.prop(c, 'Toolbox', 'string');
    set(p, 'FactoryValue', 'signal');
    % 58 60
    schema.prop(c, 'CSHelpTag', 'string');
end % function
function out = lclsetdata(this, out)
    % 62 67
    % 63 67
    % 64 67
    % 65 67
    out = this.setdata(out);
end % function
