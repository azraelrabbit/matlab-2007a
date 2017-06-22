function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pk = findpackage('doppler');
    % 10 12
    % 11 12
    c = schema.class(pk, 'baseclass');
    c.Description = 'abstract';
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    p = schema.prop(c, 'SpectrumType', 'string');
    p.AccessFlags.PublicGet = 'on';
    p.AccessFlags.PublicSet = 'off';
    p.FactoryValue = 'Jakes';
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    findclass(findpackage('handle'), 'listener');
    p = schema.prop(c, 'PropertyListener', 'handle.listener');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 31 32
    schema.event(c, 'DopplerSpectrumPropertiesChanged');
end % function
