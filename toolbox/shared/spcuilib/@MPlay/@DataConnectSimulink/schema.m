function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    package = findpackage('MPlay');
    inheritFromClass = findclass(package, 'DataConnectAbstract');
    thisclass = schema.class(package, 'DataConnectSimulink', inheritFromClass);
    % 11 14
    % 12 14
    % 13 14
    if isempty(findtype('connectModeType'))
        schema.EnumType('connectModeType', {'persistent','floating'});
    end % if
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    findclass(findpackage('slmgr'), 'SLConnectMgr');
    schema.prop(thisclass, 'hSLConnectMgr', 'slmgr.SLConnectMgr');
    % 25 28
    % 26 28
    % 27 28
    p = schema.prop(thisclass, 'connectMode', 'connectModeType');
    p.FactoryValue = 'persistent';
    % 30 34
    % 31 34
    % 32 34
    % 33 34
    p = schema.prop(thisclass, 'snap_shot', 'bool');
    p.FactoryValue = false;
    % 36 40
    % 37 40
    % 38 40
    % 39 40
    p = schema.prop(thisclass, 'stepFwd', 'bool');
    p.FactoryValue = false;
    % 42 47
    % 43 47
    % 44 47
    % 45 47
    % 46 47
    p = schema.prop(thisclass, 'playPauseButton', 'bool');
    p.FactoryValue = false;
    % 49 52
    % 50 52
    % 51 52
    schema.prop(thisclass, 'eventListeners', 'MATLAB array');
    % 53 56
    % 54 56
    % 55 56
    schema.prop(thisclass, 'listen_SelectionChangeEvent', 'MATLAB array');
end % function
