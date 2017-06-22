function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdfmethod');
    c = schema.class(pk, 'eqriphpmin', findclass(findpackage('fmethod'), 'eqriphpmin'));
    % 10 11
    p = schema.prop(c, 'MinOrder', 'minorderrestrict');
end % function
