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
    c = schema.class(pk, 'iirgrpdelay', findclass(pk, 'lpnorm'));
    % 12 15
    % 13 15
    % 14 15
    p = schema.prop(c, 'maxRadius', 'double0t1');
    p.FactoryValue = .95;
    % 17 20
    % 18 20
    % 19 20
    p = schema.prop(c, 'order', 'spt_uint32');
    p.FactoryValue = 8.0;
    % 22 23
    p = schema.prop(c, 'initDen', 'MATLAB array');
    p.FactoryValue = [];
end % function
