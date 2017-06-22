function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('FilterDesignDialog');
    c = schema.class(pk, 'OctaveDesign', pk.findclass('AbstractDesign'));
    % 10 11
    p = schema.prop(c, 'BandsPerOctave', 'string');
    set(p, 'FactoryValue', '1');
    % 13 14
    p = schema.prop(c, 'F0', 'string');
    set(p, 'FactoryValue', '1000');
    % 16 17
    p = schema.prop(c, 'FrequencyUnitsListener', 'handle.listener');
    set(p, 'AccessFlags.PublicSet', 'off', 'AccessFlags.PublicGet', 'off');
end % function
