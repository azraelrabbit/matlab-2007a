function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('mfilt');
    c = schema.class(pk, 'abstractcicinterp', pk.findclass('abstractcic'));
    set(c, 'Description', 'abstract');
    % 11 12
    findpackage('sigdatatypes');
    p = schema.prop(c, 'InterpolationFactor', 'posint');
    set(p, 'FactoryValue', 2.0, 'SetFunction', @setinterp, 'GetFunction', @getinterp);
end % function
