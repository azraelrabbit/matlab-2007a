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
    package = findpackage('hdlbuiltinimpl');
    parent = findclass(package, 'HDLDirectCodeGen');
    % 12 13
    this = schema.class(package, 'VerilogEmission', parent);
end % function
