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
    this = schema.class(pkg, 'ConfigurationManager');
    % 12 13
    findclass(pkg, 'ConfigurationContainer');
    % 14 15
    sharedpkg = findpackage('hdlshared');
    findclass(sharedpkg, 'HDLImplementationTable');
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    schema.prop(this, 'ModelName', 'string');
    % 22 24
    % 23 24
    schema.prop(this, 'DefaultTable', 'hdlshared.HDLImplementationTable');
    % 25 28
    % 26 28
    % 27 28
    schema.prop(this, 'HereDownNetworkTable', 'hdlshared.HDLImplementationTable');
    % 29 32
    % 30 32
    % 31 32
    schema.prop(this, 'HereOnlyNetworkTable', 'hdlshared.HDLImplementationTable');
    % 33 36
    % 34 36
    % 35 36
    schema.prop(this, 'HereDownComponentTable', 'hdlshared.HDLImplementationTable');
    % 37 40
    % 38 40
    % 39 40
    schema.prop(this, 'HereOnlyComponentTable', 'hdlshared.HDLImplementationTable');
    % 41 45
    % 42 45
    % 43 45
    % 44 45
    schema.prop(this, 'FrontEndStopTable', 'hdlshared.HDLImplementationTable');
    % 46 47
    schema.prop(this, 'MergedConfigContainer', 'slhdlcoder.ConfigurationContainer');
end % function
