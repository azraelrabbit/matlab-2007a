function schema
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    hBasePackage = findpackage('PmSli');
    hBaseClass = hBasePackage.findclass('LibraryEntry');
    % 13 15
    % 14 15
    hCreateInPackage = findpackage('NetworkEngine');
    hThisClass = schema.class(hCreateInPackage, 'LibraryEntry', hBaseClass);
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    p = schema.prop(hThisClass, 'Object', 'NetworkEngine.Library');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'on';
    % 24 28
    % 25 28
    % 26 28
    % 27 28
    p = schema.prop(hThisClass, 'Annotation', 'string');
    % 29 33
    % 30 33
    % 31 33
    % 32 33
    p = schema.prop(hThisClass, 'ForwardingTable', 'MATLAB array');
    % 34 38
    % 35 38
    % 36 38
    % 37 38
    p = schema.prop(hThisClass, 'BaseBlockSize', 'double');
    % 39 40
end % function
