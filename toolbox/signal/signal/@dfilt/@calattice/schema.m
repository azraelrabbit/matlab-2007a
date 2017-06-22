function schema
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    package = findpackage('dfilt');
    parent = findclass(package, 'coupledallpass');
    % 16 17
    thisclass = schema.class(package, 'calattice', parent);
    % 18 20
    % 19 20
    findclass(package, 'latticeallpass');
    % 21 22
    p = schema.prop(thisclass, 'Allpass1', 'mxArray');
    p.GetFunction = @getallpass1;
    p.SetFunction = @setallpass1;
    % 25 26
    p = schema.prop(thisclass, 'Allpass2', 'mxArray');
    p.GetFunction = @getallpass2;
    p.SetFunction = @setallpass2;
    % 29 31
    % 30 31
    p = schema.prop(thisclass, 'Beta', 'mxArray');
    p.GetFunction = @getbeta;
    p.SetFunction = @setbeta;
    p.FactoryValue = 1.0;
    % 35 37
    % 36 37
    p = schema.prop(thisclass, 'Allpass1q', 'DFILTCoefficientVector');
    p.SetFunction = @setallpass1q;
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Init = 'Off';
    % 42 43
    p = schema.prop(thisclass, 'Allpass2q', 'DFILTCoefficientVector');
    p.SetFunction = @setallpass2q;
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Init = 'Off';
    % 48 49
    p = schema.prop(thisclass, 'privBeta', 'DFILTScalar');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Init = 'Off';
    % 53 55
    % 54 55
    p = schema.prop(thisclass, 'refAllpass1', 'DFILTCoefficientVector');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Init = 'Off';
    % 59 60
    p = schema.prop(thisclass, 'refAllpass2', 'DFILTCoefficientVector');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Init = 'Off';
    % 64 65
    p = schema.prop(thisclass, 'refBeta', 'DFILTScalar');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Init = 'Off';
    % 69 71
    % 70 71
    p = schema.prop(thisclass, 'privAllpass1', 'dfilt.latticeallpass');
    p.AccessFlags.PublicGet = 'Off';
    p.AccessFlags.PublicSet = 'Off';
    % 74 75
    p = schema.prop(thisclass, 'privAllpass2', 'dfilt.latticeallpass');
    p.AccessFlags.PublicGet = 'Off';
    p.AccessFlags.PublicSet = 'Off';
end % function
