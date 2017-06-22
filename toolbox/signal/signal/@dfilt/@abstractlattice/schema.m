function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    package = findpackage('dfilt');
    parent = findclass(package, 'singleton');
    % 10 11
    thisclass = schema.class(package, 'abstractlattice', parent);
    set(thisclass, 'Description', 'abstract');
    % 13 14
    p = schema.prop(thisclass, 'Arithmetic', 'filterdesign_arith');
    p.AccessFlags.AbortSet = 'off';
    p.GetFunction = @get_arith;
    p.SetFunction = @set_arith;
    if not(isfdtbxinstalled)
        p.AccessFlags.PublicGet = 'off';
        p.AccessFlags.PublicSet = 'off';
    end % if
    set(p, 'AccessFlags.Serialize', 'off', 'AccessFlags.Init', 'Off');
    % 23 24
    p = schema.prop(thisclass, 'Lattice', 'mxArray');
    p.SetFunction = @setlattice;
    p.GetFunction = @getlattice;
    % 27 29
    % 28 29
    p = schema.prop(thisclass, 'privlattice', 'DFILTCoefficientVector');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.AbortSet = 'off';
    % 33 34
    p = schema.prop(thisclass, 'privconjlattice', 'DFILTCoefficientVector');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.AbortSet = 'off';
    % 38 40
    % 39 40
    p = schema.prop(thisclass, 'reflattice', 'DFILTCoefficientVector');
    p.SetFunction = @setreflattice;
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.AbortSet = 'off';
end % function
