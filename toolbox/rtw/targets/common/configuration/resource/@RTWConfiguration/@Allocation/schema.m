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
    hCreateInPackage = findpackage('RTWConfiguration');
    % 11 13
    % 12 13
    hThisClass = schema.class(hCreateInPackage, 'Allocation');
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    hThisProp = schema.prop(hThisClass, 'realloc_callback', 'MATLAB array');
    % 19 21
    % 20 21
    hThisProp = schema.prop(hThisClass, 'host_object', 'MATLAB array');
    % 22 24
    % 23 24
    hThisProp = schema.prop(hThisClass, 'host_type', 'AllocationHostType');
    % 25 27
    % 26 27
    hThisProp = schema.prop(hThisClass, 'value', 'string vector');
    % 28 30
    % 29 30
    hThisProp = schema.prop(hThisClass, 'auto', 'bool');
end % function
