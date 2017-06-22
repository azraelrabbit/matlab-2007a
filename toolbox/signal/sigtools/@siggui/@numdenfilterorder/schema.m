function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    % 9 11
    % 10 11
    c = schema.class(pk, 'numdenfilterorder', pk.findclass('sigcontainer'));
    % 12 15
    % 13 15
    % 14 15
    p = schema.prop(c, 'NumOrder', 'string');
    set(p, 'Description', 'Numerator order');
    % 17 19
    % 18 19
    p = schema.prop(c, 'DenOrder', 'string');
    set(p, 'Description', 'Denominator order');
end % function
