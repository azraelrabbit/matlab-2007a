function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    c = schema.class(findpackage('hdsviewer'), 'filterctrl');
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    schema.prop(c, 'Name', 'string');
    % 15 17
    % 16 17
    schema.prop(c, 'DataSet', 'MATLAB array');
    schema.prop(c, 'DerivedVarExpressions', 'MATLAB array');
    schema.prop(c, 'GroupedVariables', 'MATLAB array');
    % 20 22
    % 21 22
    schema.prop(c, 'filters', 'MATLAB array');
    % 23 25
    % 24 25
    p = schema.prop(c, 'filteredindex', 'MATLAB array');
    p.FactoryValue = [];
    p = schema.prop(c, 'filteredindexcache', 'MATLAB array');
    p.FactoryValue = [];
    % 29 31
    % 30 31
    schema.prop(c, 'absoluteindex', 'MATLAB array');
    % 32 34
    % 33 34
    p = schema.prop(c, 'selectedgridpoint', 'double');
    p.FactoryValue = NaN;
    % 36 38
    % 37 38
    p = schema.prop(c, 'step_active', 'on/off');
    p.FactoryValue = 'off';
    schema.prop(c, 'Listener_StepActive', 'handle');
    p = schema.prop(c, 'step_selection', 'double');
    p.FactoryValue = 1.0;
    schema.prop(c, 'Listener_StepSelection', 'handle');
    % 44 46
    % 45 46
    p = schema.prop(c, 'Listeners_', 'MATLAB array');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Serialize = 'off';
    % 50 51
    schema.prop(c, 'jHandle', 'MATLAB array');
    % 52 53
    schema.event(c, 'SelectionChange');
end % function
