function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('mfilt');
    c = schema.class(pk, 'abstractfirfrac', pk.findclass('abstractsrc'));
    c.Description = 'abstract';
    % 11 12
    p = schema.prop(c, 'PolyphaseDelays', 'mxArray');
    p.FactoryValue = [1.0 1.0];
    p.AccessFlags.PublicGet = 'Off';
    p.AccessFlags.PublicSet = 'Off';
end % function
