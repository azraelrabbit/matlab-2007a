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
    c = schema.class(pk, 'blocktarget', pk.findclass('abstracttarget'));
    c.Description = 'Abstract';
    % 12 13
    schema.prop(c, 'MapStates', 'on/off');
    % 14 15
    schema.prop(c, 'Link2Obj', 'on/off');
end % function
