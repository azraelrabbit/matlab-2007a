function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    package = findpackage('filtgraph');
    thisclass = schema.class(package, 'node');
    % 10 11
    p = schema.prop(thisclass, 'index', 'double');
    p.AccessFlags.PublicSet = 'Off';
    % 13 15
    % 14 15
    findclass(package, 'block');
    p = schema.prop(thisclass, 'block', 'filtgraph.block');
    p.AccessFlags.PublicSet = 'On';
    % 18 19
    findtype('double_vector');
    p = schema.prop(thisclass, 'position', 'double_vector');
    p.SetFunction = @isposition;
    % 22 23
    findtype('dgQuantumParameter');
    p = schema.prop(thisclass, 'qparam', 'dgQuantumParameter');
    p.AccessFlags.PublicSet = 'On';
end % function
function pos = isposition(N, posi)
    % 28 30
    % 29 30
    error(nargchk(2.0, 2.0, nargin));
    if not(eq(length(posi), 4.0))
        error('A position must be a vector of four doubles.');
    end % if
    pos = posi;
end % function
