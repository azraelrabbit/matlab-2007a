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
    pkg = findpackage('hdlshared');
    this = schema.class(pkg, 'HDLImplementationTable');
    % 12 13
    findclass(pkg, 'HDLImplementationSet');
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
    schema.prop(this, 'Sets', 'mxArray');
end % function
