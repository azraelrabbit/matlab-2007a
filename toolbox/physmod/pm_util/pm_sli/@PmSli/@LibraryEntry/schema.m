function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hCreateInPackage = findpackage('PmSli');
    hThisClass = schema.class(hCreateInPackage, 'LibraryEntry');
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    p = schema.prop(hThisClass, 'Name', 'string');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'on';
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    p = schema.prop(hThisClass, 'File', 'string');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'on';
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    p = schema.prop(hThisClass, 'Product', 'string');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'on';
    % 30 37
    % 31 37
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    % 36 37
    p = schema.prop(hThisClass, 'Context', 'string');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'on';
    % 40 47
    % 41 47
    % 42 47
    % 43 47
    % 44 47
    % 45 47
    % 46 47
    p = schema.prop(hThisClass, 'IsValid', 'bool');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'on';
    % 50 55
    % 51 55
    % 52 55
    % 53 55
    % 54 55
    p = schema.prop(hThisClass, 'Descriptor', 'string');
    % 56 61
    % 57 61
    % 58 61
    % 59 61
    % 60 61
    p = schema.prop(hThisClass, 'RegistrationFile', 'string');
    % 62 66
    % 63 66
    % 64 66
    % 65 66
    icon = PmSli.Icon;
    p = schema.prop(hThisClass, 'Icon', class(icon));
    % 68 74
    % 69 74
    % 70 74
    % 71 74
    % 72 74
    % 73 74
    p = schema.prop(hThisClass, 'DocumentationFcn', 'MATLAB callback');
    % 75 79
    % 76 79
    % 77 79
    % 78 79
    schema.method(hThisClass, 'defaultDocumentationFcn', 'static');
    % 80 81
end % function
