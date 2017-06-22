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
    mlock;
    % 11 13
    % 12 13
    package = findpackage('hdldefaults');
    parent = findclass(package, 'abstractRegister');
    this = schema.class(package, 'MemoryHDLEmission', parent);
end % function
