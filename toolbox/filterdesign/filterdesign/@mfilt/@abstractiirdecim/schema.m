function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('mfilt');
    c = schema.class(pk, 'abstractiirdecim', pk.findclass('abstractiirmultirate'));
    % 10 11
    set(c, 'Description', 'abstract');
    % 12 13
    p = schema.prop(c, 'DecimationFactor', 'posint');
    p.AccessFlags.PublicSet = 'off';
    p.GetFunction = @get_decimationfactor;
    % 16 17
    p = schema.prop(c, 'InputOffset', 'spt_uint32');
    p.FactoryValue = 0.0;
    p.SetFunction = @set_inputoffset;
    % 20 21
    p = schema.prop(c, 'PolyphaseAccum', 'mxArray');
    p.FactoryValue = [];
    p.AccessFlags.AbortSet = 'off';
end % function
