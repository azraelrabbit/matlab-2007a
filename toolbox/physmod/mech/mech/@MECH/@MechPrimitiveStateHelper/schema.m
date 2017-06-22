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
    hThisClass = schema.class(hCreateInPackage, 'MechPrimitiveStateHelper');
    % 12 15
    % 13 15
    % 14 15
    schema.prop(hThisClass, 'Enabled', 'bool');
    schema.prop(hThisClass, 'Name', 'string');
    schema.prop(hThisClass, 'Position', 'string');
    schema.prop(hThisClass, 'Velocity', 'string');
    schema.prop(hThisClass, 'Type', 'string');
    % 20 21
    schema.prop(hThisClass, 'PosUnit', 'int');
    schema.prop(hThisClass, 'angUnit', 'int');
    schema.prop(hThisClass, 'velUnit', 'int');
    schema.prop(hThisClass, 'angVelUnit', 'int');
    % 25 26
    schema.prop(hThisClass, 'PosUnitChoices', 'mxArray');
    schema.prop(hThisClass, 'angUnitChoices', 'mxArray');
    schema.prop(hThisClass, 'velUnitChoices', 'mxArray');
    schema.prop(hThisClass, 'angVelUnitChoices', 'mxArray');
    % 30 33
    % 31 33
    % 32 33
    m = schema.method(hThisClass, 'CopyPrimitiveStateObj');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {'bool'};
    % 38 39
    m = schema.method(hThisClass, 'SetPrimitiveStateObj');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {'handle'};
    % 44 45
    m = schema.method(hThisClass, 'CreatePrimitiveStateObj');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle'};
end % function
