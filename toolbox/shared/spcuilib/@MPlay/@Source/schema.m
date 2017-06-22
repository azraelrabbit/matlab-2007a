function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pkg = findpackage('MPlay');
    inhcls = findclass(findpackage('slmgr'), 'SLDataSink');
    this = schema.class(pkg, 'Source', inhcls);
    % 11 14
    % 12 14
    % 13 14
    if isempty(findtype('ErrorStatusType'))
        schema.EnumType('ErrorStatusType', {'success','failure','cancel'});
    end % if
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    p = schema.prop(this, 'errorStatus', 'ErrorStatusType');
    p.FactoryValue = 'failure';
    % 25 26
    p = schema.prop(this, 'errorMsg', 'MATLAB array');
    p.FactoryValue = '';
    % 28 30
    % 29 30
    cl = findclass(pkg, 'MPlayer');
    p = schema.prop(this, 'mplayObj', 'MPlay.MPlayer');
    % 32 34
    % 33 34
    cl = findclass(pkg, 'PlaybackControls');
    p = schema.prop(this, 'playbackControls', 'MPlay.PlaybackControls');
    % 36 38
    % 37 38
    cl = findclass(pkg, 'DataAbstract');
    p = schema.prop(this, 'dataSource', 'MPlay.DataAbstract');
    % 40 42
    % 41 42
    p = schema.prop(this, 'resources', 'MATLAB array');
end % function
