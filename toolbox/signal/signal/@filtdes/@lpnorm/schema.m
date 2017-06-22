function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('filtdes');
    % 9 11
    % 10 11
    c = schema.class(pk, 'lpnorm', findclass(pk, 'abstractDesignMethodwFs'));
    c.description = 'abstract';
    % 13 15
    % 14 15
    p = schema.prop(c, 'Pnorm', 'evenuint32');
    p.FactoryValue = 128.0;
    % 17 18
    p = schema.prop(c, 'initPnorm', 'evenuint32');
    p.FactoryValue = 2.0;
    % 20 21
    p = schema.prop(c, 'DensityFactor', 'spt_uint32');
    p.FactoryValue = 20.0;
end % function
