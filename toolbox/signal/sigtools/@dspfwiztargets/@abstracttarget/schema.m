function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pk = findpackage('dspfwiztargets');
    % 8 9
    c = schema.class(pk, 'abstracttarget');
    c.Description = 'Abstract';
    % 11 13
    % 12 13
    p = schema.prop(c, 'Destination', 'string');
    p.Factoryvalue = 'Current';
    schema.prop(c, 'Blockname', 'string');
    schema.prop(c, 'OverwriteBlock', 'on/off');
    % 17 19
    % 18 19
    p = schema.prop(c, 'system', 'string');
    p.AccessFlags.PublicSet = 'off';
    p.Visible = 'off';
end % function
