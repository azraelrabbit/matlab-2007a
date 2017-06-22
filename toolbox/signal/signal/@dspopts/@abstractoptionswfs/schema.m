function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('dspopts');
    c = schema.class(pk, 'abstractoptionswfs');
    set(c, 'Description', 'abstract');
    % 11 12
    p = schema.prop(c, 'NormalizedFrequency', 'bool');
    p.FactoryValue = true;
    % 14 15
    p = schema.prop(c, 'Fs', 'mxArray');
    p.AccessFlags.init = 'off';
    p.SetFunction = @set_fs;
    p.GetFunction = @get_fs;
    p.AccessFlags.Serialize = 'Off';
    % 20 21
    p = schema.prop(c, 'privFs', 'posdouble');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.FactoryValue = 1.0;
end % function
