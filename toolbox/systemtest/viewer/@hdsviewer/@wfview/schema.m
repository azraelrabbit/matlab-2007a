function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    superclass = findclass(findpackage('wrfc'), 'view');
    c = schema.class(findpackage('hdsviewer'), 'wfview', superclass);
    % 11 13
    % 12 13
    schema.prop(c, 'Style', 'string');
    schema.prop(c, 'Patches', 'MATLAB array');
    p = schema.prop(c, 'SelectionMode', 'on/off');
    p.FactoryValue = 'on';
    schema.prop(c, 'SelectionMarker', 'MATLAB array');
    % 18 19
    schema.event(c, 'Selection');
end % function
