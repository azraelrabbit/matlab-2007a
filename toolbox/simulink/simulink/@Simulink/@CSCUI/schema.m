function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    hCreateInPackage = findpackage('Simulink');
    % 7 10
    % 8 10
    hDeriveFromPackage = findpackage('DAStudio');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'Object');
    % 11 14
    % 12 14
    hThisClass = schema.class(hCreateInPackage, 'CSCUI', hDeriveFromClass);
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    if isempty(findtype('CSCUI_Enum_CommentChoice'))
        schema.EnumType('CSCUI_Enum_CommentChoice', {'None';'ByTLC';'Specify'});
        % 21 25
        % 22 25
        % 23 25
    end
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    hThisProp = schema.prop(hThisClass, 'IsAdvanceMode', 'bool');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = logical(0);
    % 33 35
    hThisProp = schema.prop(hThisClass, 'IsDirty', 'bool');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = logical(0);
    % 37 39
    hThisProp = schema.prop(hThisClass, 'PackageNames', 'string vector');
    hThisProp.FactoryValue = {};
    % 40 42
    hThisProp = schema.prop(hThisClass, 'CurrPackage', 'string');
    hThisProp.FactoryValue = '';
    % 43 45
    hThisProp = schema.prop(hThisClass, 'AllDefns', 'mxArray');
    hThisProp.FactoryValue = {[],[]};
    % 46 49
    % 47 49
    hThisProp = schema.prop(hThisClass, 'Index', 'mxArray');
    hThisProp.FactoryValue = [0.0 0.0];
    % 50 54
    % 51 54
    % 52 54
    hThisProp = schema.prop(hThisClass, 'MainActiveTab', 'int');
    hThisProp.FactoryValue = 0.0;
    % 55 57
    hThisProp = schema.prop(hThisClass, 'CSCActiveSubTab', 'int');
    hThisProp.FactoryValue = 0.0;
    % 58 60
    hThisProp = schema.prop(hThisClass, 'RegFileInfo', 'mxArray');
    hThisProp.FactoryValue = {'','',''};
    % 61 63
    hThisProp = schema.prop(hThisClass, 'InvalidList', 'mxArray');
    hThisProp.FactoryValue = {{},{}};
    % 64 66
    hThisProp = schema.prop(hThisClass, 'PreviewDefnBak', 'mxArray');
    hThisProp.FactoryValue = {[],[]};
    % 67 73
    % 68 73
    % 69 73
    % 70 73
    % 71 73
    hThisProp = schema.prop(hThisClass, 'TESTING_DONT_ASK_DONT_SAVE', 'int');
    hThisProp.FactoryValue = 0.0;
    % 74 80
    % 75 80
    % 76 80
    % 77 80
    % 78 80
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 84 86
    m = schema.method(hThisClass, 'getSchema_packageSelGrp');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'mxArray'};
    % 90 92
    m = schema.method(hThisClass, 'getSchema_mainTabs');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'mxArray'};
    % 96 98
    m = schema.method(hThisClass, 'getSchema_saveGrp');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'mxArray'};
    % 102 104
    m = schema.method(hThisClass, 'getSchema_validGrp');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'mxArray'};
    % 108 110
    m = schema.method(hThisClass, 'getSchema_previewGrp');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'mxArray'};
    % 114 116
    m = schema.method(hThisClass, 'selectPackage');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
    s.OutputTypes = {};
    % 120 122
    m = schema.method(hThisClass, 'getCurrDefn');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'mxArray'};
    % 126 128
    m = schema.method(hThisClass, 'getCurrCSCDefn');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'mxArray'};
    % 132 134
    m = schema.method(hThisClass, 'getCurrMSDefn');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'mxArray'};
    % 138 140
    m = schema.method(hThisClass, 'setIndex');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
    s.OutputTypes = {};
    % 144 146
    m = schema.method(hThisClass, 'nameDefn');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
    s.OutputTypes = {};
    % 150 152
    m = schema.method(hThisClass, 'newDefn');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 156 158
    m = schema.method(hThisClass, 'copyDefn');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 162 164
    m = schema.method(hThisClass, 'upDefn');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 168 170
    m = schema.method(hThisClass, 'downDefn');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 174 176
    m = schema.method(hThisClass, 'removeDefn');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 180 182
    m = schema.method(hThisClass, 'loadCurrPackage');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 186 188
    m = schema.method(hThisClass, 'saveCurrPackage');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 192 194
    m = schema.method(hThisClass, 'promptSave');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'bool'};
    % 198 200
    m = schema.method(hThisClass, 'validDefn');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 204 206
    m = schema.method(hThisClass, 'validateAll');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 210 212
    m = schema.method(hThisClass, 'instanceComboFcn');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray','mxArray','mxArray'};
    s.OutputTypes = {};
    % 216 218
    m = schema.method(hThisClass, 'show');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 222 224
    m = schema.method(hThisClass, 'setPropAndDirty');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray','mxArray','mxArray','mxArray'};
    s.OutputTypes = {};
end
