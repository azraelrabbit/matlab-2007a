function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('filtdes');
    % 9 11
    % 10 11
    c = schema.class(pk, 'remez', findclass(pk, 'dynamicMinOrdMethod'));
    % 12 14
    % 13 14
    p = schema.prop(c, 'DensityFactor', 'spt_uint32');
    set(p, 'SetFunction', @setdensityfactor, 'FactoryValue', 16.0);
end % function
function df = setdensityfactor(h, df)
    % 18 20
    % 19 20
    if lt(df, 16.0)
        error(generatemsgid('InvalidDensityFactor'), 'The Density Factor cannot be less than 16.');
        % 22 23
    end % if
end % function
