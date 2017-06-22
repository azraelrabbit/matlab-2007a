function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkg = findpackage('hdsviewer');
    % 10 12
    % 11 12
    supclass = findclass(findpackage('hdsviewer'), 'filter_variable');
    c = schema.class(pkg, 'filter_numeric', supclass);
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    if isempty(findtype('HDSOperatorTypes_Numeric'))
        schema.EnumType('HDSOperatorTypes_Numeric', {'>=','<=','=='});
    end % if
    p = schema.prop(c, 'SelectedOperator', 'HDSOperatorTypes_Numeric');
    p.FactoryValue = '>=';
    % 23 24
    schema.prop(c, 'Listener_Operator', 'handle');
    % 25 26
    p = schema.prop(c, 'SelectedValue', 'double');
    p.FactoryValue = NaN;
    % 28 29
    schema.prop(c, 'Listener_Value', 'handle');
    % 30 32
    % 31 32
    schema.prop(c, 'MinValue', 'double');
    schema.prop(c, 'MaxValue', 'double');
    % 34 37
    % 35 37
    % 36 37
    schema.prop(c, 'MajorTickSpacing', 'double');
    schema.prop(c, 'MinorTickSpacing', 'double');
end % function
