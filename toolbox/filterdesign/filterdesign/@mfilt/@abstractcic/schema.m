function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('mfilt');
    dpk = findpackage('sigdatatypes');
    % 10 12
    % 11 12
    c = schema.class(pk, 'abstractcic', pk.findclass('abstractsiso'));
    c.Description = 'abstract';
    % 14 16
    % 15 16
    findclass(dpk, 'posint')
    % 17 18
    p = schema.prop(c, 'DifferentialDelay', 'posint');
    set(p, 'FactoryValue', 1.0, 'SetFunction', @setdiffdelay, 'GetFunction', @getdiffdelay);
    % 20 21
    p = schema.prop(c, 'privDifferentialDelay', 'posint');
    set(p, 'FactoryValue', 1.0, 'AccessFlags.PublicGet', 'Off', 'AccessFlags.PublicSet', 'Off');
    % 23 25
    % 24 25
    p = schema.prop(c, 'NumberOfStages', 'posint');
    siguddutils('setupobsolete', p, 'NumberOfSections');
    % 27 28
    p = schema.prop(c, 'NumberOfSections', 'posint');
    set(p, 'FactoryValue', 2.0, 'SetFunction', @setnumstages, 'GetFunction', @getnumstages);
    p.AccessFlags.Serialize = 'off';
    % 31 32
    p = schema.prop(c, 'privNumberOfStages', 'posint');
    set(p, 'FactoryValue', 2.0, 'AccessFlags.PublicGet', 'Off', 'AccessFlags.PublicSet', 'Off');
    % 34 36
    % 35 36
    p = schema.prop(c, 'InputBitWidth', 'mxArray');
    siguddutils('setupobsolete', p, 'InputWordLength');
    % 38 40
    % 39 40
    p = schema.prop(c, 'OutputBitWidth', 'mxArray');
    siguddutils('setupobsolete', p, 'OutputWordLength');
    % 42 44
    % 43 44
    if isempty(findtype('filterdesign_cic_arith'))
        strs = {'fixed'};
        schema.EnumType('filterdesign_cic_arith', strs);
    end % if
    % 48 54
    % 49 54
    % 50 54
    % 51 54
    % 52 54
    % 53 54
    p = schema.prop(c, 'Arithmetic', 'filterdesign_cic_arith');
    p.AccessFlags.PublicGet = 'on';
    p.AccessFlags.PublicSet = 'on';
end % function
