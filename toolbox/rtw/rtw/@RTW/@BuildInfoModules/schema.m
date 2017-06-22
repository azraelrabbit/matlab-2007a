function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hCreateInPackage = findpackage('RTW');
    hBaseClass = findclass(hCreateInPackage, 'BuildInfoClass');
    % 11 13
    % 12 13
    hThisClass = schema.class(hCreateInPackage, 'BuildInfoModules', hBaseClass);
    % 14 16
    % 15 16
    hThisProp = schema.prop(hThisClass, 'Paths', 'handle vector');
    hThisProp.FactoryValue = [];
    hThisProp = schema.prop(hThisClass, 'Files', 'handle vector');
    hThisProp.FactoryValue = [];
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    m = schema.method(hThisClass, 'isHierarchical');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 29 32
    % 30 32
    % 31 32
    m = schema.method(hThisClass, 'getPreferredProperties');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string vector'};
    % 37 38
    m = schema.method(hThisClass, 'getHierarchicalChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 43 44
    m = schema.method(hThisClass, 'getChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 49 50
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
end % function
