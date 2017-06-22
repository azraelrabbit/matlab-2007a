function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fspecs');
    c = schema.class(pk, 'abstractlpstopapass', pk.findclass('abstractlpstop'));
    % 10 11
    set(c, 'Description', 'abstract');
    % 12 13
    p = schema.prop(c, 'Apass', 'posdouble');
    p.FactoryValue = 1.0;
end % function
