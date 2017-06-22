function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'abstracttypewband', pk.findclass('abstracttypewspecs'));
    set(c, 'Description', 'abstract');
    % 11 12
    p = schema.prop(c, 'privBand', 'posint');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off', 'FactoryValue', 2.0);
    % 14 15
    p = schema.prop(c, 'Band', 'posint');
    set(p, 'SetFunction', @set_band, 'GetFunction', @get_band, 'AccessFlags.Init', 'Off');
end % function
