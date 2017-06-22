function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    package = findpackage('dspfixptddg');
    parent = findclass(package, 'DataTypeRow');
    this = schema.class(package, 'DataTypeRowFractional', parent);
    % 11 12
    schema.prop(this, 'BestPrecString', 'string');
    schema.prop(this, 'NumIntegerBits', 'double');
    schema.prop(this, 'isSigned', 'bool');
    schema.prop(this, 'SignedText', 'string');
    schema.prop(this, 'SignednessVisible', 'string');
end % function
