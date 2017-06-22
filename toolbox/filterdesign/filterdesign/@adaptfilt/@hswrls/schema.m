function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('adaptfilt');
    % 9 11
    % 10 11
    c = schema.class(pk, 'hswrls', findclass(pk, 'hrls'));
    % 12 14
    % 13 14
    p = schema.prop(c, 'SwBlockLength', 'spt_uint32');
    p.FactoryValue = 16.0;
    p.SetFunction = @set_blocklen;
    % 17 18
    p = schema.prop(c, 'DesiredSignalStates', 'double_vector');
    p.FactoryValue = zeros(15.0, 1.0);
    p.SetFunction = @set_dstates;
    p.Description = 'capture';
end % function
