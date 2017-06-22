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
    hBaseClass = findclass(hCreateInPackage, 'BuildInfoClass');
    % 12 14
    % 13 14
    hThisClass = schema.class(hCreateInPackage, 'BuildInfoOptions', hBaseClass);
    % 15 17
    % 16 17
    hThisProp = schema.prop(hThisClass, 'Defines', 'handle vector');
    hThisProp.FactoryValue = [];
    hThisProp = schema.prop(hThisClass, 'CompileFlags', 'handle vector');
    hThisProp.FactoryValue = [];
    hThisProp = schema.prop(hThisClass, 'LinkFlags', 'handle vector');
    hThisProp.FactoryValue = [];
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    m = schema.method(hThisClass, 'isHierarchical');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 34 37
    % 35 37
    % 36 37
    m = schema.method(hThisClass, 'getPreferredProperties');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string vector'};
    % 42 44
    % 43 44
    m = schema.method(hThisClass, 'getHierarchicalChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 49 51
    % 50 51
    m = schema.method(hThisClass, 'getChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 56 57
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
end % function
