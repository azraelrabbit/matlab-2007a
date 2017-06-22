function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('filtdes');
    % 9 10
    c = schema.class(pk, 'ifir', pk.findclass('abstractNoOrderMethod'));
    % 11 12
    p = schema.prop(c, 'InterpolationFactor', 'double');
    set(p, 'FactoryValue', 5.0);
    % 14 15
    if isempty(findtype('ifirOptimization'))
        schema.EnumType('ifirOptimization', {'Simple','Intermediate','Advanced'});
    end % if
    % 18 19
    p = schema.prop(c, 'Optimization', 'ifirOptimization');
    set(p, 'FactoryValue', 'Intermediate');
end % function
