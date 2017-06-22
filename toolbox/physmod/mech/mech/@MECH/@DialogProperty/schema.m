function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('MECH');
    cls = schema.class(pkg, 'DialogProperty');
    % 9 10
    schema.prop(cls, 'Name', 'string');
    % 11 13
    % 12 13
    schema.prop(cls, 'WidgetType', 'string');
    schema.prop(cls, 'Eval', 'bool');
    schema.prop(cls, 'Entries', 'string vector');
    schema.prop(cls, 'IsUnit', 'bool');
    schema.prop(cls, 'HasUnit', 'bool');
end % function
