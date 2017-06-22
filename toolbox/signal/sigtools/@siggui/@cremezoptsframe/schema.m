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
    c = schema.class(pk, 'cremezoptsframe', pk.findclass('remezoptionsframe'));
    % 12 15
    % 13 15
    % 14 15
    findclass(findpackage('filtdes'), 'cremez');
    % 16 17
    schema.prop(c, 'SymmetryConstraint', 'cremezSymmetryConstraint');
    p = schema.prop(c, 'SecondStageOptimization', 'on/off');
    set(p, 'FactoryValue', 'On');
end % function
