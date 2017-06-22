function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('sigtools');
    spk = findpackage('siggui');
    % 10 12
    % 11 12
    c = schema.class(pk, 'fdatool', spk.findclass('sigcontainer'));
    % 13 16
    % 14 16
    % 15 16
    schema.prop(c, 'Filename', 'string');
    schema.prop(c, 'LaunchedBySPTool', 'bool');
    % 18 21
    % 19 21
    % 20 21
    p = vertcat(schema.prop(c, 'filterMadeBy', 'string'), schema.prop(c, 'FileDirty', 'bool'), schema.prop(c, 'MCode', 'mxArray'));
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    set(p, 'AccessFlags.PublicSet', 'off');
    % 27 28
    p(2.0).FactoryValue = 0.0;
    % 29 30
    schema.prop(c, 'LastLoadState', 'mxArray');
    % 31 35
    % 32 35
    % 33 35
    % 34 35
    p = vertcat(schema.prop(c, 'sessionType', 'string'), schema.prop(c, 'ApplicationData', 'MATLAB array'), schema.prop(c, 'Listeners', 'handle.listener vector'), schema.prop(c, 'Filter', 'handle'), schema.prop(c, 'OverWrite', 'on/off'), schema.prop(c, 'FigureTitle', 'string'), schema.prop(c, 'SubTitle', 'string'));
    % 36 44
    % 37 44
    % 38 44
    % 39 44
    % 40 44
    % 41 44
    % 42 44
    % 43 44
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 45 47
    % 46 47
    schema.event(c, 'FilterUpdated');
    schema.event(c, 'FastFilterUpdated');
    schema.event(c, 'NewAnalysis');
    schema.event(c, 'DefaultAnalysis');
    schema.event(c, 'FullViewAnalysis');
    schema.event(c, 'Print');
    schema.event(c, 'PrintPreview');
end % function
