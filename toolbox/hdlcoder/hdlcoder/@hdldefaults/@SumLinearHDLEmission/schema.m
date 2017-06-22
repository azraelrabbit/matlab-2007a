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
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    package = findpackage('hdldefaults');
    parent = findclass(package, 'abstractVectorExpansion');
    % 18 19
    this = schema.class(package, 'SumLinearHDLEmission', parent);
end % function
