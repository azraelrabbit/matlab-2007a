function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pk = findpackage('filtdes');
    % 10 12
    % 11 12
    c = schema.class(pk, 'iirlpnorm', findclass(pk, 'lpnorm'));
    % 13 15
    % 14 15
    p = schema.prop(c, 'initNum', 'MATLAB array');
    p.FactoryValue = [];
    % 17 18
    p = schema.prop(c, 'initDen', 'MATLAB array');
    p.FactoryValue = [];
    % 20 23
    % 21 23
    % 22 23
    p = schema.prop(c, 'numOrder', 'spt_uint32');
    p.SetFunction = @set_numorder;
    p.GetFunction = @get_numorder;
    % 26 27
    p = schema.prop(c, 'denOrder', 'spt_uint32');
    p.SetFunction = @set_denorder;
    p.GetFunction = @get_denorder;
    % 30 32
    % 31 32
    findclass(pk, 'numDenFilterOrder');
    p = schema.prop(c, 'numDenFilterOrderObj', 'filtdes.numDenFilterOrder');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
end % function
