function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hDeriveFromPackage = findpackage('DAStudio');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'Object');
    hCreateInPackage = findpackage('Simulink');
    % 12 14
    % 13 14
    dummy = findclass(hCreateInPackage, 'document');
    dummy = findclass(hCreateInPackage, 'directory');
    % 16 18
    % 17 18
    hThisClass = schema.class(hCreateInPackage, 'code', hDeriveFromClass);
    % 19 21
    % 20 21
    hThisProp = schema.prop(hThisClass, 'DisplayName', 'string');
    hThisProp.FactoryValue = '';
    hThisProp = schema.prop(hThisClass, 'ModelName', 'string');
    hThisProp.FactoryValue = '';
    hThisProp = schema.prop(hThisClass, 'BuildTime', 'string');
    hThisProp.FactoryValue = '';
    % 27 28
    hThisProp = schema.prop(hThisClass, 'modelRefsAll', 'string vector');
    hThisProp.FactoryValue = {};
    % 30 31
    hThisProp = schema.prop(hThisClass, 'modelRefs', 'string vector');
    hThisProp.FactoryValue = {};
    % 33 36
    % 34 36
    % 35 36
    if isempty(findtype('SIMULINK_CODE_NODETYPE_ENUM'))
        schema.EnumType('SIMULINK_CODE_NODETYPE_ENUM', {'TopModel','ReferencedModel','Subsystem'}, [1.0 2.0 3.0]);
        % 38 39
    end % if
    hThisProp = schema.prop(hThisClass, 'NodeType', 'SIMULINK_CODE_NODETYPE_ENUM');
    hThisProp.FactoryValue = 'TopModel';
    hThisProp = schema.prop(hThisClass, 'isOutofDate', 'bool');
    hThisProp.FactoryValue = 0.0;
    hThisProp = schema.prop(hThisClass, 'htmlreport', 'string');
    hThisProp.FactoryValue = '';
    hThisProp = schema.prop(hThisClass, 'BuildDirRoot', 'string');
    hThisProp.FactoryValue = '';
    hThisProp = schema.prop(hThisClass, 'BuildDir', 'string');
    hThisProp.FactoryValue = '';
    hThisProp = schema.prop(hThisClass, 'SharedDir', 'string');
    hThisProp.FactoryValue = '';
    % 52 54
    % 53 54
    hThisProp = schema.prop(hThisClass, 'BuildDirSrcObj', 'Simulink.directory');
    % 55 56
    hThisProp = schema.prop(hThisClass, 'BuildDirHelperObj', 'Simulink.directory');
    hThisProp = schema.prop(hThisClass, 'SharedDirObj', 'Simulink.directory');
    hThisProp = schema.prop(hThisClass, 'ConfigSetObj', 'Simulink.ConfigSet');
    hThisProp = schema.prop(hThisClass, 'htmlReportObj', 'Simulink.document vector');
    % 60 62
    % 61 62
    hThisProp = schema.prop(hThisClass, 'submodels', 'Simulink.code vector');
    hThisProp.FactoryValue = {};
    % 64 66
    % 65 66
    hThisProp = schema.prop(hThisClass, 'subsystems', 'Simulink.code vector');
    hThisProp.FactoryValue = {};
    % 68 72
    % 69 72
    % 70 72
    % 71 72
    hThisProp = schema.prop(hThisClass, 'SystemMap', 'string vector');
    hThisProp.FactoryValue = {};
    hThisProp = schema.prop(hThisClass, 'SourceSubsystemName', 'string');
    hThisProp.FactoryValue = '';
    % 76 80
    % 77 80
    % 78 80
    % 79 80
    m = schema.method(hThisClass, 'getDisplayLabel');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 85 86
    m = schema.method(hThisClass, 'getFullName');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 91 92
    m = schema.method(hThisClass, 'getDisplayIcon');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 97 98
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 103 104
    m = schema.method(hThisClass, 'isHierarchical');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 109 110
    m = schema.method(hThisClass, 'getChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 115 116
    m = schema.method(hThisClass, 'getHierarchicalChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
end % function
