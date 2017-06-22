function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hCreateInPackage = findpackage('MECH');
    % 9 11
    % 10 11
    hThisClass = schema.class(hCreateInPackage, 'MechJointSpringDamperStateHelper');
    % 12 15
    % 13 15
    % 14 15
    schema.prop(hThisClass, 'IsSet', 'bool');
    schema.prop(hThisClass, 'Name', 'string');
    schema.prop(hThisClass, 'Spring_k', 'string');
    schema.prop(hThisClass, 'Damper_b', 'string');
    schema.prop(hThisClass, 'Offset_x0', 'string');
    % 20 21
    schema.prop(hThisClass, 'PositionUnits', 'int');
    schema.prop(hThisClass, 'VelocityUnits', 'int');
    schema.prop(hThisClass, 'AngleUnits', 'int');
    schema.prop(hThisClass, 'AngleVelocityUnits', 'int');
    schema.prop(hThisClass, 'ForceUnits', 'int');
    schema.prop(hThisClass, 'TorqueUnits', 'int');
    % 27 28
    schema.prop(hThisClass, 'PositionUnitsChoices', 'mxArray');
    schema.prop(hThisClass, 'VelocityUnitsChoices', 'mxArray');
    schema.prop(hThisClass, 'AngleUnitsChoices', 'mxArray');
    schema.prop(hThisClass, 'AngleVelocityUnitsChoices', 'mxArray');
    schema.prop(hThisClass, 'ForceUnitsChoices', 'mxArray');
    schema.prop(hThisClass, 'TorqueUnitsChoices', 'mxArray');
    % 34 36
    % 35 36
    m = schema.method(hThisClass, 'CopyJointSpringDamperStateObj');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {'bool'};
    % 41 42
    m = schema.method(hThisClass, 'SetJointSpringDamperStateObj');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {'handle'};
    % 47 48
    m = schema.method(hThisClass, 'CreateJointSpringDamperStateObj');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle'};
end % function
