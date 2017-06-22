function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'src', pk.findclass('interp'));
    % 10 11
    p = schema.prop(c, 'privDecimationFactor', 'posint');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off', 'FactoryValue', 2.0, 'AccessFlags.Serialize', 'Off');
    % 13 15
    % 14 15
    p = schema.prop(c, 'DecimationFactor', 'posint');
    set(p, 'SetFunction', @setdecimationfactor, 'GetFunction', @getdecimationfactor);
end % function
