function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    mlock;
    % 9 10
    pkg = findpackage('slhdlcoder');
    this = schema.class(pkg, 'HDLImplDatabase');
    % 12 27
    % 13 27
    % 14 27
    % 15 27
    % 16 27
    % 17 27
    % 18 27
    % 19 27
    % 20 27
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    p = schema.prop(this, 'BlockDB', 'MATLAB array');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 30 48
    % 31 48
    % 32 48
    % 33 48
    % 34 48
    % 35 48
    % 36 48
    % 37 48
    % 38 48
    % 39 48
    % 40 48
    % 41 48
    % 42 48
    % 43 48
    % 44 48
    % 45 48
    % 46 48
    % 47 48
    p = schema.prop(this, 'DescriptionDB', 'MATLAB array');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 51 56
    % 52 56
    % 53 56
    % 54 56
    % 55 56
    p = schema.prop(this, 'ConfigFiles', 'MATLAB array');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 59 63
    % 60 63
    % 61 63
    % 62 63
    p = schema.prop(this, 'LibraryDB', 'MATLAB array');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 66 69
    % 67 69
    % 68 69
    p = schema.prop(this, 'MessageID', 'string');
    p.FactoryValue = 'HDLImplDatabase:';
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
end % function
