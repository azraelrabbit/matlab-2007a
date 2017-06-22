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
    c = schema.class(pk, 'cremez', pk.findclass('abstractSingleOrderMethod'));
    % 11 13
    % 12 13
    p = schema.prop(c, 'DensityFactor', 'spt_uint32');
    set(p, 'FactoryValue', 25.0);
    % 15 16
    if isempty(findtype('cremezSymmetryConstraint'))
        schema.EnumType('cremezSymmetryConstraint', {'Default','None','Even','Odd','Real'});
    end % if
    % 19 20
    schema.prop(c, 'SymmetryConstraint', 'cremezSymmetryConstraint');
    p = schema.prop(c, 'SecondStageOptimization', 'on/off');
    set(p, 'FactoryValue', 'On');
    % 23 24
    if isempty(findtype('cremezDebugMode'))
        schema.EnumType('cremezDebugMode', {'Off','Trace','Plots','Both'});
    end % if
    % 27 28
    schema.prop(c, 'DebugMode', 'cremezDebugMode');
end % function
