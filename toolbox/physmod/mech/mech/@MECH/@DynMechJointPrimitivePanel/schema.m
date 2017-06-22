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
    hCreateInPackage = findpackage('MECH');
    hBaseObj = hCreateInPackage.findclass('PmMechJointPrimitivePanel');
    % 13 15
    % 14 15
    hThisClass = schema.class(hCreateInPackage, 'DynMechJointPrimitivePanel', hBaseObj);
    % 16 18
    % 17 18
    schema.prop(hThisClass, 'RemainingPrisDoF', 'int16');
    schema.prop(hThisClass, 'RemainingRotDoF', 'int16');
    schema.prop(hThisClass, 'FocusItem', 'mxArray');
    schema.prop(hThisClass, 'DummyProp', 'string');
    schema.prop(hThisClass, 'AddButnTag', 'string');
    schema.prop(hThisClass, 'DelButnTag', 'string');
    schema.prop(hThisClass, 'UpButnTag', 'string');
    schema.prop(hThisClass, 'DownButnTag', 'string');
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    m = schema.method(hThisClass, 'Render');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
    s.OutputTypes = {'bool','mxArray'};
    % 35 37
    % 36 37
    m = schema.method(hThisClass, 'OnCutCheckBox');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
    % 41 42
    m = schema.method(hThisClass, 'OnAddButton');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {};
    % 47 48
    m = schema.method(hThisClass, 'OnDelButton');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {};
    % 53 54
    m = schema.method(hThisClass, 'OnUpButton');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {};
    % 59 60
    m = schema.method(hThisClass, 'OnDownButton');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {};
end % function
