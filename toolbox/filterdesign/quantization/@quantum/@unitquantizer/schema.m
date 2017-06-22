function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pk = findpackage('quantum');
    cls = findclass(pk, 'quantizer');
    % 11 14
    % 12 14
    % 13 14
    c = schema.class(pk, 'unitquantizer', cls);
end % function
