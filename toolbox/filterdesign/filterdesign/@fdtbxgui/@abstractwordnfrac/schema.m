function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdtbxgui');
    c = schema.class(pk, 'abstractwordnfrac', findclass(findpackage('siggui'), 'sigcontainer'));
    set(c, 'Description', 'abstract');
    % 11 12
    p = schema.prop(c, 'Name', 'string');
    set(p, 'SetFunction', @setname, 'FactoryValue', 'Coefficients');
    % 14 15
    p = schema.prop(c, 'FracLabels', 'string vector');
    set(p, 'SetFunction', @setfraclabels, 'FactoryValue', {'Numerator'});
    % 17 18
    p = schema.prop(c, 'WordLength', 'string');
    set(p, 'SetFunction', @setwordlength, 'GetFunction', @getwordlength, 'FactoryValue', '16');
    % 20 22
    % 21 22
    p = schema.prop(c, 'FracLengths', 'string vector');
    set(p, 'SetFunction', @setfraclengths, 'GetFunction', @getfraclengths, 'FactoryValue', {'15','15','15','15'});
    % 24 26
    % 25 26
    schema.prop(c, 'Abbreviate', 'on/off');
end % function
