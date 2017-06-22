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
    c = schema.class(pk, 'abstractNumDenOrderMethod', findclass(pk, 'abstractDesignMethodwFs'));
    c.description = 'abstract';
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    p = schema.prop(c, 'numOrder', 'spt_uint32');
    p.SetFunction = @set_numorder;
    p.GetFunction = @get_numorder;
    % 20 21
    p = schema.prop(c, 'denOrder', 'spt_uint32');
    p.SetFunction = @set_denorder;
    p.GetFunction = @get_denorder;
    % 24 26
    % 25 26
    findclass(pk, 'numDenFilterOrder');
    p = schema.prop(c, 'numDenFilterOrderObj', 'filtdes.numDenFilterOrder');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
end % function
