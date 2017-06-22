function schema
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    hCreateInPackage = findpackage('RTWConfiguration');
    % 22 24
    % 23 24
    hThisClass = schema.class(hCreateInPackage, 'Resource');
    % 25 27
    % 26 27
    hThisProp = schema.prop(hThisClass, 'id', 'string');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = '''resource''';
    % 30 31
    hThisProp = schema.prop(hThisClass, 'resources', 'string vector');
    % 32 33
    hThisProp = schema.prop(hThisClass, 'allocations', 'handle');
end % function
