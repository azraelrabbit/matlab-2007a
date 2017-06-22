function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('mfilt');
    c = schema.class(pk, 'abstractfirinterp', pk.findclass('abstractfirmultirate'));
    set(c, 'Description', 'abstract');
    % 11 12
    dpk = findpackage('sigdatatypes');
    findclass(dpk, 'posint');
    p = schema.prop(c, 'InterpolationFactor', 'posint');
    p.FactoryValue = 2.0;
    p.SetFunction = @setinterp;
    p.GetFunction = @getinterp;
end % function
