function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hCreateInPackage = findpackage('PmSli');
    hThisClass = schema.class(hCreateInPackage, 'LibraryDatabase');
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    p = schema.prop(hThisClass, 'Entries', 'MATLAB array');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    p = schema.prop(hThisClass, 'Listener', 'handle.listener');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
    % 25 26
end % function
