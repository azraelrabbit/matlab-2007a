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
    hBasePackage = findpackage('MECH');
    hBaseObj = hBasePackage.findclass('PmMechGuiObj');
    hCreateInPackage = hBasePackage;
    % 14 16
    % 15 16
    hThisClass = schema.class(hCreateInPackage, 'PmMechJointPrimSel', hBaseObj);
    % 17 19
    % 18 19
    p = schema.prop(hThisClass, 'BlockHandle', 'handle');
    p.Description = 'Handle of the source SL block.';
    % 21 22
    p = schema.prop(hThisClass, 'BlkParamName', 'string');
    p.Description = 'Name of the block parameter to bind to.';
    % 24 25
    p = schema.prop(hThisClass, 'Label', 'string');
    p.Description = 'Name of the block parameter to bind to.';
    % 27 28
    p = schema.prop(hThisClass, 'LabelAttrb', 'int');
    p.Description = 'Name of the block parameter to bind to.';
    % 30 31
    p = schema.prop(hThisClass, 'ChangeCBFcn', 'string');
    p.Description = 'Name of the callback function to call.';
    % 33 34
    p = schema.prop(hThisClass, 'Choices', 'string vector');
    % 35 36
    p = schema.prop(hThisClass, 'WatchPort', 'string');
    p.Description = 'Allow client to indicate on which port to look forjoint block connection.';
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    % 42 43
    helper = MECH.MechPrimitiveHelper;
    p = schema.prop(hThisClass, 'PrimList', horzcat(class(helper), ' vector'));
    p.AccessFlags.PublicGet = 'on';
    p.AccessFlags.PublicSet = 'on';
    % 47 48
    p = schema.prop(hThisClass, 'Value', 'string');
    % 49 51
    % 50 51
    p = schema.prop(hThisClass, 'EnableStatus', 'bool');
    % 52 54
    % 53 54
    p = schema.prop(hThisClass, 'IsConnected', 'bool');
    % 55 57
    % 56 57
    p = schema.prop(hThisClass, 'SelIndex', 'int');
    % 58 59
    p = schema.prop(hThisClass, 'JointBlockHandle', 'handle');
    % 60 62
    % 61 62
    p = schema.prop(hThisClass, 'Values', 'mxArray');
    % 63 65
    % 64 65
    p = schema.prop(hThisClass, 'Entries', 'string vector');
    % 66 69
    % 67 69
    % 68 69
    m = schema.method(hThisClass, 'Apply');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 74 75
    m = schema.method(hThisClass, 'Realize');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 80 81
    m = schema.method(hThisClass, 'getPmSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
    s.OutputTypes = {'bool','mxArray'};
end % function
