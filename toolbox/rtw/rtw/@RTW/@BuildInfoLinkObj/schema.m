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
    hCreateInPackage = findpackage('RTW');
    hBaseClass = findclass(hCreateInPackage, 'BuildInfoBuildObj');
    % 12 14
    % 13 14
    hThisClass = schema.class(hCreateInPackage, 'BuildInfoLinkObj', hBaseClass);
    % 15 18
    % 16 18
    % 17 18
    hThisProp = schema.prop(hThisClass, 'Name', 'string');
    hThisProp.FactoryValue = 'Library';
    % 20 22
    % 21 22
    hThisProp = schema.prop(hThisClass, 'Path', 'string');
    hThisProp.FactoryValue = 'Library';
    % 24 26
    % 25 26
    hThisProp = schema.prop(hThisClass, 'Precompiled', 'bool');
    hThisProp.FactoryValue = false;
    % 28 30
    % 29 30
    hThisProp = schema.prop(hThisClass, 'LinkOnly', 'bool');
    hThisProp.FactoryValue = false;
    % 32 34
    % 33 34
    hThisProp = schema.prop(hThisClass, 'LinkPriority', 'int32');
    hThisProp.FactoryValue = 1000.0;
    % 36 38
    % 37 38
    m = schema.method(hThisClass, 'getDisplayLabel');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 43 44
    m = schema.method(hThisClass, 'areChildrenOrdered');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 49 50
    m = schema.method(hThisClass, 'isHierarchical');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 55 56
    m = schema.method(hThisClass, 'getPreferredProperties');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string vector'};
    % 61 62
    m = schema.method(hThisClass, 'getHierarchicalChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 67 68
    m = schema.method(hThisClass, 'getChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
end % function
