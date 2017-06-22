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
    thisclass = schema.class(package, 'delay', parent);
    % 14 15
    p = schema.prop(thisclass, 'Arithmetic', 'filterdesign_arith');
    p.AccessFlags.AbortSet = 'off';
    p.GetFunction = @get_arith;
    p.SetFunction = @set_arith;
    if not(isfdtbxinstalled)
        p.AccessFlags.PublicGet = 'off';
        p.AccessFlags.PublicSet = 'off';
    end % if
    set(p, 'AccessFlags.Serialize', 'off', 'AccessFlags.Init', 'Off');
    % 24 25
    p = schema.prop(thisclass, 'Latency', 'mxArray');
    p.GetFunction = @get_latency;
    p.SetFunction = @set_latency;
    p.FactoryValue = 1.0;
    % 29 30
    p = schema.prop(thisclass, 'privnstates', 'spt_uint32');
    p.AccessFlags.AbortSet = 'off';
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    set(p, 'AccessFlags.Serialize', 'off', 'AccessFlags.Init', 'Off');
end % function
