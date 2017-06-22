function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('dspopts');
    c = schema.class(pk, 'timeresp', pk.findclass('abstractoptionswfs'));
    % 10 11
    if isempty(findtype('ImpulseLengthOptions'))
        schema.EnumType('ImpulseLengthOptions', {'Default','Specified'});
    end % if
    % 14 15
    schema.prop(c, 'LengthOption', 'ImpulseLengthOptions');
    % 16 17
    p = schema.prop(c, 'Length', 'mxArray');
    set(p, 'AccessFlags.Init', 'Off', 'SetFunction', @set_length, 'GetFunction', @get_length);
    % 19 22
    % 20 22
    % 21 22
    p = schema.prop(c, 'privLength', 'int32');
    set(p, 'FactoryValue', 20.0, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 24 25
end % function
