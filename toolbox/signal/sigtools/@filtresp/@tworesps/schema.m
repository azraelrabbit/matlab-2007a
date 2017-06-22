function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('filtresp');
    c = schema.class(pk, 'tworesps', findclass(findpackage('sigresp'), 'twoanalyses'));
    % 10 11
    findclass(pk, 'filterutils');
    p = schema.prop(c, 'FilterUtils', 'filtresp.filterutils');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
end % function
