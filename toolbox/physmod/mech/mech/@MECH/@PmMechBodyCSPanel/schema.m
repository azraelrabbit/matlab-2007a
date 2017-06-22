function schema
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    hBasePackage = findpackage('PMDialogs');
    hBaseObj = hBasePackage.findclass('PmGuiObj');
    hCreateInPackage = findpackage('MECH');
    % 14 16
    % 15 16
    cls = schema.class(hCreateInPackage, 'PmMechBodyCSPanel', hBaseObj);
    % 17 19
    % 18 19
    schema.prop(cls, 'ParamName', 'string');
    schema.prop(cls, 'EnableStatus', 'bool');
    schema.prop(cls, 'PortTrackingInfo', 'mxArray');
    % 22 23
    helper = MECH.MechFrameHelper;
    pProp = schema.prop(cls, 'WorkFrames', horzcat(class(helper), ' vector'));
    pProp.AccessFlags.PublicGet = 'on';
    pProp.AccessFlags.PublicSet = 'on';
end % function
