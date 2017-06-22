function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('dspopts');
    c = schema.class(pk, 'abstractspectrum', pk.findclass('abstractoptionswfs'));
    set(c, 'Description', 'abstract');
    % 11 12
    p = schema.prop(c, 'CenterDC', 'mxArray');
    p.AccessFlags.Serialize = 'Off';
    p.AccessFlags.init = 'off';
    p.SetFunction = @set_centerdc;
    p.GetFunction = @get_centerdc;
    % 17 18
    p = schema.prop(c, 'privcenterdc', 'bool');
    p.FactoryValue = false;
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
end % function
