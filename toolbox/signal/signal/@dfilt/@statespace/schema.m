function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    package = findpackage('dfilt');
    parent = findclass(package, 'singleton');
    % 12 13
    thisclass = schema.class(package, 'statespace', parent);
    % 14 15
    findpackage('sigdatatypes');
    p = schema.prop(thisclass, 'A', 'mxArray');
    p.GetFunction = @geta;
    p.SetFunction = @seta;
    p.FactoryValue = [];
    % 20 21
    p = schema.prop(thisclass, 'B', 'mxArray');
    p.GetFunction = @getb;
    p.SetFunction = @setb;
    p.FactoryValue = zeros(0.0, 1.0);
    % 25 26
    p = schema.prop(thisclass, 'C', 'mxArray');
    p.GetFunction = @getc;
    p.SetFunction = @setc;
    p.FactoryValue = zeros(1.0, 0.0);
    % 30 31
    p = schema.prop(thisclass, 'D', 'mxArray');
    p.GetFunction = @getd;
    p.SetFunction = @setd;
    p.FactoryValue = 1.0;
    % 35 37
    % 36 37
    p = schema.prop(thisclass, 'privA', 'signalNumeric');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Init = 'off';
    % 41 42
    p = schema.prop(thisclass, 'privB', 'signalNumeric');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Init = 'off';
    % 46 47
    p = schema.prop(thisclass, 'privC', 'signalNumeric');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Init = 'off';
    % 51 52
    p = schema.prop(thisclass, 'privD', 'double');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Init = 'off';
    % 56 58
    % 57 58
    p = schema.prop(thisclass, 'refA', 'signalNumeric');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Init = 'off';
    % 62 63
    p = schema.prop(thisclass, 'refB', 'signalNumeric');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Init = 'off';
    % 67 68
    p = schema.prop(thisclass, 'refC', 'signalNumeric');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Init = 'off';
    % 72 73
    p = schema.prop(thisclass, 'refD', 'double');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Init = 'off';
end % function
