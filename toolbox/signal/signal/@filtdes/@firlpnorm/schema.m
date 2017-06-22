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
    c = schema.class(pk, 'firlpnorm', findclass(pk, 'lpnorm'));
    % 12 15
    % 13 15
    % 14 15
    p = schema.prop(c, 'minPhase', 'on/off');
    p.FactoryValue = 'off';
    % 17 18
    p = schema.prop(c, 'initNum', 'MATLAB array');
    p.FactoryValue = [];
    % 20 23
    % 21 23
    % 22 23
    p = schema.prop(c, 'order', 'spt_uint32');
    p.FactoryValue = 20.0;
end % function
