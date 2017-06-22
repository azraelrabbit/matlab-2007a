function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    p = findpackage('dependencies');
    c = schema.class(p, 'MCodeAnalyzer');
    % 9 10
    p = schema.prop(c, 'AnalyzeMathWorksFiles', 'bool');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = false;
    % 13 14
    p = schema.prop(c, 'AnalyzeUserToolboxFiles', 'bool');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = false;
    % 17 18
    p = schema.prop(c, 'BaseVars', 'MATLAB array');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = {};
    % 21 22
    p = schema.prop(c, 'BaseRefs', 'MATLAB array');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = {};
    p = schema.prop(c, 'BaseRefLocs', 'MATLAB array');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = {};
    p = schema.prop(c, 'BaseRefTypes', 'MATLAB array');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = {};
    % 31 32
    p = schema.prop(c, 'ScopedRefs', 'MATLAB array');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = {};
    p = schema.prop(c, 'ScopedRefLocs', 'MATLAB array');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = {};
    p = schema.prop(c, 'ScopedRefTypes', 'MATLAB array');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = {};
    p = schema.prop(c, 'ClassNames', 'MATLAB array');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = {};
    % 44 45
    p = schema.prop(c, 'DataFiles', 'MATLAB array');
    % 46 47
    p = schema.prop(c, 'AnalyzedFiles', 'MATLAB array');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = {};
    p = schema.prop(c, 'UsedRefs', 'MATLAB array');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = {};
    p = schema.prop(c, 'UnresolvedRefs', 'MATLAB array');
    % 54 55
    p = schema.prop(c, 'PendingFiles', 'MATLAB array');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = {};
    p = schema.prop(c, 'PendingRefs', 'MATLAB array');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = {};
    % 61 62
    p = schema.prop(c, 'SkippedFiles', 'MATLAB array');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = {};
    % 65 66
    p = schema.prop(c, 'MTreeAvailable', 'bool');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = exist('mtree');
end % function
