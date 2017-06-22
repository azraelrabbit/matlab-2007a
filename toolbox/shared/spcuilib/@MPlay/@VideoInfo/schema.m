function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    pkg = findpackage('MPlay');
    hDeriveFromClass = findclass(pkg, 'DialogBase');
    hThisClass = schema.class(pkg, 'VideoInfo', hDeriveFromClass);
    % 13 14
    MPlay.RegisterDDGMethods(hThisClass, {'getDialogSchema'});
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    schema.prop(hThisClass, 'playbackInfo', 'MATLAB array');
    % 20 22
    % 21 22
    schema.prop(hThisClass, 'sourceType', 'string');
    schema.prop(hThisClass, 'sourceLocation', 'string');
    schema.prop(hThisClass, 'imageSize', 'string');
    schema.prop(hThisClass, 'colorSpace', 'string');
    schema.prop(hThisClass, 'frameRate', 'string');
    schema.prop(hThisClass, 'dataType', 'string');
    schema.prop(hThisClass, 'dataTypeDst', 'string');
    % 29 31
    % 30 31
    schema.prop(hThisClass, 'listen_dataTypeDst', 'handle.listener');
end % function
