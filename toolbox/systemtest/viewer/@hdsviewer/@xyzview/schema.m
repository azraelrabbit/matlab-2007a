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
    c = schema.class(findpackage('hdsviewer'), 'xyzview', superclass);
    % 11 13
    % 12 13
    schema.prop(c, 'Surface', 'MATLAB array');
    p = schema.prop(c, 'Style', 'string');
    p.FactoryValue = 'surf';
    p = schema.prop(c, 'Envelope', 'on/off');
    p.FactoryValue = 'off';
    p = schema.prop(c, 'EnvelopeLimit', 'MATLAB array');
    p.FactoryValue = 20.0;
    schema.prop(c, 'EnvelopeEdges', 'MATLAB array');
    schema.prop(c, 'SelectionMarker', 'MATLAB array');
    p = schema.prop(c, 'SelectionMode', 'on/off');
    p.FactoryValue = 'on';
    % 24 26
    % 25 26
    schema.event(c, 'Selection');
end % function
