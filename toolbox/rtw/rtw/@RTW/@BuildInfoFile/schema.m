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
    hThisClass = schema.class(hCreateInPackage, 'BuildInfoFile', hBaseClass);
    % 15 17
    % 16 17
    hThisProp = schema.prop(hThisClass, 'FileName', 'string');
    hThisProp.FactoryValue = '';
    hThisProp = schema.prop(hThisClass, 'Path', 'string');
    hThisProp.FactoryValue = '';
    % 21 23
    % 22 23
    hThisProp = schema.prop(hThisClass, 'Options', 'handle');
    hThisProp.FactoryValue = [];
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    % 30 31
    m = schema.method(hThisClass, 'isHierarchical');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 36 40
    % 37 40
    % 38 40
    % 39 40
    m = schema.method(hThisClass, 'getPreferredProperties');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string vector'};
    % 45 48
    % 46 48
    % 47 48
    m = schema.method(hThisClass, 'getDisplayLabel');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 53 54
    m = schema.method(hThisClass, 'getHierarchicalChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 59 60
    m = schema.method(hThisClass, 'getChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
end % function
