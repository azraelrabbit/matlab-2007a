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
    package = findpackage('hdldefaults');
    parent = findclass(package, 'abstractRegister');
    this = schema.class(package, 'abstractRegisterProduct', parent);
    set(this, 'Description', 'abstract');
end % function
