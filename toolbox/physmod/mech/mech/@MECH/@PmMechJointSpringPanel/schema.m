function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hBasePackage = findpackage('MECH');
    hBaseObj = hBasePackage.findclass('PmMechGuiObj');
    hCreateInPackage = hBasePackage;
    % 12 14
    % 13 14
    cls = schema.class(hCreateInPackage, 'PmMechJointSpringPanel', hBaseObj);
    % 15 17
    % 16 17
    schema.prop(cls, 'ParamName', 'string');
    helper = MECH.MechJointSpringDamperStateHelper;
    pProp = schema.prop(cls, 'StateList', horzcat(class(helper), ' vector'));
    pProp.AccessFlags.PublicGet = 'on';
    pProp.AccessFlags.PublicSet = 'on';
    % 22 24
    % 23 24
    schema.prop(cls, 'AdjacentPrimitives', 'string vector');
    schema.prop(cls, 'WeldFoundOnBlock', 'bool');
    schema.prop(cls, 'EnableStatus', 'bool');
end % function
