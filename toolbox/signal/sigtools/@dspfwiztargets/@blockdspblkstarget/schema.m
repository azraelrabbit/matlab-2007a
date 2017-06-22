function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pk = findpackage('dspfwiztargets');
    % 8 10
    % 9 10
    c = schema.class(pk, 'blockdspblkstarget', pk.findclass('blocktarget'));
    c.Description = 'Signal Processing Blockset Filter blocks';
    % 12 15
    % 13 15
    % 14 15
    p = schema.prop(c, 'BlockHandle', 'mxArray');
    p.Visible = 'off';
end % function
