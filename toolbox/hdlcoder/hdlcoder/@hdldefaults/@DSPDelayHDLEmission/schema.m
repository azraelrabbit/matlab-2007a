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
    % 11 14
    % 12 14
    % 13 14
    package = findpackage('hdldefaults');
    parent = findclass(package, 'abstractRegister');
    this = schema.class(package, 'DSPDelayHDLEmission', parent);
end % function
