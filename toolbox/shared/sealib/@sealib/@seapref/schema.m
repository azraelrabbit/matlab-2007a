function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    package = findpackage('sealib');
    this = schema.class(package, 'seapref');
    % 10 11
    property = schema.prop(this, 'ShowFixedPointProperties', 'bool');
    property.FactoryValue = false;
end % function
