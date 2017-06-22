function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('dfilt');
    % 9 10
    c = schema.class(pk, 'filterquantizer');
    % 11 12
    p = schema.prop(c, 'ncoeffs', 'mxArray');
    p.FactoryValue = 1.0;
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 16 17
    p = schema.prop(c, 'nphases', 'mxArray');
    p.FactoryValue = 1.0;
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 21 22
    p = schema.prop(c, 'loggingreport', 'mxArray');
    p.AccessFlags.PublicSet = 'Off';
    p.Visible = 'off';
    % 25 27
    % 26 27
    schema.event(c, 'quantizecoeffs');
    % 28 30
    % 29 30
    schema.event(c, 'quantizestates');
    % 31 33
    % 32 33
    schema.event(c, 'adddynprop');
end % function
