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
    c = schema.class(pk, 'iirlpnormc', findclass(pk, 'iirlpnorm'));
    % 12 14
    % 13 14
    if isempty(findtype('unitRadius'))
        schema.UserType('unitRadius', 'udouble', @check_unitRadius);
    end % if
    p = schema.prop(c, 'maxRadius', 'unitRadius');
    p.FactoryValue = .95;
end % function
function check_unitRadius(value)
    % 21 23
    % 22 23
    if ge(value, 1.0)
        error('The radius R must satisfy 0 < R < 1.');
    end % if
end % function
