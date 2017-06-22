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
    package = findpackage('hdlbuiltinimpl');
    parent = findclass(package, 'HDLDirectCodeGen');
    % 16 17
    package = findpackage('hdldefaults');
    this = schema.class(package, 'VariableSelectorHDLEmission', parent);
end % function
