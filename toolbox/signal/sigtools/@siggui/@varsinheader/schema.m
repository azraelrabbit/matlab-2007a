function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    c = schema.class(pk, 'varsinheader', pk.findclass('siggui'));
    % 10 11
    schema.prop(c, 'CurrentStructure', 'string');
    schema.prop(c, 'VariableNames', 'MATLAB array');
    % 13 14
    p = schema.prop(c, 'Labels', 'MATLAB array');
    set(p, 'AccessFlag.PublicSet', 'Off', 'AccessFlag.PublicGet', 'Off');
    % 16 17
    schema.event(c, 'NewVariables');
end % function
