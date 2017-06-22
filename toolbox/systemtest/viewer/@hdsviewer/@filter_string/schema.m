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
    c = schema.class(pkg, 'filter_string', supclass);
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    p = schema.prop(c, 'strings', 'string vector');
    % 19 21
    % 20 21
    if isempty(findtype('HDSOperatorTypes_String'))
        schema.EnumType('HDSOperatorTypes_String', {'is','not'});
    end % if
    p = schema.prop(c, 'SelectedOperator', 'HDSOperatorTypes_String');
    p.FactoryValue = 'is';
    % 26 27
    schema.prop(c, 'Listener_Operator', 'handle');
    % 28 30
    % 29 30
    schema.prop(c, 'SelectedValue', 'string');
    % 31 32
    schema.prop(c, 'Listener_Value', 'handle');
end % function
