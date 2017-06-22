function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    package = findpackage('filtgraph');
    % 9 10
    parent = findclass(package, 'dgraph');
    thisclass = schema.class(package, 'dg', parent);
    % 12 13
    p = schema.prop(thisclass, 'label', 'string');
    p.FactoryValue = 'dg';
    p.AccessFlags.Init;
    % 16 17
    findtype('double_vector');
    p = schema.prop(thisclass, 'position', 'double_vector');
    p.SetFunction = @isposition;
    % 20 21
    p = schema.prop(thisclass, 'effNdIdx', 'double_vector');
    % 22 30
    % 23 30
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    p = schema.prop(thisclass, 'typeIdx', 'double_vector');
end % function
function pos = isposition(Dg, posi)
    % 33 43
    % 34 43
    % 35 43
    % 36 43
    % 37 43
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    % 42 43
    error(nargchk(2.0, 2.0, nargin));
    % 44 45
    if not(eq(length(posi), 4.0))
        error('A position must be a vector of four doubles.');
    end % if
    % 48 49
    pos = posi;
end % function
