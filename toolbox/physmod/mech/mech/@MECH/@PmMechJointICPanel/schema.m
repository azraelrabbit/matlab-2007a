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
    hBasePackage = findpackage('MECH');
    hBaseObj = hBasePackage.findclass('PmMechGuiObj');
    hCreateInPackage = hBasePackage;
    % 13 15
    % 14 15
    cls = schema.class(hCreateInPackage, 'PmMechJointICPanel', hBaseObj);
    % 16 18
    % 17 18
    schema.prop(cls, 'ParamName', 'string');
    helper = MECH.MechPrimitiveStateHelper;
    pProp = schema.prop(cls, 'StateList', horzcat(class(helper), ' vector'));
    pProp.AccessFlags.PublicGet = 'on';
    pProp.AccessFlags.PublicSet = 'on';
    pProp = schema.prop(cls, 'EnableStatus', 'bool');
    % 24 26
    % 25 26
    schema.prop(cls, 'AdjacentPrimitives', 'string vector');
end % function
