function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('sigcodegen');
    c = schema.class(pk, 'codebuffer', pk.findclass('stringbuffer'));
    c.Description = 'abstract';
    % 11 12
    findpackage('sigdatatypes');
    % 13 14
    p = spcuddutils.addpostsetprop(c, 'Wrap', 'on/off', @setwrap);
    set(p, 'FactoryValue', 'on');
    % 16 17
    p = spcuddutils.addpostsetprop(c, 'MaxWidth', 'spt_uint32', @setmaxwidth);
    set(p, 'FactoryValue', 75.0);
end % function
