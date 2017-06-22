function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('mfilt');
    c = schema.class(pk, 'firsrc', pk.findclass('abstractsrc'));
    % 10 11
    p = schema.prop(c, 'PolyphaseSelector', 'MATLAB array');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.SetFunction = @set_polyselect;
    p.FactoryValue = uint32(0.0);
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    p = schema.prop(c, 'Arithmetic', 'filterdesign_arith');
    p.AccessFlags.AbortSet = 'off';
    p.GetFunction = @get_arith;
    p.SetFunction = @set_arith;
    if not(isfdtbxinstalled)
        p.AccessFlags.PublicGet = 'off';
        p.AccessFlags.PublicSet = 'off';
    end % if
end % function
