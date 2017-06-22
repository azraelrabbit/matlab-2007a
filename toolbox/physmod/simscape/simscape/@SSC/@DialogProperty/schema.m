function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkg = findpackage('SSC');
    cls = schema.class(pkg, 'DialogProperty');
    % 11 12
    schema.prop(cls, 'Name', 'string');
    schema.prop(cls, 'Label', 'string');
    schema.prop(cls, 'Group', 'string');
    schema.prop(cls, 'GroupDesc', 'string');
    schema.prop(cls, 'WidgetType', 'string');
    schema.prop(cls, 'Eval', 'bool');
    schema.prop(cls, 'Entries', 'string vector');
    schema.prop(cls, 'IsUnit', 'bool');
    schema.prop(cls, 'HasUnit', 'bool');
end % function
