function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    % 9 10
    c = schema.class(pk, 'ifiroptsframe', pk.findclass('abstractoptionsframe'));
    % 11 12
    p = schema.prop(c, 'InterpolationFactor', 'string');
    set(p, 'FactoryValue', '5');
    % 14 16
    % 15 16
    findclass(findpackage('filtdes'), 'ifir');
    % 17 18
    p = schema.prop(c, 'Optimization', 'ifirOptimization');
    set(p, 'FactoryValue', 'intermediate');
end % function
