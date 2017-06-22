function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdadesignpanel');
    % 9 11
    % 10 11
    c = schema.class(pk, 'magnyquist', findclass(pk, 'abstractfiltertype'));
    % 12 14
    % 13 14
    p = schema.prop(c, 'DesignType', 'magnyquistDesignType');
    p.Description = 'spec';
end % function
