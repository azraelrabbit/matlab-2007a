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
    hBasePackage = findpackage('PMDialogs');
    hBaseObj = hBasePackage.findclass('PmGuiObj');
    hCreateInPackage = findpackage('MECH');
    % 13 15
    % 14 15
    cls = schema.class(hCreateInPackage, 'PmMechJointPrimitivePanel', hBaseObj);
    % 16 18
    % 17 18
    pProp = schema.prop(cls, 'ParamName', 'string');
    pProp = schema.prop(cls, 'NoCutOption', 'bool');
    pProp = schema.prop(cls, 'ForceCut', 'bool');
    pProp = schema.prop(cls, 'EnableStatusForceCut', 'bool');
    % 22 23
    helper = MECH.MechPrimitiveHelper;
    pProp = schema.prop(cls, 'RefFrames', horzcat(class(helper), ' vector'));
    pProp.AccessFlags.PublicGet = 'on';
    pProp.AccessFlags.PublicSet = 'on';
    pProp = schema.prop(cls, 'EnableStatusRefFrames', 'bool');
end % function
