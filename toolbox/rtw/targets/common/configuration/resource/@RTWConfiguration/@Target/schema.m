function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hCreateInPackage = findpackage('RTWConfiguration');
    % 10 12
    % 11 12
    hThisClass = schema.class(hCreateInPackage, 'Target');
    % 13 15
    % 14 15
    hThisMethod = schema.method(hThisClass, 'acquireResourceForBlock', 'static');
    % 16 19
    % 17 19
    % 18 19
    hThisProp = schema.prop(hThisClass, 'activeList', 'handle');
    hThisProp = schema.prop(hThisClass, 'inactiveList', 'handle');
    hThisProp.AccessFlags.Serialize = 'off';
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    % 27 28
    hThisProp = schema.prop(hThisClass, 'implicitLibs', 'string vector');
    % 29 31
    % 30 31
    hThisProp = schema.prop(hThisClass, 'errors', 'string vector');
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    % 36 37
    hThisProp = schema.prop(hThisClass, 'registered_blocks', 'string vector');
    hThisProp.AccessFlags.PublicSet = 'off';
    hThisProp.AccessFlags.PublicGet = 'off';
    hThisProp.AccessFlags.Serialize = 'off';
    % 41 43
    % 42 43
    hThisProp = schema.prop(hThisClass, 'user_interface', 'handle');
    hThisProp.AccessFlags.PublicSet = 'off';
    hThisProp.AccessFlags.PublicGet = 'off';
    hThisProp.AccessFlags.Serialize = 'off';
    % 47 49
    % 48 49
    if isempty(javachk('swing'))
        hThisProp = schema.prop(hThisClass, 'ui_frame', 'javax.swing.JFrame');
        hThisProp.AccessFlags.Serialize = 'off';
    else
        warning('RTWConfiguration.Target class incorrectly loaded due to missing javax.swing support');
    end % if
    % 55 57
    % 56 57
    if isempty(javachk('swing'))
        hThisProp = schema.prop(hThisClass, 'ui_active_list', 'javax.swing.JList');
        hThisProp.AccessFlags.Serialize = 'off';
    else
        warning('RTWConfiguration.Target class incorrectly loaded due to missing javax.swing support');
    end % if
    % 63 65
    % 64 65
    hThisProp = schema.prop(hThisClass, 'user_interface_visibile', 'bool');
    hThisProp.AccessFlags.PublicSet = 'off';
    hThisProp.AccessFlags.PublicGet = 'off';
    hThisProp.AccessFlags.Serialize = 'off';
    % 69 71
    % 70 71
    hThisProp = schema.prop(hThisClass, 'block', 'string');
end % function
