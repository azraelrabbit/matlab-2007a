function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    p = findpackage('dependencies');
    c = schema.class(p, 'AnalysisOptions');
    % 9 10
    p = schema.prop(c, 'AnalyzeMathWorksFiles', 'bool');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = false;
    p.SetFunction = @SetProp;
    % 14 15
    p = schema.prop(c, 'AnalyzeUserToolboxFiles', 'bool');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = true;
    p.SetFunction = @SetProp;
    % 19 20
    p = schema.prop(c, 'StoreReferences', 'bool');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = true;
    p.SetFunction = @SetProp;
    % 24 25
    p = schema.prop(c, 'FindLibraryLinks', 'bool');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = true;
    p.SetFunction = @SetProp;
    % 29 30
    p = schema.prop(c, 'FindModelRefs', 'bool');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = true;
    p.SetFunction = @SetProp;
    % 34 35
    p = schema.prop(c, 'FindSFunctions', 'bool');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = true;
    p.SetFunction = @SetProp;
    % 39 40
    p = schema.prop(c, 'FindCallbackFiles', 'bool');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = true;
    p.SetFunction = @SetProp;
    % 44 45
    p = schema.prop(c, 'FindCodeGenFiles', 'bool');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = true;
    p.SetFunction = @SetProp;
    % 49 50
    p = schema.prop(c, 'FindUserDependencies', 'bool');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = true;
    p.SetFunction = @SetProp;
    % 54 55
    p = schema.prop(c, 'AllowUnsavedChanges', 'bool');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = true;
    p.SetFunction = @SetProp;
    % 59 60
    p = schema.prop(c, 'FindExplicitlyReferencedFiles', 'bool');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = true;
    % 63 64
    p.SetFunction = @SetProp;
    % 65 66
    p = schema.prop(c, 'AnalyzeStateflow', 'bool');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = true;
    p.SetFunction = @SetProp;
    % 70 71
    schema.method(c, 'OptFullAnalysis', 'static');
    schema.method(c, 'OptMdlsOnly', 'static');
    schema.method(c, 'FromXML', 'static');
    schema.method(c, 'getAnalysisTypes', 'static');
    % 75 80
    % 76 80
    % 77 80
    % 78 80
    % 79 80
    p = schema.prop(c, 'Ready', 'bool');
    p.AccessFlags.Init = 'on';
    p.AccessFlags.PublicSet = 'off';
    p.FactoryValue = false;
    % 84 85
    m = schema.method(c, 'SetReady');
    s = m.Signature;
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
end % function
function newval = SetProp(obj, newval)
    % 91 94
    % 92 94
    % 93 94
    if obj.Ready
        error('Properties cannot be changed after Ready flag is set');
    end % if
end % function
