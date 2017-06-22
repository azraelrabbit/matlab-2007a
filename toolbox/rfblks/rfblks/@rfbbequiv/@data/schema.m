function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    package = findpackage('rfbbequiv');
    parent = findclass(findpackage('rfdata'), 'data');
    % 9 10
    h = schema.class(package, 'data', parent);
    % 11 13
    % 12 13
    p = schema.prop(h, 'CompositePlot', 'bool');
    p.FactoryValue = false;
    p.Description = 'Composite Plot Flag';
    p.Visible = 'Off';
    % 17 18
    p = schema.prop(h, 'FigureTag', 'string');
    p.FactoryValue = '';
    p.Description = 'Figure Tag';
    p.Visible = 'Off';
end % function
