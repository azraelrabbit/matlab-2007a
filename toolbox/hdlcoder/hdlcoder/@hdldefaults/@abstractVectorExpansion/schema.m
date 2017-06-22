function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    mlock;
    % 9 11
    % 10 11
    package = findpackage('hdlbuiltinimpl');
    parent = findclass(package, 'HDLDirectCodeGen');
    % 13 14
    package = findpackage('hdldefaults');
    this = schema.class(package, 'abstractVectorExpansion', parent);
    set(this, 'Description', 'abstract');
end % function
