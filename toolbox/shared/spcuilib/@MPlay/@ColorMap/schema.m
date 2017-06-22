function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('MPlay');
    hDeriveFromClass = findclass(pkg, 'DialogBase');
    hThisClass = schema.class(pkg, 'ColorMap', hDeriveFromClass);
    % 10 11
    MPlay.RegisterDDGMethods(hThisClass, {'getDialogSchema','validate'});
    % 12 15
    % 13 15
    % 14 15
    schema.prop(hThisClass, 'cmapStr', 'string');
    schema.prop(hThisClass, 'cmap', 'mxArray');
    % 17 18
    p = schema.prop(hThisClass, 'userRange', 'bool');
    p.FactoryValue = false;
    p = schema.prop(hThisClass, 'userRangeMin', 'double');
    p.FactoryValue = 0.0;
    p = schema.prop(hThisClass, 'userRangeMax', 'double');
    p.FactoryValue = 255.0;
    % 24 25
    schema.prop(hThisClass, 'isIntensity', 'bool');
    % 26 28
    % 27 28
    schema.prop(hThisClass, 'scale_limits', 'mxArray');
    % 29 32
    % 30 32
    % 31 32
    schema.prop(hThisClass, 'hColormapMenu', 'mxArray');
    % 33 35
    % 34 35
    schema.prop(hThisClass, 'listener_cmapStr', 'handle.listener');
    schema.prop(hThisClass, 'listener_cmap', 'handle.listener');
    schema.prop(hThisClass, 'listener_scale', 'handle.listener vector');
    % 38 41
    % 39 41
    % 40 41
    schema.event(hThisClass, 'ScalingChanged');
end % function
