function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('mfilt');
    c = schema.class(pk, 'abstractfirdecim', pk.findclass('abstractfirmultirate'));
    c.Description = 'abstract';
    % 11 12
    dpk = findpackage('sigdatatypes');
    findclass(dpk, 'posint');
    p = schema.prop(c, 'DecimationFactor', 'posint');
    p.FactoryValue = 2.0;
    p.SetFunction = @setdecim;
    p.GetFunction = @getdecim;
    % 18 19
    p = schema.prop(c, 'Arithmetic', 'filterdesign_arith');
    p.AccessFlags.AbortSet = 'off';
    p.GetFunction = @get_arith;
    p.SetFunction = @set_arith;
    if not(isfdtbxinstalled)
        p.AccessFlags.PublicGet = 'off';
        p.AccessFlags.PublicSet = 'off';
    end % if
    set(p, 'AccessFlags.Init', 'Off');
    % 28 29
    p = schema.prop(c, 'PolyphaseAccum', 'mxArray');
    p.FactoryValue = [];
    p.SetFunction = @set_polyphaseaccum;
    p.AccessFlags.AbortSet = 'off';
    % 33 34
    p = schema.prop(c, 'InputOffset', 'spt_uint32');
    p.FactoryValue = 0.0;
    p.SetFunction = @set_inputoffset;
end % function
