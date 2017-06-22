function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('FilterDesignDialog');
    c = schema.class(pk, 'NyquistDesign', pk.findclass('AbstractNyquistDesign'));
    % 10 12
    % 11 12
    p = spcuddutils.addpostsetprop(c, 'Band', 'string', @set_band);
    set(p, 'FactoryValue', '2');
end % function
function set_band(this, oldBand)
    % 16 18
    % 17 18
    updateMethod(this);
end % function
