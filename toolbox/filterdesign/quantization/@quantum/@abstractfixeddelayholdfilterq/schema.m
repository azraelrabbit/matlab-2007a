function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'abstractfixeddelayholdfilterq', findclass(pk, 'abstractfixedinfilterq'));
    % 10 11
    findpackage('sigdatatypes');
    % 12 14
    % 13 14
    p = schema.prop(c, 'OutputWordLength', 'posint');
    p.AccessFlags.AbortSet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Init = 'off';
    p.GetFunction = @getoutputwordlength;
    % 19 20
    p = schema.prop(c, 'OutputFracLength', 'int32');
    p.AccessFlags.AbortSet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Init = 'off';
    p.GetFunction = @getoutputfraclength;
end % function
