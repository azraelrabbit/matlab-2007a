function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    package = findpackage('rfckt');
    parent = findclass(package, 'network');
    % 9 11
    % 10 11
    h = schema.class(package, 'cascade', parent);
    % 12 14
    % 13 14
    p = schema.prop(h, 'BudgetData', 'handle');
    p.FactoryValue = [];
    p.Description = 'Budget Data';
    p.Visible = 'off';
end % function
