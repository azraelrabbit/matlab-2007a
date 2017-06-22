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
    hThisClass = schema.class(hCreateInPackage, 'BuildInfoKeyValuePair', hBaseClass);
    % 15 18
    % 16 18
    % 17 18
    hThisProp = schema.prop(hThisClass, 'Key', 'string');
    hThisProp.FactoryValue = '';
    hThisProp = schema.prop(hThisClass, 'Value', 'string');
    hThisProp.FactoryValue = '';
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    % 27 28
    m = schema.method(hThisClass, 'isHierarchical');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 33 36
    % 34 36
    % 35 36
    m = schema.method(hThisClass, 'getPreferredProperties');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string vector'};
end % function
